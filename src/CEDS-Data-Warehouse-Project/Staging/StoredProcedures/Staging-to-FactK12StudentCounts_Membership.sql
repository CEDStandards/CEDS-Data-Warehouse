/**********************************************************************
Author: AEM Corp
Date:	2/17/2023
Description: Migrates Membership Data from Staging to RDS.FactK12StudentCounts

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
		@FactTypeId INT,
		@SchoolYearId int,
		@MembershipDate date
		
	--Setting variables to be used in the select statements
		
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
	declare @toggleGrade13 as bit
 	declare @toggleUngraded as bit
	declare @toggleAdultEd as bit

	select @toggleGrade13 = ISNULL( case when r.ResponseValue = 'true' then 1 else 0 end, 0 ) 
	from app.ToggleQuestions q 
	left outer join app.ToggleResponses r on r.ToggleQuestionId = q.ToggleQuestionId
	where q.EmapsQuestionAbbrv = 'CCDGRADE13'

	select @toggleUngraded = ISNULL( case when r.ResponseValue = 'true' then 1 else 0 end, 0 ) 
	from app.ToggleQuestions q 
	left outer join app.ToggleResponses r on r.ToggleQuestionId = q.ToggleQuestionId
	where q.EmapsQuestionAbbrv = 'CCDUNGRADED'

	select @toggleAdultEd = ISNULL( case when r.ResponseValue = 'true' then 1 else 0 end, 0 )  
	from app.ToggleQuestions q 
	left outer join app.ToggleResponses r on r.ToggleQuestionId = q.ToggleQuestionId
	where q.EmapsQuestionAbbrv = 'ADULTEDU'

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


		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'membership'

		DELETE RDS.FactK12StudentCounts
		WHERE SchoolYearId = @SchoolYearId 
			AND FactTypeId = @FactTypeId

		IF OBJECT_ID('tempdb..#Facts') IS NOT NULL 
			DROP TABLE #Facts
		
	--Create and load #Facts temp table
		CREATE TABLE #Facts (
			StagingId								int not null
			, SchoolYearId							int null
			, FactTypeId							int null
			, GradeLevelId							int null
			, AgeId									int null
			, RaceId								int null
			, K12DemographicId						int null
			, StudentCount							int null
			, SEAId									int null
			, IEUId									int null
			, LEAId									int null
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
			, CTEStatusId							int null
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
			ske.id														StagingId
			, rsy.DimSchoolYearId										SchoolYearId
			, @FactTypeId												FactTypeId
			, ISNULL(rgls.DimGradeLevelId, -1)							GradeLevelId
			, rda.DimAgeId												AgeId
			, ISNULL(rdr.DimRaceId, -1)									RaceId
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId
			, 1															StudentCount
			, ISNULL(rds.DimSeaId, -1)									SEAId
			, -1														IEUId
			, ISNULL(rdl.DimLeaID, -1)									LEAId
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
			, -1														CTEStatusId
			, -1														K12EnrollmentStatusId
			, -1														EnglishLearnerStatusId
			, -1														HomelessnessStatusId
			, ISNULL(rdeds.DimEconomicallyDisadvantagedStatusId, -1)	EconomicallyDisadvantagedStatusId
			, -1														FosterCareStatusId
			, -1														ImmigrantStatusId
			, -1														PrimaryDisabilityTypeId
			, -1														SpecialEducationServicesExitDateId 
			, -1														MigrantStudentQualifyingArrivalDateId
			, -1														LastQualifyingMoveDateId

		FROM Staging.K12Enrollment ske
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
		JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND rdp.IsActiveK12Student = 1
			AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(ske.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND @MembershipDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		JOIN RDS.DimSeas rds
			ON @MembershipDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
		JOIN RDS.DimAges rda
			ON RDS.Get_Age(ske.Birthdate, @MembershipDate) = rda.AgeValue
		JOIN RDS.vwDimK12Demographics rdkd
			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)	
		LEFT JOIN #vwUnduplicatedRaceMap spr 
			ON ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LEAIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
		LEFT JOIN RDS.DimK12Schools rdpch
			ON ske.SchoolIdentifierSea = rdpch.SchoolIdentifierSea
			AND @MembershipDate BETWEEN rdpch.RecordStartDateTime AND ISNULL(rdpch.RecordEndDateTime, GETDATE())
		LEFT JOIN Staging.PersonStatus sps	
			ON ske.StudentIdentifierState = sps.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sps.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sps.SchoolIdentifierSea, '')

		LEFT JOIN #vwEconomicallyDisadvantagedStatuses rdeds
			ON rdeds.SchoolYear = ske.SchoolYear
			AND ISNULL(sps.EligibilityStatusForSchoolFoodServicePrograms, 'MISSING') = ISNULL(rdeds.EligibilityStatusForSchoolFoodServiceProgramsMap, 'MISSING')
			AND ISNULL(CAST(sps.NationalSchoolLunchProgramDirectCertificationIndicator AS SMALLINT), -1)  = isnull(rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap, -1)
			AND ISNULL(CAST(sps.EconomicDisadvantageStatus as SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, -1)

		LEFT JOIN #vwGradeLevels rgls
			ON rgls.SchoolYear = ske.SchoolYear
			AND ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'

		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND @MembershipDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())

		WHERE @MembershipDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
		AND GradeLevel IN (SELECT GradeLevel FROM @GradesList)


	--Final insert into RDS.FactK12StudentCounts table
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
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StudentCounts_Membership', 'RDS.FactK12StudentCounts', 'FactK12StudentCounts', 'FactK12StudentCounts', ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH

END