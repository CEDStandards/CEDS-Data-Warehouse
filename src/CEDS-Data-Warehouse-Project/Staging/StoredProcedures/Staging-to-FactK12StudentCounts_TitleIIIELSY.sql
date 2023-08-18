/**********************************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Title III EL SY Data from Staging to RDS.FactK12StudentCounts

NNOTE: This Stored Procedure processes files: 116 (as of 2023), 045, 204 (retired)
***********************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_TitleIIIELSY]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwTitleIIIStatuses') IS NOT NULL DROP TABLE #vwTitleIIIStatuses
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwUnduplicatedRaceMap') IS NOT NULL DROP TABLE #vwUnduplicatedRaceMap
		IF OBJECT_ID(N'tempdb..#vwEnglishLearnerStatuses') IS NOT NULL DROP TABLE #vwEnglishLearnerStatuses
		IF OBJECT_ID(N'tempdb..#vwLanguages') IS NOT NULL DROP TABLE #vwLanguages
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#vwIdeaStatuses') IS NOT NULL DROP TABLE #vwIdeaStatuses

	BEGIN TRY

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId INT,
		@SYStartDate DATE,
		@SYEndDate DATE,
		@ReportingDate DATE
		
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SET @SYStartDate = staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = staging.GetFiscalYearEndDate(@SchoolYear)


		/* File Spec as of 2023 change this to be School Year - Any 12-month reporting period 		*/

		if @SchoolYear < 2023
		BEGIN
			--Reporting Date is the closest school day to Oct 1 according to the file spec
			DECLARE @testDate datetime
			SELECT @testDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-' + '10-01' AS DATE)
		
			SELECT @ReportingDate = 
				CASE DATEPART(DW, @testDate)
					WHEN 1 THEN (SELECT DATEADD(day, 1, @testDate))
					WHEN 7 THEN (SELECT DATEADD(day, -1, @testDate))
					ELSE @testDate
				END	

			select @SYStartDate = @ReportingDate, @SYEndDate = @ReportingDate
		END

	--Create the temp tables (and any relevant indexes) needed for this domain

		SELECT *
		INTO #vwIdeaStatuses
		FROM RDS.vwDimIdeaStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwIdeaStatuses ON #vwIdeaStatuses (IdeaIndicatorMap, IdeaEducationalEnvironmentForSchoolageMap);


		
		select * into #vwTitleIIIStatuses
		from rds.vwDimTitleIIIStatuses 
		where SchoolYear = @SchoolYear

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
			ON #vwEnglishLearnerStatuses (EnglishLearnerStatusCode, PerkinsEnglishLearnerStatusCode)--, TitleIIIAccountabilityProgressStatusCode, TitleIIILanguageInstructionProgramTypeCode);

		SELECT min(DimLanguageId) DimLanguageId, SchoolYear, Iso6392LanguageCodeCode, Iso6392LanguageMap -- Using min(DimLanguageId) for now because there are duplicates in the Dim table.  This is being corrected.
		INTO #vwLanguages
		FROM RDS.vwDimLanguages
		WHERE SchoolYear = @SchoolYear
		GROUP BY SchoolYear, Iso6392LanguageCodeCode, Iso6392LanguageMap

		CREATE CLUSTERED INDEX ix_tempvwLanguages
			ON #vwLanguages (Iso6392LanguageCodeCode);


		SELECT * 
		INTO #vwRaces 
		FROM RDS.vwDimRaces
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwRaces ON #vwRaces (RaceMap);

		SELECT * 
		INTO #vwUnduplicatedRaceMap 
		FROM RDS.vwUnduplicatedRaceMap
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwUnduplicatedRaceMap ON #vwUnduplicatedRaceMap (StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, RaceMap);



		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'TitleIIIELSY' -- DimFactTypeId = 9


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
			, -1										AgeId									
			, ISNULL(rdr.DimRaceId, -1)					RaceId								
			, ISNULL(rdkd.DimK12DemographicId, -1)		K12DemographicId						
			, 1											StudentCount							
			, ISNULL(rds.DimSeaId, -1)					SEAId									
			, -1										IEUId									
			, ISNULL(rdl.DimLeaID, -1)					LEAId									
			, ISNULL(rdksch.DimK12SchoolId, -1)			K12SchoolId							
			, ISNULL(rdp.DimPersonId, -1)				K12StudentId							
			, -1										IdeaStatusId							
			, -1										DisabilityStatusId							
			, ISNULL(rdvl.DimLanguageId, -1)			LanguageId							
			, -1										MigrantStatusId						
			, -1										TitleIStatusId						
			, isnull(TitleIII.DimTitleIIIStatusId, -1)	TitleIIIStatusId						
			, -1										AttendanceId							
			, -1										CohortStatusId						
			, -1 										NOrDStatusId							
			, -1										CTEStatusId							
			, -1										K12EnrollmentStatusId					
			, isnull(rdels.DimEnglishLearnerStatusId, -1)	EnglishLearnerStatusId	-- USED FOR FS141, but not FS116			
			, -1										HomelessnessStatusId					
			, -1										EconomicallyDisadvantagedStatusId		
			, -1										FosterCareStatusId					
			, -1										ImmigrantStatusId						
			, -1										PrimaryDisabilityTypeId				
			, -1										SpecialEducationServicesExitDateId	
			, -1										MigrantStudentQualifyingArrivalDateId	
			, -1										LastQualifyingMoveDateId				
		
		FROM Staging.K12Enrollment ske

		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear

	--demographics
		JOIN rds.vwDimK12Demographics rdkd -- changed this to INNER JOIN to match Child Count
			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)

	-- seas (rds)
		JOIN RDS.DimSeas rds
			ON convert(date, rds.RecordStartDateTime)  <= @SYEndDate
			AND ISNULL(convert(date, rds.RecordEndDateTime), @SYEndDate) >= @SYStartDate

	-- dimpeople (rds)
		JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND rdp.IsActiveK12Student = 1
			AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(ske.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND rdp.RecordStartDateTime  <= @SYEndDate
			AND ISNULL(rdp.RecordEndDateTime, @SYEndDate) >= @SYStartDate

			and convert(date, ske.EnrollmentEntryDate) = convert(date, rdp.RecordStartDateTime)
			and isnull(convert(date, ske.EnrollmentExitDate),getdate()) = isnull(convert(date, rdp.RecordEndDateTime), getdate())


	--english learner
		JOIN Staging.PersonStatus el 
			ON ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND ISNULL(el.EnglishLearner_StatusStartDate, @SYStartDate) <= @SYEndDate -- JW
			AND ISNULL(el.EnglishLearner_StatusEndDate, @SYEndDate) >= @SYStartDate

	-- Leas (rds)
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND rdl.RecordStartDateTime <= @SYEndDate
			AND ISNULL(rdl.RecordEndDateTime, @SYEndDate) >= @SYStartDate

	-- K12Schools (rds)
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND rdksch.RecordStartDateTime  <= @SYEndDate
			AND ISNULL(rdksch.RecordEndDateTime, @SYEndDate) >= @SYStartDate

	--english learner (RDS)
		LEFT JOIN #vwEnglishLearnerStatuses rdels
			ON ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(CAST(rdels.EnglishLearnerStatusMap AS SMALLINT), -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'

	--languages (RDS)
		LEFT JOIN #vwLanguages rdvl
			ON ISNULL(el.ISO_639_2_NativeLanguage, 'MISSING') = ISNULL(rdvl.Iso6392LanguageMap, 'MISSING')

	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'

	--race (RDS)	
		LEFT JOIN #vwUnduplicatedRaceMap spr 
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LEAIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)

		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
	
	-- TitleIII Status
		LEFT JOIN Staging.ProgramParticipationTitleIII sppt3
			ON ske.StudentIdentifierState = sppt3.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sppt3.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppt3.SchoolIdentifierSea, '')

		LEFT JOIN #vwTitleIIIStatuses TitleIII
			on ISNULL(TitleIII.TitleIIIImmigrantParticipationStatusMap, TitleIIIImmigrantParticipationStatusCode) = 
			ISNULL(sppt3.TitleIIIImmigrantStatus, -1)
			AND
			ISNULL(TitleIII.TitleIIILanguageInstructionProgramTypeMap, TitleIII.TitleIIILanguageInstructionProgramTypeCode) = 
			ISNULL(sppt3.TitleIIILanguageInstructionProgramType, 'MISSING')
			AND
			ISNULL(TitleIII.ProficiencyStatusMap, TitleIII.ProficiencyStatusCode) = 
			ISNULL(sppt3.Proficiency_TitleIII, 'MISSING')
			AND
			ISNULL(TitleIII.TitleIIIAccountabilityProgressStatusMap, TitleIII.TitleIIIAccountabilityProgressStatusCode) = 
			ISNULL(sppt3.TitleIIIAccountabilityProgressStatus, 'MISSING')
			AND TitleIII.ProgramParticipationTitleIIILiepCode = 'MISSING'

		WHERE ske.EnrollmentEntryDate  <= @SYEndDate
		AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) >= @SYStartDate

-----------------------------------------------------------------------------------------------------------------------	

		--Clear the Fact table of the data about to be migrated  
		DELETE RDS.FactK12StudentCounts
		WHERE SchoolYearId = @SchoolYearId 
			AND FactTypeId = @FactTypeId
		
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

