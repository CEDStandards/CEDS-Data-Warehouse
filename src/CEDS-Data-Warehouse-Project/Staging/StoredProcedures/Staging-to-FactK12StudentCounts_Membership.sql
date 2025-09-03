
/**********************************************************************
Author: AEM Corp
Date:	2/17/2023
Description: Migrates Membership Data FROM Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 033, 052
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_Membership]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwUnduplicatedRaceMap') IS NOT NULL DROP TABLE #vwUnduplicatedRaceMap
		IF OBJECT_ID(N'tempdb..#vwEconomicallyDisadvantagedStatuses') IS NOT NULL DROP TABLE #vwEconomicallyDisadvantagedStatuses

		DECLARE 
		--@SchoolYear SMALLINT = 2024,

		@FactTypeId INT,
		@SchoolYearId int,
		@SYStartDate date,
		@SYEndDate date,
		@MembershipDate date
		
		SET @SYStartDate = Staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = Staging.GetFiscalYearEndDate(@SchoolYear)

	--Get the Membership date from Toggle (if set)
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SELECT @MembershipDate = tr.ResponseValue
		FROM App.ToggleQuestions tq
		JOIN App.ToggleResponses tr
			ON tq.ToggleQuestionId = tr.ToggleQuestionId
		WHERE tq.EmapsQuestionAbbrv = 'MEMBERDTE'
 
		IF ISNULL(@MembershipDate, '') = ''
		BEGIN
			SELECT @MembershipDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-10-01' AS DATE)
		END
		ELSE 
		BEGIN
			SELECT @MembershipDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-' + CAST(MONTH(@MembershipDate) AS VARCHAR(2)) + '-' + CAST(DAY(@MembershipDate) AS VARCHAR(2)) AS DATE)
		END

	--Check if Grade 13, Ungraded, and/or Adult Education should be included based on Toggle responses
		DECLARE @toggleGrade13 AS BIT
		DECLARE @toggleUngraded AS BIT
		DECLARE @toggleAdultEd AS BIT

		SELECT  @toggleGrade13 = ISNULL( CASE WHEN r.ResponseValue = 'true' THEN 1 ELSE 0 END, 0 ) 
		FROM App.ToggleQuestions q 
		LEFT OUTER JOIN App.ToggleResponses r 
			ON r.ToggleQuestionId = q.ToggleQuestionId
		WHERE q.EmapsQuestionAbbrv = 'CCDGRADE13'

		SELECT @toggleUngraded = ISNULL( CASE WHEN r.ResponseValue = 'true' THEN 1 ELSE 0 END, 0 ) 
		FROM App.ToggleQuestions q 
		LEFT OUTER JOIN App.ToggleResponses r 
			ON r.ToggleQuestionId = q.ToggleQuestionId
		WHERE q.EmapsQuestionAbbrv = 'CCDUNGRADED'

		SELECT @toggleAdultEd = ISNULL( CASE WHEN r.ResponseValue = 'true' THEN 1 ELSE 0 END, 0 )  
		FROM App.ToggleQuestions q 
		LEFT OUTER JOIN App.ToggleResponses r 
			ON r.ToggleQuestionId = q.ToggleQuestionId
		WHERE q.EmapsQuestionAbbrv = 'ADULTEDU'

		--temp table to hold valid grades to be included 
		DECLARE @GradesList TABLE (GradeLevel varchar(3)) 
		INSERT INTO @GradesList VALUES ('PK'),('KG'),('01'),('02'),('03'),('04'),('05'),('06'),('07'),('08'),('09'),('10'),('11'),('12')

		--Add the 3 additional grade levels if they should be included
		IF @toggleGrade13 = 1
		INSERT INTO @GradesList VALUES ('13')

		IF @toggleUngraded = 1
		INSERT INTO @GradesList VALUES ('UG')

		IF @toggleAdultEd = 1
		INSERT INTO @GradesList VALUES ('ABE')

	--Get the set of students from DimPeople to be used for the migrated SY
		SELECT K12StudentStudentIdentifierState
			, max(DimPersonId)								DimPersonId
			, min(RecordStartDateTime)						RecordStartDateTime
			, MAX(ISNULL(RecordEndDateTime, @SYEndDate))	RecordEndDateTime
			, MAX(ISNULL(Birthdate, '1900-01-01'))			Birthdate
		into #dimPeople
		FROM RDS.DimPeople
		where ((RecordStartDateTime <= @SYStartDate and RecordEndDateTime > @SYStartDate)
			or (RecordStartDateTime > @SYStartDate and ISNULL(RecordEndDateTime, @SYEndDate) <= @SYEndDate))
		and IsActiveK12Student = 1
		group by K12StudentStudentIdentifierState
		order by K12StudentStudentIdentifierState

		create index IDX_dimPeople ON #dimPeople (K12StudentStudentIdentifierState, DimPersonId, RecordStartDateTime, RecordEndDateTime, Birthdate)

	--reset the RecordStartDateTime if the date is prior to the default start date of 7/1
		update #dimPeople
		set RecordStartDateTime = @SYStartDate
		where RecordStartDateTime < @SYStartDate

	--Create the temp tables (and any relevant indexes) needed for this domain
		SELECT *
		INTO #vwGradeLevels
		FROM RDS.vwDimGradeLevels
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwGradeLevels 
			ON #vwGradeLevels (GradeLevelTypeDescription, GradeLevelMap);

		SELECT *
		INTO #vwRaces
		FROM RDS.vwDimRaces
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwRaces 
			ON #vwRaces (RaceMap);

		SELECT * 
		INTO #vwUnduplicatedRaceMap 
		FROM RDS.vwUnduplicatedRaceMap
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwUnduplicatedRaceMap ON #vwUnduplicatedRaceMap (StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, RaceMap);

		SELECT * 
		INTO #vwEconomicallyDisadvantagedStatuses
		FROM RDS.vwDimEconomicallyDisadvantagedStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwEconomicallyDisadvantagedStatuses
			ON #vwEconomicallyDisadvantagedStatuses (EconomicDisadvantageStatusCode, EligibilityStatusForSchoolFoodServiceProgramsCode);

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM RDS.DimFactTypes
		WHERE FactTypeCode = 'membership' --FactTypeId = 6

		--Clear the Fact table of the data about to be migrated  
		DELETE RDS.FactK12StudentCounts
		WHERE SchoolYearId = @SchoolYearId 
			AND FactTypeId = @FactTypeId

		IF OBJECT_ID('tempdb..#Facts') IS NOT NULL 
			DROP TABLE #Facts
		
	--Create and load #Facts temp table
		CREATE TABLE #Facts (
			  SchoolYearId							int null
			, FactTypeId							int null
			, GradeLevelId							int null
			, AgeId									int null
			, RaceId								int null
			, K12DemographicId						int null
			, StudentCount							int null
			, SeaId									int null
			, IeuId									int null
			, LeaId									int null
			, K12SchoolId							int null
			, K12StudentId							int null
			, IdeaStatusId							int null
			, LanguageId							int null
			, MigrantStatusId						int null
			, TitleIStatusId						int null
			, TitleIIIStatusId						int null
			, AttendanceId							int null
			, CohortStatusId						int null
			, NOrDStatusId							int null
			, CteStatusId							int null
			, K12EnrollmentStatusId					int null
			, EnglishLearnerStatusId				int null
			, HomelessnessStatusId					int null
			, EconomicallyDisadvantagedStatusId		int null
			, FosterCareStatusId					int null
			, ImmigrantStatusId						int null
			, PrimaryDisabilityTypeId				int null
			, SpecialEducationServicesExitDateId	int null
			, MigrantStudentQualifyingArrivalDateId	int null
			, LastQualifyingMoveDateId				int null
		)

		INSERT INTO #Facts
		SELECT DISTINCT
			@SchoolYearId 												SchoolYearId
			, @FactTypeId												FactTypeId
			, ISNULL(rgls.DimGradeLevelId, -1)							GradeLevelId
			, rda.DimAgeId												AgeId
			, ISNULL(rdr.DimRaceId, -1)									RaceId
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId
			, 1															StudentCount
			, ISNULL(rds.DimSeaId, -1)									SeaId
			, -1														IeuId
			, ISNULL(rdl.DimLeaId, -1)									LeaId
			, ISNULL(rdpch.DimK12SchoolId, -1)							K12SchoolId
			, ISNULL(rdp.DimPersonId, -1)								K12StudentId
			, -1														IdeaStatusId
			, -1														LanguageId
			, -1														MigrantStatusId
			, -1														TitleIStatusId
			, -1														TitleIIIStatusId
			, -1														AttendanceId
			, -1														CohortStatusId
			, -1														NOrDStatusId 
			, -1														CteStatusId
			, -1														K12EnrollmentStatusId
			, -1														EnglishLearnerStatusId
			, -1														HomelessnessStatusId
			, ISNULL(rdeds.DimEconomicallyDisadvantagedStatusId, -1)	EconomicallyDisadvantagedStatusId
			, -1 														FosterCareStatusId
			, -1														ImmigrantStatusId
			, -1														PrimaryDisabilityTypeId
			, -1														SpecialEducationServicesExitDateId 
			, -1														MigrantStudentQualifyingArrivalDateId
			, -1														LastQualifyingMoveDateId

		FROM Staging.K12Enrollment	ske		
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
	--sea
		JOIN RDS.DimSeas rds
			ON @MembershipDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, '1/1/9999')
	--age
		JOIN RDS.DimAges rda
			ON RDS.Get_Age(ske.Birthdate, @MembershipDate) = rda.AgeValue
	--demographics			
		JOIN RDS.vwDimK12Demographics rdkd
			ON ske.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)	
	--student info	
		JOIN #dimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.Birthdate, '1/1/1900')
			AND @MembershipDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, '1/1/9999')
	--lea
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND @MembershipDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, '1/1/9999')
	--school
		LEFT JOIN RDS.DimK12Schools rdpch
			ON ske.SchoolIdentifierSea = rdpch.SchoolIdentifierSea
			AND @MembershipDate BETWEEN rdpch.RecordStartDateTime AND ISNULL(rdpch.RecordEndDateTime, '1/1/9999')
	  	LEFT JOIN Staging.K12Organization						org
			ON ske.SchoolYear 											=	org.SchoolYear
			AND	ISNULL(ske.SchoolIdentifierSea, '')						= 	ISNULL(org.SchoolIdentifierSea, '')
			AND @MembershipDate BETWEEN org.School_RecordStartDateTime AND ISNULL(org.School_RecordEndDateTime, '1/1/9999')
	--economically disadvantaged
		LEFT JOIN Staging.PersonStatus ecodis
			ON ske.SchoolYear 											= ecoDis.SchoolYear
			AND ecodis.StudentIdentifierState							= ske.StudentIdentifierState
			AND	ISNULL(ecodis.LeaIdentifierSeaAccountability, '')		= ISNULL(ske.LeaIdentifierSeaAccountability, '')
			AND	ISNULL(ecodis.SchoolIdentifierSea, '')					= ISNULL(ske.SchoolIdentifierSea, '')
			AND	@MembershipDate BETWEEN ecodis.EconomicDisadvantage_StatusStartDate AND ISNULL(ecodis.EconomicDisadvantage_StatusEndDate, '1/1/9999')
		LEFT JOIN #vwEconomicallyDisadvantagedStatuses rdeds
			ON rdeds.SchoolYear = ske.SchoolYear
			AND ISNULL(ecodis.EligibilityStatusForSchoolFoodServicePrograms, 'MISSING') = ISNULL(rdeds.EligibilityStatusForSchoolFoodServiceProgramsMap, 'MISSING')
			AND ISNULL(CAST(ecodis.NationalSchoolLunchProgramDirectCertificationIndicator AS SMALLINT), -1)  = ISNULL(rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap, -1)
			AND ISNULL(CAST(ecodis.EconomicDisadvantageStatus as SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, -1)
	--race	
		LEFT JOIN #vwUnduplicatedRaceMap spr 
			ON ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LeaIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
	--grade
		LEFT JOIN #vwGradeLevels rgls
			ON rgls.SchoolYear = ske.SchoolYear
			AND ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'

	WHERE @MembershipDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, '1/1/9999')
		AND rgls.GradeLevelCode IN (SELECT GradeLevel FROM @GradesList) AND ske.SchoolYear = @SchoolYear
		
	--Final INSERT INTO RDS.FactK12StudentCounts table
		INSERT INTO RDS.FactK12StudentCounts (
			SchoolYearId
			, FactTypeId
			, SeaId
			, IeuId
			, LeaId
			, K12SchoolId
			, K12StudentId
			, AgeId
			, AttendanceId
			, CohortStatusId
			, CteStatusId
			, EnglishLearnerStatusId
			, GradeLevelId
			, HomelessnessStatusId
			, EconomicallyDisadvantagedStatusId
			, FosterCareStatusId
			, IdeaStatusId
			, ImmigrantStatusId
			, K12DemographicId
			, K12EnrollmentStatusId
			, LanguageId
			, MigrantStatusId
			, NOrDStatusId
			, PrimaryDisabilityTypeId
			, RaceId
			, SpecialEducationServicesExitDateId
			, MigrantStudentQualifyingArrivalDateId
			, LastQualifyingMoveDateId
			, TitleIStatusId
			, TitleIIIStatusId
			, StudentCount
		)
		SELECT
			SchoolYearId
			, FactTypeId
			, SeaId
			, IeuId
			, LeaId
			, K12SchoolId
			, K12StudentId
			, AgeId
			, AttendanceId
			, CohortStatusId
			, CteStatusId
			, EnglishLearnerStatusId
			, GradeLevelId
			, HomelessnessStatusId
			, EconomicallyDisadvantagedStatusId
			, FosterCareStatusId
			, IdeaStatusId
			, ImmigrantStatusId
			, K12DemographicId
			, K12EnrollmentStatusId
			, LanguageId
			, MigrantStatusId
			, NOrDStatusId
			, PrimaryDisabilityTypeId
			, RaceId
			, SpecialEducationServicesExitDateId
			, MigrantStudentQualifyingArrivalDateId
			, LastQualifyingMoveDateId
			, TitleIStatusId
			, TitleIIIStatusId
			, StudentCount			
		FROM #Facts
	
		ALTER INDEX ALL ON RDS.FactK12StudentCounts REBUILD

	END TRY
	BEGIN CATCH
			INSERT INTO App.DataMigrationHistories
		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		values	(getutcdate(), 2, 'ERROR: ' + ERROR_MESSAGE())
	END CATCH

END
GO


