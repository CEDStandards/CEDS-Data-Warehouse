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

		SET @SYStartDate = Staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = Staging.GetFiscalYearEndDate(@SchoolYear)

		/* File Spec 116 as of 2023 change this to be School Year - Any 12-month reporting period 		*/
		IF @SchoolYear < 2023
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

			SELECT @SYStartDate = @ReportingDate, @SYEndDate = @ReportingDate
		END

	--Get the set of students from DimPeople to be used for the migrated SY
		select K12StudentStudentIdentifierState
			, max(DimPersonId)								DimPersonId
			, min(RecordStartDateTime)						RecordStartDateTime
			, max(isnull(RecordEndDateTime, @SYEndDate))	RecordEndDateTime
			, max(isnull(birthdate, '1900-01-01'))			BirthDate
		into #dimPeople
		from RDS.DimPeople
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

	--Create the temp tables (and any relevant indexes) needed for this domain
		SELECT *
		INTO #vwIdeaStatuses
		FROM RDS.vwDimIdeaStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwIdeaStatuses 
			ON #vwIdeaStatuses (IdeaIndicatorMap, IdeaEducationalEnvironmentForSchoolageMap);

		SELECT * INTO #vwTitleIIIStatuses
		FROM RDS.vwDimTitleIIIStatuses 
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwTitleIIIStatuses 
			ON #vwTitleIIIStatuses (TitleIIIImmigrantParticipationStatusMap, ProficiencyStatusMap, TitleIIIAccountabilityProgressStatusMap, TitleIIILanguageInstructionProgramTypeMap);

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
			ON #vwEnglishLearnerStatuses (EnglishLearnerStatusCode, PerkinsEnglishLearnerStatusCode)

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

		CREATE CLUSTERED INDEX ix_tempvwRaces 
			ON #vwRaces (RaceMap);

		SELECT * 
		INTO #vwUnduplicatedRaceMap 
		FROM RDS.vwUnduplicatedRaceMap
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwUnduplicatedRaceMap ON #vwUnduplicatedRaceMap (StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, RaceMap);

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM RDS.DimFactTypes
		WHERE FactTypeCode = 'TitleIIIELSY' -- DimFactTypeId = 10

		IF OBJECT_ID('tempdb..#Facts') IS NOT NULL 
			DROP TABLE #Facts
		
		--Create and load #Facts temp table
		CREATE TABLE #Facts (
			StagingId									int not null
			, SchoolYearId								int null
			, FactTypeId								int null
			, GradeLevelId								int null
			, AgeId										int null
			, RaceId									int null
			, K12DemographicId							int null
			, StudentCount								int null
			, SEAId										int null
			, IEUId										int null
			, LEAId										int null
			, K12SchoolId								int null
			, K12StudentId								int null
			, IdeaStatusId								int null
			, DisabilityStatusId						int null
			, LanguageId								int null
			, MigrantStatusId							int null
			, TitleIStatusId							int null
			, TitleIIIStatusId							int null
			, AttendanceId								int null
			, CohortStatusId							int null
			, NOrDStatusId								int null
			, CTEStatusId								int null
			, K12EnrollmentStatusId						int null
			, EnglishLearnerStatusId					int null
			, HomelessnessStatusId						int null
			, EconomicallyDisadvantagedStatusId			int null
			, FosterCareStatusId						int null
			, ImmigrantStatusId							int null
			, PrimaryDisabilityTypeId					int null
			, SpecialEducationServicesExitDateId		int null
			, MigrantStudentQualifyingArrivalDateId		int null
			, LastQualifyingMoveDateId					int null
		)

		INSERT INTO #Facts
		SELECT DISTINCT
			ske.id												StagingId							
			, rsy.DimSchoolYearId								SchoolYearId
			, @FactTypeId										FactTypeId							
			, ISNULL(rgls.DimGradeLevelId, -1)					GradeLevelId							
			, -1												AgeId									
			, ISNULL(rdr.DimRaceId, -1)							RaceId								
			, -1												K12DemographicId						
			, 1													StudentCount							
			, ISNULL(rds.DimSeaId, -1)							SEAId									
			, -1												IEUId									
			, ISNULL(rdl.DimLeaID, -1)							LEAId									
			, ISNULL(rdksch.DimK12SchoolId, -1)					K12SchoolId							
			, ISNULL(rdp.DimPersonId, -1)						K12StudentId							
			, -1												IdeaStatusId							
			, -1												DisabilityStatusId							
			, ISNULL(rdvl.DimLanguageId, -1)					LanguageId							
			, -1												MigrantStatusId						
			, -1												TitleIStatusId						
			, isnull(rdt3s.DimTitleIIIStatusId, -1)				TitleIIIStatusId						
			, -1												AttendanceId							
			, -1												CohortStatusId						
			, -1 												NOrDStatusId							
			, -1												CTEStatusId							
			, -1												K12EnrollmentStatusId					
			, isnull(rdels.DimEnglishLearnerStatusId, -1)		EnglishLearnerStatusId
			, -1												HomelessnessStatusId					
			, -1												EconomicallyDisadvantagedStatusId		
			, -1												FosterCareStatusId					
			, -1												ImmigrantStatusId						
			, -1												PrimaryDisabilityTypeId				
			, -1												SpecialEducationServicesExitDateId	
			, -1												MigrantStudentQualifyingArrivalDateId	
			, -1												LastQualifyingMoveDateId				
		
		FROM Staging.K12Enrollment ske
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
	-- seas (rds)
		JOIN RDS.DimSeas rds
			ON convert(date, rds.RecordStartDateTime)  <= @SYEndDate
			AND ISNULL(convert(date, rds.RecordEndDateTime), @SYEndDate) >= @SYStartDate
	-- dimpeople (rds)
		JOIN #dimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND rdp.RecordStartDateTime  <= @SYEndDate
			AND ISNULL(rdp.RecordEndDateTime, @SYEndDate) >= @SYStartDate
			and CONVERT(DATE, ske.EnrollmentEntryDate) = CONVERT(DATE, rdp.RecordStartDateTime)
			and ISNULL(CONVERT(DATE, ske.EnrollmentExitDate), @SYEndDate) = ISNULL(CONVERT(DATE, rdp.RecordEndDateTime), @SYEndDate)
	-- TitleIII Status
		LEFT JOIN Staging.ProgramParticipationTitleIII sppt3
			ON ske.SchoolYear = sppt3.SchoolYear		
			AND ske.StudentIdentifierState = sppt3.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sppt3.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppt3.SchoolIdentifierSea, '')
			AND ISNULL(sppt3.ProgramParticipationBeginDate, @SYStartDate) <= @SYEndDate
			AND ISNULL(sppt3.ProgramParticipationEndDate, @SYEndDate) >= @SYStartDate
	--english learner
		JOIN Staging.PersonStatus el 
			ON ske.SchoolYear = el.SchoolYear		
			AND ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND ISNULL(el.EnglishLearner_StatusStartDate, @SYStartDate) <= @SYEndDate
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
	--title III (rds)
		LEFT JOIN #vwTitleIIIStatuses rdt3s
			ON ISNULL(sppt3.TitleIIIImmigrantStatus, -1) 						= ISNULL(CAST(rdt3s.TitleIIIImmigrantParticipationStatusMap AS SMALLINT), -1)
			AND ISNULL(sppt3.TitleIIILanguageInstructionProgramType, 'MISSING') = ISNULL(rdt3s.TitleIIILanguageInstructionProgramTypeMap, rdt3s.TitleIIILanguageInstructionProgramTypeCode)
			AND ISNULL(sppt3.Proficiency_TitleIII, 'MISSING') 					= ISNULL(rdt3s.ProficiencyStatusMap, rdt3s.ProficiencyStatusCode) 
			AND ISNULL(sppt3.TitleIIIAccountabilityProgressStatus, 'MISSING') 	= ISNULL(rdt3s.TitleIIIAccountabilityProgressStatusMap, rdt3s.TitleIIIAccountabilityProgressStatusCode)
			AND rdt3s.ProgramParticipationTitleIIILiepCode 						= 'MISSING'
	--english learner (rds)
		LEFT JOIN #vwEnglishLearnerStatuses rdels
			ON ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(CAST(rdels.EnglishLearnerStatusMap AS SMALLINT), -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--languages (rds)
		LEFT JOIN #vwLanguages rdvl
			ON ISNULL(el.ISO_639_2_NativeLanguage, 'MISSING') = ISNULL(rdvl.Iso6392LanguageMap, 'MISSING')
	--grade (rds)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
	--race (rds)	
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
		WHERE ske.EnrollmentEntryDate  <= @SYEndDate
		AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) >= @SYStartDate

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
		insert into App.DataMigrationHistories
		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		values	(getutcdate(), 2, 'ERROR: ' + ERROR_MESSAGE())
	END CATCH

END
GO


