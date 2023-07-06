/**********************************************************************
Author: AEM Corp
Date:	3/1/2022
Description: Migrates Exiting Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 009
************************************************************************/
CREATE PROCEDURE  [Staging].[Staging-to-FactK12StudentCounts_SpecEdExit] 
	@SchoolYear SMALLINT
AS

BEGIN
	 --SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwCteStatuses') IS NOT NULL DROP TABLE #vwCteStatuses
		IF OBJECT_ID(N'tempdb..#vwTitleIStatuses') IS NOT NULL DROP TABLE #vwTitleIStatuses
		IF OBJECT_ID(N'tempdb..#vwMigrantStatuses') IS NOT NULL DROP TABLE #vwMigrantStatuses
		IF OBJECT_ID(N'tempdb..#uniqueLEAs') IS NOT NULL DROP TABLE #uniqueLEAs

	BEGIN TRY

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId int,
		@ChildCountDate date,
		@PreviousChildCountDate date,
		@StartDate DATE,
		@EndDate DATE,
		@UsesDefaultReferenceDates VARCHAR(10),
		@ToggleStartDate DATE,
		@ToggleEndDate DATE
		
	--Setting variables to be used in the select statements
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

	-- Get Child Count Date
		SELECT @ChildCountDate = tr.ResponseValue
		FROM App.ToggleQuestions tq
		JOIN App.ToggleResponses tr
			ON tq.ToggleQuestionId = tr.ToggleQuestionId
		WHERE tq.EmapsQuestionAbbrv = 'CHDCTDTE'
						
		SELECT @ChildCountDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-' + CAST(MONTH(@ChildCountDate) AS VARCHAR(2)) + '-' + CAST(DAY(@ChildCountDate) AS VARCHAR(2)) AS DATE)
		SELECT @PreviousChildCountDate = CAST(CAST(@SchoolYear - 2 AS CHAR(4)) + '-' + CAST(MONTH(@ChildCountDate) AS VARCHAR(2)) + '-' + CAST(DAY(@ChildCountDate) AS VARCHAR(2)) AS DATE)

	-- Get Reference Period Dates, using Toggle to override if the state uses a custom reference period
		-- Default date range
		SELECT @StartDate = CAST('7/1/' + CAST(@SchoolYear - 1 AS VARCHAR(4)) AS DATE)
		SELECT @EndDate = CAST('6/30/' + CAST(@SchoolYear  AS VARCHAR(4)) AS DATE)

		-- Custom date range
		SELECT @UsesDefaultReferenceDates = tr.ResponseValue
		FROM App.ToggleQuestions tq
		JOIN App.ToggleResponses tr
			ON tq.ToggleQuestionId = tr.ToggleQuestionId
		WHERE tq.EmapsQuestionAbbrv = 'DEFEXREFPER'

		IF (@UsesDefaultReferenceDates = 'false') 
		BEGIN
			SELECT @ToggleStartDate = tr.ResponseValue
			FROM App.ToggleQuestions tq
			JOIN App.ToggleResponses tr
				ON tq.ToggleQuestionId = tr.ToggleQuestionId
			WHERE tq.EmapsQuestionAbbrv = 'DEFEXREFDTESTART'

			SELECT @ToggleEndDate = tr.ResponseValue
			FROM App.ToggleQuestions tq
			JOIN App.ToggleResponses tr
				ON tq.ToggleQuestionId = tr.ToggleQuestionId
			WHERE tq.EmapsQuestionAbbrv = 'DEFEXREFDTEEND'

			SELECT @StartDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-' + CAST(MONTH(@ToggleStartDate) AS VARCHAR(2)) + '-' + CAST(DAY(@ToggleStartDate) AS VARCHAR(2)) AS DATE)
			SELECT @EndDate = CAST(CAST(@SchoolYear AS CHAR(4)) + '-' + CAST(MONTH(@ToggleEndDate) AS VARCHAR(2)) + '-' + CAST(DAY(@ToggleEndDate) AS VARCHAR(2)) AS DATE)

		END 

	--Create the temp tables (and any relevant indexes) needed for this domain
		SELECT * 
		INTO #vwRaces 
		FROM RDS.vwDimRaces
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwRaces ON #vwRaces (RaceMap);

		SELECT * 
		INTO #vwCteStatuses 
		FROM RDS.vwDimCteStatuses
		WHERE SchoolYear = @SchoolYear
		
		CREATE INDEX IX_vwCteStatuses ON #vwCteStatuses(SchoolYear, CteAeDisplacedHomemakerIndicatorMap, CteNontraditionalGenderStatusMap, SingleParentOrSinglePregnantWomanStatusMap) 
			INCLUDE (CteAeDisplacedHomemakerIndicatorCode, CteNontraditionalGenderStatusCode, SingleParentOrSinglePregnantWomanStatusCode)

		SELECT *
		INTO #vwTitleIStatuses
		FROM RDS.vwDimTitleIStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE INDEX ix_vwTitleIStatuses ON #vwTitleIStatuses (TitleIInstructionalServicesMap, TitleIProgramTypeMap, TitleISchoolStatusMap, TitleISupportServicesMap)
			INCLUDE (TitleIInstructionalServicesCode, TitleIProgramTypeCode, TitleISchoolStatusCode, TitleISupportServicesCode);

		SELECT *
		INTO #vwMigrantStatuses
		FROM RDS.vwDimMigrantStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE INDEX ix_vwMigrantStatuses ON #vwMigrantStatuses (ContinuationOfServicesReasonMap, MigrantEducationProgramServicesTypeMap, MigrantPrioritizedForServicesMap, MigrantEducationProgramEnrollmentTypeMap)
			INCLUDE (ContinuationOfServicesReasonCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode, MigrantEducationProgramEnrollmentTypeCode);


		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'specedexit'

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
		SELECT
			sppse.Id													StagingId
			, rsy.DimSchoolYearId										SchoolYearId
			, @FactTypeId												FactTypeId
			, -1														GradeLevelId
			, rda.DimAgeId												AgeId
			, ISNULL(rdr.DimRaceId, -1)									RaceId
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId
			, 1															StudentCount

			, ISNULL(rds.DimSeaId, -1)									SEAId
			, -1														IEUId
			, ISNULL(rdl.DimLeaID, -1)									LEAId
			, ISNULL(rdksch.DimK12SchoolId, -1)							K12SchoolId
			, ISNULL(rdp.DimPersonId, -1)								K12StudentId

			, ISNULL(rdis.DimIdeaStatusId, -1)							IdeaStatusId
			, -1														LanguageId
			, -1														MigrantStatusId
			, -1														TitleIStatusId
			, -1														TitleIIIStatusId
			, -1														AttendanceId
			, -1														CohortStatusId
			, -1														NOrDStatusId
			, -1														CTEStatusId
			, -1														K12EnrollmentStatusId
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1) 				EnglishLearnerStatusId
			, ISNULL(rdhs.DimHomelessnessStatusId, -1)					HomelessnessStatusId
			, ISNULL(rdeds.DimEconomicallyDisadvantagedStatusId, -1)	EconomicallyDisadvantagedStatusId
			, -1														FosterCareStatusId
			, -1														ImmigrantStatusId
			, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)					PrimaryDisabilityTypeId
			, ISNULL(rdd.DimDateId, -1)									SpecialEducationServicesExitDateId
			, -1														MigrantStudentQualifyingArrivalDateId
			, -1														LastQualifyingMoveDateId

		FROM Staging.ProgramParticipationSpecialEducation sppse
		JOIN RDS.DimDates rdd
			ON sppse.ProgramParticipationEndDate = rdd.DateValue
		JOIN Staging.K12Enrollment ske
			ON ske.StudentIdentifierState = sppse.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
			AND rdd.DateValue BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND rdd.DateValue BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND rdd.DateValue BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
		JOIN RDS.DimSeas rds
			ON rdd.DateValue BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
		JOIN Staging.ProgramParticipationSpecialEducation idea
			ON ske.StudentIdentifierState = idea.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(idea.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(idea.SchoolIdentifierSea, '')
			AND rdd.DateValue BETWEEN idea.ProgramParticipationBeginDate AND ISNULL(idea.ProgramParticipationEndDate, GETDATE())
		JOIN Staging.IdeaDisabilityType sidt	
			ON ske.SchoolYear = sidt.SchoolYear
			AND sidt.StudentIdentifierState = idea.StudentIdentifierState
			AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(idea.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(idea.SchoolIdentifierSea, '')
			AND sidt.IsPrimaryDisability = 1
			AND rdd.DateValue BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, GETDATE())
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LEAIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
		LEFT JOIN Staging.PersonStatus el 
			ON ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND rdd.DateValue BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, GETDATE())
		LEFT JOIN Staging.PersonStatus econ 
			ON ske.StudentIdentifierState = econ.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(econ.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(econ.SchoolIdentifierSea, '')
			AND rdd.DateValue BETWEEN econ.EconomicDisadvantage_StatusStartDate AND ISNULL(econ.EconomicDisadvantage_StatusEndDate, GETDATE())
		LEFT JOIN Staging.PersonStatus homeless 
			ON ske.StudentIdentifierState = homeless.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(homeless.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(homeless.SchoolIdentifierSea, '')
			AND rdd.DateValue BETWEEN homeless.Homelessness_StatusStartDate AND ISNULL(homeless.Homelessness_StatusEndDate, GETDATE())
		JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
		JOIN RDS.vwDimK12Demographics rdkd
 			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		LEFT JOIN RDS.vwDimEconomicallyDisadvantagedStatuses rdeds
 			ON rsy.SchoolYear = rdeds.SchoolYear
			AND ISNULL(CAST(econ.EconomicDisadvantageStatus AS SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, -1)
		LEFT JOIN RDS.vwDimHomelessnessStatuses rdhs
 			ON rsy.SchoolYear = rdhs.SchoolYear
			AND ISNULL(CAST(homeless.HomelessnessStatus AS SMALLINT), -1) = ISNULL(rdhs.HomelessnessStatusMap, -1)
			AND rdhs.HomelessPrimaryNighttimeResidenceCode = 'MISSING'
			AND rdhs.HomelessUnaccompaniedYouthStatusCode = 'MISSING'
		JOIN RDS.DimAges rda
			ON RDS.Get_Age(ske.Birthdate, IIF(rdd.DateValue < @ChildCountDate, @PreviousChildCountDate, @ChildCountDate)) = rda.AgeValue
		LEFT JOIN RDS.vwDimIdeaStatuses rdis
			ON ske.SchoolYear = rdis.SchoolYear
			AND ISNULL(sppse.SpecialEducationExitReason, 'MISSING') = ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode)
			AND IdeaIndicatorCode = 'Yes'
			AND rdis.IdeaEducationalEnvironmentForSchoolAgeCode = 'MISSING'
		LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
			ON sidt.SchoolYear = rdidt.SchoolYear
			AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidt.IdeaDisabilityTypeMap, rdidt.IdeaDisabilityTypeCode)
			AND sidt.IsPrimaryDisability = 1
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
				AND rsy.SchoolYear = rdr.SchoolYear
		JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(ske.LastOrSurname, 'MISSING') = rdp.LastOrSurname
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND rdd.DateValue BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
			AND IsActiveK12Student = 1
		WHERE sppse.ProgramParticipationEndDate IS NOT NULL		

	--Update the #Facts table
		UPDATE #Facts
		SET CteStatusId = ISNULL(rdcs.DimCteStatusId, -1)
		FROM #Facts fact
		JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON fact.StagingId = sppse.Id
		LEFT JOIN Staging.ProgramParticipationCTE sppc_part_conc
			ON sppse.StudentIdentifierState = sppc_part_conc.StudentIdentifierState
			AND ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(sppc_part_conc.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(sppc_part_conc.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN sppc_part_conc.ProgramParticipationBeginDate AND ISNULL(sppc_part_conc.ProgramParticipationEndDate, @EndDate)
		LEFT JOIN Staging.ProgramParticipationCTE sppc_dhm
			ON sppse.StudentIdentifierState = sppc_dhm.StudentIdentifierState
			AND ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(sppc_dhm.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(sppc_dhm.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN sppc_dhm.DisplacedHomeMaker_StatusStartDate AND ISNULL(sppc_dhm.DisplacedHomeMaker_StatusEndDate, @EndDate)
		LEFT JOIN Staging.ProgramParticipationCTE sppc_sp
			ON sppse.StudentIdentifierState = sppc_sp.StudentIdentifierState
			AND ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(sppc_sp.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(sppc_sp.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN sppc_sp.SingleParent_StatusStartDate AND ISNULL(sppc_sp.SingleParent_StatusEndDate, @EndDate)
		LEFT JOIN #vwCteStatuses rdcs
			ON  ISNULL(CAST(sppc_part_conc.CteParticipant AS SMALLINT), -1)					= ISNULL(rdcs.CteParticipantMap, -1)
			AND ISNULL(CAST(sppc_part_conc.CteConcentrator AS SMALLINT), -1)				= ISNULL(rdcs.CteConcentratorMap, -1)
			AND ISNULL(CAST(sppc_dhm.DisplacedHomeMakerIndicator AS SMALLINT), -1)			= ISNULL(rdcs.CteAeDisplacedHomemakerIndicatorMap, -1)
			AND ISNULL(CAST(sppc_part_conc.NonTraditionalGenderStatus AS SMALLINT), -1)		= ISNULL(rdcs.CteNontraditionalGenderStatusMap, -1)
			AND ISNULL(CAST(sppc_part_conc.NonTraditionalGenderStatus AS SMALLINT), -1)		= ISNULL(rdcs.CteNontraditionalGenderStatusMap, -1)
			AND ISNULL(CAST(sppc_sp.SingleParentIndicator AS SMALLINT), -1)					= ISNULL(rdcs.SingleParentOrSinglePregnantWomanStatusMap, -1)
			AND ISNULL(CAST(sppc_sp.SingleParentIndicator AS SMALLINT), -1)					= ISNULL(rdcs.SingleParentOrSinglePregnantWomanStatusMap, -1)

	--Get a unique set of Lea IDs to match against for Title I and Migrant update
		IF OBJECT_ID('tempdb..#uniqueLEAs') IS NOT NULL 
			DROP TABLE #uniqueLEAs		
		SELECT DISTINCT LeaIdentifierSea, LEA_RecordStartDateTime, LEA_RecordEndDateTime, LEA_TitleIProgramType, LEA_TitleIinstructionalService, LEA_K12LeaTitleISupportService
		INTO #uniqueLEAs
		FROM Staging.K12Organization
		WHERE LEA_IsReportedFederally = 1

	--Update Title I
		UPDATE #Facts
		SET TitleIStatusId = ISNULL(rdtis.DimTitleIStatusId, -1)
		FROM #Facts fact
		JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON fact.StagingId = sppse.Id
		JOIN #uniqueLEAs lea
			ON ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(lea.LeaIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN lea.LEA_RecordStartDateTime AND ISNULL(lea.LEA_RecordEndDateTime, @EndDate)
		LEFT JOIN Staging.K12Organization sch
			ON ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(lea.LeaIdentifierSea, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(sch.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN sch.School_RecordStartDateTime AND ISNULL(sch.School_RecordEndDateTime, @EndDate)
		LEFT JOIN #vwTitleIStatuses rdtis
			ON ISNULL(lea.LEA_TitleIProgramType, 'MISSING') = ISNULL(rdtis.TitleIProgramTypeMap, rdtis.TitleIProgramTypeCode)
			AND ISNULL(lea.LEA_TitleIinstructionalService, 'MISSING') = ISNULL(rdtis.TitleIInstructionalServicesMap, rdtis.TitleIInstructionalServicesCode)
			AND ISNULL(lea.LEA_K12LeaTitleISupportService, 'MISSING') = ISNULL(rdtis.TitleISupportServicesMap, rdtis.TitleISupportServicesCode)
			AND ISNULL(sch.School_TitleIPartASchoolDesignation, 'MISSING') = ISNULL(rdtis.TitleISchoolStatusCode, rdtis.TitleISchoolStatusMap)

	--Update Migrant
		UPDATE #Facts
		SET MigrantStatusId = ISNULL(rdms.DimMigrantStatusId, -1)
		FROM #Facts fact
		JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON fact.StagingId = sppse.Id
		JOIN #uniqueLEAs lea
			ON ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(lea.LeaIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN lea.LEA_RecordStartDateTime AND ISNULL(lea.LEA_RecordEndDateTime, @EndDate)
		JOIN Staging.K12Organization sch
			ON ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(lea.LeaIdentifierSea, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(sch.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN sch.School_RecordStartDateTime AND ISNULL(sch.School_RecordEndDateTime, @EndDate)
		JOIN Staging.Migrant sm
			ON sppse.StudentIdentifierState = sm.StudentIdentifierState
			AND ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(sm.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(sm.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN sm.ProgramParticipationStartDate AND ISNULL(sm.ProgramParticipationExitDate, @EndDate)
		LEFT JOIN #vwMigrantStatuses rdms
			ON ISNULL(CAST(sm.MigrantPrioritizedForServices AS SMALLINT), -1) = ISNULL(rdms.MigrantPrioritizedForServicesMap, -1)
			AND ISNULL(sm.MigrantEducationProgramServicesType, 'MISSING') = ISNULL(rdms.MigrantEducationProgramServicesTypeMap, rdms.MigrantEducationProgramServicesTypeCode)
			AND rdms.ContinuationOfServicesReasonCode = 'MISSING'
			AND rdms.MigrantEducationProgramEnrollmentTypeCode = 'MISSING'
--			AND ISNULL(sm.ContinuationOfServicesReason, 'MISSING') = ISNULL(rdms.ContinuationOfServicesReasonMap, rdms.ContinuationOfServicesReasonCode)
--			AND ISNULL(sm.MigrantEducationProgramEnrollmentType, 'MISSING') = ISNULL(rdms.MigrantEducationProgramEnrollmentTypeMap, rdms.MigrantEducationProgramEnrollmentTypeCode)
		
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
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StudentCounts_SpecEdExit', 'RDS.FactK12StudentCounts', 'FactK12StudentCounts', NULL, ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH

END

GO

