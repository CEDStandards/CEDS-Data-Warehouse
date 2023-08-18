/**********************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Dropout Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 032
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_Dropout]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwEconomicallyDisadvantagedStatuses') IS NOT NULL DROP TABLE #vwEconomicallyDisadvantagedStatuses
		IF OBJECT_ID(N'tempdb..#vwHomelessnessStatuses') IS NOT NULL DROP TABLE #vwHomelessnessStatuses
		IF OBJECT_ID(N'tempdb..#vwMigrantStatuses') IS NOT NULL DROP TABLE #vwMigrantStatuses
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels

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

		SELECT *
		INTO #vwMigrantStatuses
		FROM RDS.vwDimMigrantStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwMigrantStatuses
			ON #vwMigrantStatuses (MigrantStatusCode, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, ConsolidatedMepFundsStatusCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode);

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'dropout'	--DimFactTypeId = 7

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
			, ISNULL(rdd.DimDisabilityStatusId, -1)						DisabilityStatusId							
			, -1														LanguageId							
			, ISNULL(rdis.DimMigrantStatusId, -1) 						MigrantStatusId						
			, -1														TitleIStatusId						
			, -1														TitleIIIStatusId						
			, -1														AttendanceId							
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
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
		JOIN RDS.DimSeas rds
			ON ske.EnrollmentEntryDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
	--homeless
		JOIN Staging.PersonStatus hmStatus
			ON ske.StudentIdentifierState = hmStatus.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(hmStatus.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(hmStatus.SchoolIdentifierSea, '')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
	--idea disability status
		LEFT JOIN Staging.ProgramParticipationSpecialEducation idea
			ON ske.StudentIdentifierState = idea.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(idea.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(idea.SchoolIdentifierSea, '')
			AND idea.ProgramParticipationBeginDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
	--504 disability status
		LEFT JOIN Staging.Disability disab
			ON ske.StudentIdentifierState = disab.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(disab.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(disab.SchoolIdentifierSea, '')
			AND disab.Disability_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
	--economic disadvantage
		LEFT JOIN Staging.PersonStatus ecoDis
			ON ske.StudentIdentifierState = ecoDis.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(ecoDis.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(ecoDis.SchoolIdentifierSea, '')
			AND ecoDis.EconomicDisadvantage_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
	--english learner
		LEFT JOIN Staging.PersonStatus el 
			ON ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND el.EnglishLearner_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
	--migratory status	
		LEFT JOIN Staging.PersonStatus migrant
			ON ske.StudentIdentifierState = migrant.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(migrant.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(migrant.SchoolIdentifierSea, '')
			AND migrant.Migrant_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())
	--race	
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr 
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LEAIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
	--homelessness (RDS)
		LEFT JOIN #vwHomelessnessStatuses rdhs
			ON ISNULL(CAST(hmStatus.HomelessnessStatus AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessnessStatusMap AS SMALLINT), -1)
			AND ISNULL(hmNight.HomelessNightTimeResidence, 'MISSING') = ISNULL(rdhs.HomelessPrimaryNighttimeResidenceMap, 'MISSING')
			AND ISNULL(CAST(hmStatus.HomelessUnaccompaniedYouth AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessUnaccompaniedYouthStatusMap AS SMALLINT), -1)
	--idea disability (RDS)
		LEFT JOIN RDS.vwDimIdeaStatuses rdis
			ON ske.SchoolYear = rdis.SchoolYear
			AND ISNULL(CAST(idea.IDEAIndicator AS SMALLINT), -1) = ISNULL(rdis.IdeaIndicatorMap, -1)
			AND rdis.IdeaEducationalEnvironmentForSchoolAgeCode = 'MISSING'
			AND rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode = 'MISSING'
			AND rdis.SpecialEducationExitReasonCode = 'MISSING'
	--504 disability (RDS)
		LEFT JOIN RDS.vwDimDisabilityStatuses rdds
			ON rsy.SchoolYear = rdds.SchoolYear
			AND ISNULL(CAST(disab.DisabilityStatus AS SMALLINT), -1) = ISNULL(rdds.DisabilityStatusMap, -1)
			AND ISNULL(CAST(disab.Section504Status AS SMALLINT), -1) = ISNULL(rdds.Section504StatusMap, -1)
			AND rdds.DisabilityConditionTypeCode = 'MISSING'
			AND rdds.DisabilityDeterminationSourceTypeCode = 'MISSING'
	--economically disadvantaged (RDS)
		LEFT JOIN #vwEconomicallyDisadvantagedStatuses rdeds
			ON rsy.SchoolYear = rdeds.SchoolYear
			AND ISNULL(CAST(ecoDis.EconomicDisadvantageStatus AS SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, -1)
			AND EligibilityStatusForSchoolFoodServiceProgramsCode = 'MISSING'
			AND NationalSchoolLunchProgramDirectCertificationIndicatorCode = 'MISSING'
	--english learner (RDS)
		LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--migrant (RDS)
		LEFT JOIN #vwMigrantStatuses rdms
			ON ISNULL(CAST(migrant.MigrantStatus AS SMALLINT), -1) = ISNULL(CAST(rdms.MigrantStatusMap AS SMALLINT), -1)
			AND rdms.MigrantEducationProgramEnrollmentTypeCode = 'MISSING' 
			AND rdms.ContinuationOfServicesReasonCode = 'MISSING'
			AND rdms.MigrantEducationProgramServicesTypeCode = 'MISSING'
			AND rdms.MigrantPrioritizedForServicesCode = 'MISSING'
	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Exit Grade Level'
	--race (RDS)	
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
		JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState = rdp.StateStudentIdentifier
			AND rdp.IsActiveK12Student = 1
			AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(ske.LastOrSurname, 'MISSING') = rdp.LastOrSurname
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND ske.EnrollmentEntryDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())


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
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StudentCounts_Dropout', 'RDS.FactK12StudentCounts', 'FactK12StudentCounts', 'FactK12StudentCounts', ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH

END

GO

