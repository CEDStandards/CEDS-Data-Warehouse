
/**********************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Chronic Absenteeism Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 195
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_ChronicAbsenteeism]
	@SchoolYear SMALLINT
AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwUnduplicatedRaceMap') IS NOT NULL DROP TABLE #vwUnduplicatedRaceMap
		IF OBJECT_ID(N'tempdb..#vwEconomicallyDisadvantagedStatuses') IS NOT NULL DROP TABLE #vwEconomicallyDisadvantagedStatuses
		IF OBJECT_ID(N'tempdb..#vwHomelessnessStatuses') IS NOT NULL DROP TABLE #vwHomelessnessStatuses
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#tempELStatus') IS NOT NULL DROP TABLE #tempELStatus
		IF OBJECT_ID(N'tempdb..#tempDisabilityStatus') IS NOT NULL DROP TABLE #tempDisabilityStatus
		IF OBJECT_ID(N'tempdb..#tempEcoDisStatus') IS NOT NULL DROP TABLE #tempEcoDisStatus
		IF OBJECT_ID(N'tempdb..#tempHomelessnessStatus') IS NOT NULL DROP TABLE #tempHomelessnessStatus

	BEGIN TRY

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId INT,
		@SYStartDate DATE,
		@SYEndDate DATE
		
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SET @SYStartDate = staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = staging.GetFiscalYearEndDate(@SchoolYear)

	--Get the set of students from DimPeople to be used for the migrated SY
		select K12StudentStudentIdentifierState
			, max(DimPersonId)								DimPersonId
			, min(RecordStartDateTime)						RecordStartDateTime
			, max(isnull(RecordEndDateTime, @SYEndDate))	RecordEndDateTime
			, max(isnull(birthdate, '1900-01-01'))			BirthDate
		into #dimPeople
		from rds.DimPeople
		where ((RecordStartDateTime <= @SYStartDate and RecordEndDateTime > @SYStartDate)
			or (RecordStartDateTime > @SYStartDate and isnull(RecordEndDateTime, @SYEndDate) <= @SYEndDate))
		and IsActiveK12Student = 1
		group by K12StudentStudentIdentifierState
		order by K12StudentStudentIdentifierState

		create index IDX_dimPeople ON #dimPeople (K12StudentStudentIdentifierState, DimPersonId, RecordStartDateTime, RecordEndDateTime, Birthdate)

	--reset the RecordStartDateTime if the date is prior to the default start date of 7/1
		update #dimPeople
		set RecordStartDateTime = @SYStartDate
		where RecordStartDateTime < @SYStartDate

	--Create the temp views (and any relevant indexes) needed for this domain
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
		INTO #vwHomelessnessStatuses
		FROM RDS.vwDimHomelessnessStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwHomelessnessStatuses
			ON #vwHomelessnessStatuses (HomelessnessStatusCode, HomelessPrimaryNighttimeResidenceCode, HomelessUnaccompaniedYouthStatusCode);

		SELECT *
		INTO #vwEconomicallyDisadvantagedStatuses
		FROM RDS.vwDimEconomicallyDisadvantagedStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwEconomicallyDisadvantagedStatuses
			ON #vwEconomicallyDisadvantagedStatuses (EconomicDisadvantageStatusCode, EligibilityStatusForSchoolFoodServiceProgramsCode, NationalSchoolLunchProgramDirectCertificationIndicatorCode);

	--Pull the 504 Disability Status into a temp table
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea
			, Section504Status
		INTO #tempDisabilityStatus
		FROM Staging.Disability

	-- Create Index for #tempELStatus 
		CREATE INDEX IX_tempDisabilityStatus 
			ON #tempDisabilityStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea)

	--Pull the EL Status into a temp table
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea
			, EnglishLearnerStatus
			, EnglishLearner_StatusStartDate
			, EnglishLearner_StatusEndDate
		INTO #tempELStatus
		FROM Staging.PersonStatus

	-- Create Index for #tempELStatus 
		CREATE INDEX IX_tempELStatus 
			ON #tempELStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, Englishlearner_StatusStartDate, EnglishLearner_StatusEndDate)

	--Pull the Economically Disadvantaged Status into a temp table
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea
			, EconomicDisadvantageStatus
			, EconomicDisadvantage_StatusStartDate
			, EconomicDisadvantage_StatusEndDate
		INTO #tempEcoDisStatus
		FROM Staging.PersonStatus

	-- Create Index for #tempEcoDisStatus 
		CREATE INDEX IX_tempEcoDisStatus 
			ON #tempEcoDisStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, EconomicDisadvantage_StatusStartDate, EconomicDisadvantage_StatusEndDate)

	--Pull the Homelessness Status into a temp table
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea
			, HomelessnessStatus
			, Homelessness_StatusStartDate
			, Homelessness_StatusEndDate
		INTO #tempHomelessnessStatus
		FROM Staging.PersonStatus

	-- Create Index for #tempHomelessnessStatus 
		CREATE INDEX IX_tempHomelessnessStatus 
			ON #tempHomelessnessStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, Homelessness_StatusStartDate, Homelessness_StatusEndDate)

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'chronicabsenteeism' --DimFactTypeId = 17

		--Clear the Fact table of the data about to be migrated  
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
			, DisabilityStatusId					int null
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
			, -1 														AgeId									
			, ISNULL(rdr.DimRaceId, -1)									RaceId								
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId						
			, 1															StudentCount							
			, ISNULL(rds.DimSeaId, -1)									SEAId									
			, -1														IEUId									
			, ISNULL(rdl.DimLeaID, -1)									LEAId									
			, ISNULL(rdksch.DimK12SchoolId, -1)							K12SchoolId							
			, ISNULL(rdp.DimPersonId, -1)								K12StudentId							
			, ISNULL(rdis.DimIdeaStatusId, -1)							IdeaStatusId							
			, ISNULL(rdds.DimDisabilityStatusId, -1)					DisabilityStatusId							
			, -1														LanguageId							
			, -1 														MigrantStatusId						
			, -1														TitleIStatusId						
			, -1														TitleIIIStatusId						
			, 1															AttendanceId							
			, -1 														CohortStatusId						
			, -1														NOrDStatusId							
			, -1														CTEStatusId							
			, -1														K12EnrollmentStatusId					
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)				EnglishLearnerStatusId				
			, ISNULL(rdhs.DimHomelessnessStatusId, -1)					HomelessnessStatusId					
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
		JOIN RDS.DimSeas rds
			ON ske.EnrollmentEntryDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, @SYEndDate)
	--demographics			
		JOIN RDS.vwDimK12Demographics rdkd
 			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		JOIN #dimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND ske.EnrollmentEntryDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, @SYEndDate)
	--homelessness
		LEFT JOIN #tempHomelessnessStatus hmStatus
			ON ske.StudentIdentifierState = hmStatus.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(hmStatus.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(hmStatus.SchoolIdentifierSea, '')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
		LEFT JOIN #vwHomelessnessStatuses rdhs
			ON ISNULL(CAST(hmStatus.HomelessnessStatus AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessnessStatusMap AS SMALLINT), -1)
			AND rdhs.HomelessPrimaryNighttimeResidenceCode = 'MISSING'
			AND rdhs.HomelessUnaccompaniedYouthStatusCode = 'MISSING'
			AND rdhs.HomelessServicedIndicatorCode = 'MISSING'
	--idea disability status
		LEFT JOIN Staging.ProgramParticipationSpecialEducation idea
			ON ske.StudentIdentifierState = idea.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(idea.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(idea.SchoolIdentifierSea, '')
			AND idea.ProgramParticipationBeginDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
		LEFT JOIN RDS.vwDimIdeaStatuses rdis
			ON ske.SchoolYear = rdis.SchoolYear
			AND ISNULL(CAST(idea.IDEAIndicator AS SMALLINT), -1) = ISNULL(rdis.IdeaIndicatorMap, -1)
			AND rdis.IdeaEducationalEnvironmentForSchoolAgeCode = 'MISSING'
			AND rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode = 'MISSING'
			AND rdis.SpecialEducationExitReasonCode = 'MISSING'
	--504 disability status
		LEFT JOIN #tempDisabilityStatus disab
			ON ske.StudentIdentifierState = disab.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(disab.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(disab.SchoolIdentifierSea, '')
		LEFT JOIN RDS.vwDimDisabilityStatuses rdds
			ON rsy.SchoolYear = rdds.SchoolYear
			AND ISNULL(CAST(disab.Section504Status AS SMALLINT), -1) = ISNULL(rdds.Section504StatusMap, -1)
			AND rdds.DisabilityStatusCode = 'MISSING'
			AND rdds.DisabilityConditionTypeCode = 'MISSING'
			AND rdds.DisabilityDeterminationSourceTypeCode = 'MISSING'
	--economic disadvantage
		LEFT JOIN #tempEcoDisStatus ecoDis
			ON ske.StudentIdentifierState = ecoDis.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(ecoDis.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(ecoDis.SchoolIdentifierSea, '')
			AND ecoDis.EconomicDisadvantage_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
		LEFT JOIN RDS.vwDimEconomicallyDisadvantagedStatuses rdeds
			ON rsy.SchoolYear = rdeds.SchoolYear
			AND ISNULL(CAST(ecoDis.EconomicDisadvantageStatus AS SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, -1)
			AND EligibilityStatusForSchoolFoodServiceProgramsCode = 'MISSING'
			AND NationalSchoolLunchProgramDirectCertificationIndicatorCode = 'MISSING'
	--english learner
		LEFT JOIN #tempELStatus el 
			ON ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND el.EnglishLearner_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
		LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--race
		LEFT JOIN #vwUnduplicatedRaceMap spr
			ON ske.StudentIdentifierState = spr.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(spr.LeaIdentifierSeaAccountability,'')
			AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(spr.SchoolIdentifierSea,'')

		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'

--Generate can handle this determination in 2 ways
--	1. populate AttendanceRate in Staging.K12Enrollment and Generate will just use that value
--		NOTE: This is % of class days attended, not % of days absent
--	2. populate NumberOfSchoolDays and NumberOfDaysAbsent in Staging.K12Enrollment and Generate will calculate the Absentee Rate
		WHERE	
			CAST((CASE WHEN ske.NumberOfSchoolDays = '0' THEN 0
					WHEN ske.NumberOfDaysAbsent = '0' THEN 1
					ELSE CAST(ske.NumberOfSchoolDays - ske.NumberOfDaysAbsent  AS decimal(5,2)) / CAST(ske.NumberOfSchoolDays AS decimal(5,2))
				END) AS decimal(5,4)) <= 0.9

	--Final insert into RDS.FactK12StudentCounts table
		INSERT INTO RDS.FactK12StudentCounts (
			[SchoolYearId]
			, [FactTypeId]
			, [GradeLevelId]
			, [AgeId]
			, [RaceId]
			, [K12DemographicId]
			, [StudentCount]
			, [SEAId]
			, [IEUId]
			, [LEAId]
			, [K12SchoolId]
			, [K12StudentId]
			, [IdeaStatusId]
			, [DisabilityStatusId]
			, [LanguageId]
			, [MigrantStatusId]
			, [TitleIStatusId]
			, [TitleIIIStatusId]
			, [AttendanceId]
			, [CohortStatusId]
			, [NOrDStatusId]
			, [CTEStatusId]
			, [K12EnrollmentStatusId]
			, [EnglishLearnerStatusId]
			, [HomelessnessStatusId]
			, [EconomicallyDisadvantagedStatusId]
			, [FosterCareStatusId]
			, [ImmigrantStatusId]
			, [PrimaryDisabilityTypeId]
			, [SpecialEducationServicesExitDateId]
			, [MigrantStudentQualifyingArrivalDateId]
			, [LastQualifyingMoveDateId]
		)
		SELECT 
			[SchoolYearId]
			, [FactTypeId]
			, [GradeLevelId]
			, [AgeId]
			, [RaceId]
			, [K12DemographicId]
			, [StudentCount]
			, [SEAId]
			, [IEUId]
			, [LEAId]
			, [K12SchoolId]
			, [K12StudentId]
			, [IdeaStatusId]
			, [DisabilityStatusId]
			, [LanguageId]
			, [MigrantStatusId]
			, [TitleIStatusId]
			, [TitleIIIStatusId]
			, [AttendanceId]
			, [CohortStatusId]
			, [NOrDStatusId]
			, [CTEStatusId]
			, [K12EnrollmentStatusId]
			, [EnglishLearnerStatusId]
			, [HomelessnessStatusId]
			, [EconomicallyDisadvantagedStatusId]
			, [FosterCareStatusId]
			, [ImmigrantStatusId]
			, [PrimaryDisabilityTypeId]
			, [SpecialEducationServicesExitDateId]
			, [MigrantStudentQualifyingArrivalDateId]
			, [LastQualifyingMoveDateId]
		FROM #Facts

		ALTER INDEX ALL ON RDS.FactK12StudentCounts REBUILD

	END TRY
	BEGIN CATCH
	insert into app.DataMigrationHistories
		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		values	(getutcdate(), 2, 'ERROR: ' + ERROR_MESSAGE())
	END CATCH

END
GO


