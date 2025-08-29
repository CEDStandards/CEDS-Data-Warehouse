/**********************************************************************
Author: AEM Corp
Date:	1/6/2022
Description: Migrates Child Count Data FROM Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 002, 089
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_ChildCount]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwIdeaStatuses') IS NOT NULL DROP TABLE #vwIdeaStatuses
		IF OBJECT_ID(N'tempdb..#vwUnduplicatedRaceMap') IS NOT NULL DROP TABLE #vwUnduplicatedRaceMap
		IF OBJECT_ID(N'tempdb..#vwEnglishLearnerStatuses') IS NOT NULL DROP TABLE #vwEnglishLearnerStatuses

	BEGIN TRY

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId int,
		@ChildCountDate date,
		@SYStartDate date,
		@SYEndDate date

		SET @SYStartDate = Staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = Staging.GetFiscalYearEndDate(@SchoolYear)
		
	--Setting variables to be used in the select statements 
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SELECT @ChildCountDate = tr.ResponseValue
		FROM App.ToggleQuestions tq
		JOIN App.ToggleResponses tr
			ON tq.ToggleQuestionId = tr.ToggleQuestionId
		WHERE tq.EmapsQuestionAbbrv = 'CHDCTDTE'

		SELECT @ChildCountDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-' + CAST(MONTH(@ChildCountDate) AS VARCHAR(2)) + '-' + CAST(DAY(@ChildCountDate) AS VARCHAR(2)) AS DATE)

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

		CREATE CLUSTERED INDEX ix_tempvwGradeLevels ON #vwGradeLevels (GradeLevelTypeDescription, GradeLevelMap);

		SELECT *
		INTO #vwIdeaStatuses
		FROM RDS.vwDimIdeaStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwIdeaStatuses ON #vwIdeaStatuses (IdeaIndicatorMap, IdeaEducationalEnvironmentForSchoolAgeMap);

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

		SELECT * 
		INTO #vwEnglishLearnerStatuses 
		FROM RDS.vwDimEnglishLearnerStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwEnglishLearnerStatuses ON #vwEnglishLearnerStatuses (EnglishLearnerStatusMap)


		SELECT @FactTypeId = DimFactTypeId 
		FROM RDS.DimFactTypes
		WHERE FactTypeCode = 'childcount'

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
			sppse.Id													StagingId
			, rsy.DimSchoolYearId										SchoolYearId
			, @FactTypeId												FactTypeId
			, ISNULL(rgls.DimGradeLevelId, -1)							GradeLevelId
			, rda.DimAgeId												AgeId
			, ISNULL(rdr.DimRaceId, -1)									RaceId
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId
			, 1															StudentCount
			, ISNULL(rds.DimSeaId, -1)									SeaId
			, -1														IeuId
			, ISNULL(rdl.DimLeaId, -1)									LeaId
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
			, -1														CteStatusId
			, -1														K12EnrollmentStatusId
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)				EnglishLearnerStatusId
			, -1										 				HomelessnessStatusId
			, -1										 				EconomicallyDisadvantagedStatusId
			, -1														FosterCareStatusId
			, -1														ImmigrantStatusId
			, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)					PrimaryDisabilityTypeId
			, ISNULL(rdd.DimDateId, -1)									SpecialEducationServicesExitDateId
			, -1														MigrantStudentQualifyingArrivalDateId
			, -1								
		FROM Staging.K12Enrollment ske
			JOIN RDS.DimSchoolYears rsy
				ON ske.SchoolYear = rsy.SchoolYear
		--demographics			
			JOIN RDS.vwDimK12Demographics rdkd
 				ON rsy.SchoolYear = rdkd.SchoolYear
				AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		--age			
			JOIN RDS.DimAges rda
				ON RDS.Get_Age(ske.Birthdate, @ChildCountDate) = rda.AgeValue
		--seas (rds)			
			JOIN RDS.DimSeas rds
				ON @ChildCountDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, @SYEndDate)		
		--program participation special education	
			JOIN Staging.ProgramParticipationSpecialEducation sppse
				ON ske.SchoolYear = sppse.SchoolYear
				AND ske.StudentIdentifierState = sppse.StudentIdentifierState
				AND ISNULL(ske.LeaIdentifierSeaAccountability,'') = ISNULL(sppse.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(sppse.SchoolIdentifierSea,'')
				AND @ChildCountDate BETWEEN sppse.ProgramParticipationStartDate AND ISNULL(sppse.ProgramParticipationExitDate, @SYEndDate)
		--dimpeople	(rds)
			JOIN #dimPeople rdp
				ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
				AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.Birthdate, '1/1/1900')
				AND @ChildCountDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @SYEndDate)
			LEFT JOIN RDS.DimDates rdd
				ON sppse.ProgramParticipationExitDate = rdd.DateValue
				AND rdd.DateValue BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @SYEndDate)
		--leas (rds)	
			LEFT JOIN RDS.DimLeas rdl
				ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
				AND @ChildCountDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, @SYEndDate)
		--schools (rds)
			LEFT JOIN RDS.DimK12Schools rdksch
				ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
				AND @ChildCountDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, @SYEndDate)
		--grade levels (rds)
			LEFT JOIN #vwGradeLevels rgls
				ON ske.GradeLevel = rgls.GradeLevelMap
				AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
		--idea disability type			
			LEFT JOIN Staging.IdeaDisabilityType sidt	
				ON ske.SchoolYear = sidt.SchoolYear
				AND sidt.StudentIdentifierState = sppse.StudentIdentifierState
				AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
				AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
				AND sidt.IsPrimaryDisability = 1
				AND @ChildCountDate BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, @SYEndDate)
		--person status 
			LEFT JOIN Staging.PersonStatus el 
				ON ske.SchoolYear = el.SchoolYear
				AND ske.StudentIdentifierState = el.StudentIdentifierState
				AND ISNULL(ske.LeaIdentifierSeaAccountability,'') = ISNULL(el.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(el.SchoolIdentifierSea,'')
				AND @ChildCountDate BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, @SYEndDate)
		--english learner (rds)
			LEFT JOIN #vwEnglishLearnerStatuses rdels
				ON rsy.SchoolYear = rdels.SchoolYear
				AND rdels.PerkinsEnglishLearnerStatusCode = 'MISSING'
				AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
		--race (rds)
			LEFT JOIN #vwUnduplicatedRaceMap spr
				ON ske.StudentIdentifierState = spr.StudentIdentifierState
				AND ISNULL(ske.LeaIdentifierSeaAccountability,'') = ISNULL(spr.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(spr.SchoolIdentifierSea,'')

			LEFT JOIN #vwRaces rdr
				ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
					CASE
						when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
						WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
						ELSE 'Missing'
					END
		--idea status (rds)	
			LEFT JOIN #vwIdeaStatuses rdis
				ON ISNULL(CAST(sppse.IdeaIndicator AS SMALLINT), -1) = ISNULL(rdis.IdeaIndicatorMap, -1)
				AND ISNULL(sppse.IdeaEducationalEnvironmentForEarlyChildhood,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
				AND ISNULL(sppse.IdeaEducationalEnvironmentForSchoolAge,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
				AND rdis.SpecialEducationExitReasonCode = 'MISSING'
		--idea disability type (rds)
			LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
				ON sidt.SchoolYear = rdidt.SchoolYear
				AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidt.IdeaDisabilityTypeMap, rdidt.IdeaDisabilityTypeCode)
				AND sidt.IsPrimaryDisability = 1
			
			WHERE @ChildCountDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)

	--Final INSERT INTO RDS.FactK12StudentCounts table
		INSERT INTO RDS.FactK12StudentCounts (
			[SchoolYearId]
			, [FactTypeId]
			, [GradeLevelId]
			, [AgeId]
			, [RaceId]
			, [K12DemographicId]
			, [StudentCount]
			, [SeaId]
			, [IeuId]
			, [LeaId]
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
			, [CteStatusId]
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
			, [SeaId]
			, [IeuId]
			, [LeaId]
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
			, [CteStatusId]
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
	INSERT INTO App.DataMigrationHistories
		(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
		values	(getutcdate(), 2, 'ERROR: ' + ERROR_MESSAGE())
	END CATCH

END
GO


