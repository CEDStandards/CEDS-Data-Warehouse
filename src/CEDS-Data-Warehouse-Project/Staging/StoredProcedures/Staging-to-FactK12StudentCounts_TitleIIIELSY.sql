/**********************************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Title III EL SY Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 045, 204
***********************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_TitleIIIELSY]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwEnglishLearnerStatuses') IS NOT NULL DROP TABLE #vwEnglishLearnerStatuses
		IF OBJECT_ID(N'tempdb..#vwLanguages') IS NOT NULL DROP TABLE #vwLanguages
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

	--Create the temp tables (and any relevant indexes) needed for this domain
		SELECT *
		INTO #vwGradeLevels
		FROM RDS.vwDimGradeLevels
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwGradeLevels 
			ON #vwGradeLevels (GradeLevelTypeDescription, GradeLevelMap);

		SELECT *
		INTO #vwEnglishLearnerStatuses
		FROM RDS.vwDimEnglishLearnerStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwEnglishLearnerStatuses
			ON #vwEnglishLearnerStatuses (EnglishLearnerStatusCode, PerkinsEnglishLearnerStatusCode, TitleIIIAccountabilityProgressStatusCode, TitleIIILanguageInstructionProgramTypeCode);

		SELECT *
		INTO #vwLanguages
		FROM RDS.vwDimLanguages
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwLanguages
			ON #vwLanguages (Iso6392LanguageCode);

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'TitleIIIELSY' -- DimFactTypeId = 10

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
			ske.id										StagingId							
			, rsy.DimSchoolYearId						SchoolYearId
			, @FactTypeId								FactTypeId							
			, ISNULL(rgls.DimGradeLevelId, -1)			GradeLevelId							
			, ISNULL(rda.DimAgeId, -1)					AgeId									
			, -1										RaceId								
			, ISNULL(rdkd.DimK12DemographicId, -1)		K12DemographicId						
			, 1											StudentCount							
			, ISNULL(rds.DimSeaId, -1)					SEAId									
			, -1										IEUId									
			, ISNULL(rdl.DimLeaID, -1)					LEAId									
			, ISNULL(rdksch.DimK12SchoolId, -1)			K12SchoolId							
			, ISNULL(rdp.DimPeopleId, -1)				K12StudentId							
			, -1										IdeaStatusId							
			, -1										DisabilityStatusId							
			, ISNULL(rdvl.DimLanguageId, -1)			LanguageId							
			, -1										MigrantStatusId						
			, -1										TitleIStatusId						
			, ISNULL(rd3ts.DimTitleIIIStatusId, -1)		TitleIIIStatusId						
			, -1										AttendanceId							
			, -1										CohortStatusId						
			, -1 										NOrDStatusId							
			, -1										CTEStatusId							
			, -1										K12EnrollmentStatusId					
			, -1										EnglishLearnerStatusId				
			, -1										HomelessnessStatusId					
			, -1										EconomicallyDisadvantagedStatusId		
			, -1										FosterCareStatusId					
			, -1										ImmigrantStatusId						
			, -1										PrimaryDisabilityTypeId				
			, -1										SpecialEducationServicesExitDateId	
			, -1										MigrantStudentQualifyingArrivalDateId	
			, -1										LastQualifyingMoveDateId				
			
		FROM Staging.K12Enrollment ske
	--english learner
		JOIN Staging.PersonStatus el 
			ON ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND el.EnglishLearner_StatusStartDate >= @SYStartDate
			AND ISNULL(el.EnglishLearner_StatusEndDate, @SYEndDate) <= @SYEndDate
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND el.EnglishLearner_StatusStartDate >= rdl.RecordStartDateTime 
			AND el.EnglishLearner_StatusStartDate <= ISNULL(rdl.RecordEndDateTime, GETDATE())
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND el.EnglishLearner_StatusStartDate >= rdksch.RecordStartDateTime 
			AND el.EnglishLearner_StatusStartDate <= ISNULL(rdksch.RecordEndDateTime, GETDATE())
		JOIN RDS.DimSeas rds
			ON el.EnglishLearner_StatusStartDate >= convert(date, rds.RecordStartDateTime)
			AND el.EnglishLearner_StatusStartDate <= ISNULL(convert(date, rds.RecordEndDateTime), GETDATE())
	--title 3 program
		LEFT JOIN Staging.ProgramParticipationTitleIII ppt3
			ON ske.StudentIdentifierState = ppt3.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(ppt3.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(ppt3.SchoolIdentifierSea, '')
			AND ppt3.ProgramParticipationBeginDate >= el.EnglishLearner_StatusStartDate 
			AND ppt3.ProgramParticipationEndDate <= ISNULL(el.EnglishLearner_StatusEndDate, GETDATE())
	--sex (RDS)
		LEFT JOIN rds.vwDimK12Demographics rdkd
			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
	--english learner (RDS)	
		LEFT JOIN #vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--title 3 (RDS)	
		LEFT JOIN rds.vwDimTitleIIIStatuses rdt3s
			ON rsy.SchoolYear = rdt3s.SchoolYear
			AND ISNULL(ppt3.EnglishLearnerParticipation, 'MISSING') = ISNULL(rdt3s.ProgramParticipationTitleIIIMap, rdt3s.ProgramParticipationTitleIIICode)
			AND ISNULL(ppt3.Proficiency_TitleIII, 'MISSING') = ISNULL(rdt3s.ProficiencyStatusMap, rdt3s.ProficiencyStatusCode)
			AND rdt3s.FormerEnglishLearnerYearStatusCode = 'MISSING'
	--languages (RDS)
		LEFT JOIN #vwLanguages rdvl
			ON ISNULL(immigrant.ISO_639_2_NativeLanguage, 'MISSING') = ISNULL(rdvl.Iso6392LanguageMap, 'MISSING')
		JOIN RDS.DimAges rda
			ON RDS.Get_Age(ske.Birthdate, immigrant.Immigrant_ProgramParticipationStartDate) = rda.AgeValue
	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
		JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState = rdp.StateStudentIdentifier
			AND rdp.IsActiveK12Student = 1
			AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(ske.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND el.EnglishLearner_StatusStartDate >= rdp.RecordStartDateTime 
			AND el.EnglishLearner_StatusStartDate <= ISNULL(rdp.RecordEndDateTime, GETDATE())
		WHERE el.EnglishLearner_StatusStartDate >= ske.EnrollmentEntryDate 
		AND el.EnglishLearner_StatusStartDate <= ISNULL(ske.EnrollmentExitDate, GETDATE())

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
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StudentCounts_TitleIIIELSY', 'RDS.FactK12StudentCounts', 'FactK12StudentCounts', 'FactK12StudentCounts', ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH

END

GO

