CREATE PROCEDURE [Staging].[Staging-to-FactK12AccessibleEducationMaterialAssignments]
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
		IF OBJECT_ID(N'tempdb..#vwEconomicallyDisadvantagedStatuses') IS NOT NULL DROP TABLE #vwEconomicallyDisadvantagedStatuses
		IF OBJECT_ID(N'tempdb..#vwHomelessnessStatuses') IS NOT NULL DROP TABLE #vwHomelessnessStatuses
		IF OBJECT_ID(N'tempdb..#vwMigrantStatuses') IS NOT NULL DROP TABLE #vwMigrantStatuses
		IF OBJECT_ID(N'tempdb..#vwFosterCareStatuses') IS NOT NULL DROP TABLE #vwFosterCareStatuses
		IF OBJECT_ID(N'tempdb..#vwImmigrantStatuses') IS NOT NULL DROP TABLE #vwImmigrantStatuses



	BEGIN TRY

		DECLARE @SchoolYearId int, @SYStartDate DATE, @SYEndDate DATE
		
	--Setting variables to be used in the select statements 
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

		CREATE CLUSTERED INDEX ix_tempvwGradeLevels ON #vwGradeLevels (GradeLevelTypeDescription, GradeLevelMap);

		SELECT *
		INTO #vwIdeaStatuses
		FROM RDS.vwDimIdeaStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwIdeaStatuses ON #vwIdeaStatuses (IdeaIndicatorMap, IdeaEducationalEnvironmentForSchoolageMap);

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

		SELECT *
		INTO #vwEconomicallyDisadvantagedStatuses
		FROM RDS.vwDimEconomicallyDisadvantagedStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwEconomicallyDisadvantagedStatuses
			ON #vwEconomicallyDisadvantagedStatuses (EconomicDisadvantageStatusCode, EligibilityStatusForSchoolFoodServiceProgramsCode, NationalSchoolLunchProgramDirectCertificationIndicatorCode);

		SELECT *
		INTO #vwHomelessnessStatuses
		FROM RDS.vwDimHomelessnessStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwHomelessnessStatuses
			ON #vwHomelessnessStatuses (HomelessnessStatusCode, HomelessPrimaryNighttimeResidenceCode, HomelessUnaccompaniedYouthStatusCode);

		SELECT *
		INTO #vwImmigrantStatuses
		FROM RDS.vwDimImmigrantStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwImmigrantStatuses
			ON #vwImmigrantStatuses (TitleIIIImmigrantStatusCode, TitleIIIImmigrantParticipationStatusCode);

		SELECT *
		INTO #vwMigrantStatuses
		FROM RDS.vwDimMigrantStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwMigrantStatuses
			ON #vwMigrantStatuses (MigrantStatusCode, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, ConsolidatedMEPFundsStatusCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode);

	
		DELETE RDS.FactK12AccessibleEducationMaterialAssignments
		WHERE SchoolYearId = @SchoolYearId 


		IF OBJECT_ID('tempdb..#Facts') IS NOT NULL 
			DROP TABLE #Facts
		
	--Create and load #Facts temp table
		CREATE TABLE #Facts (
			StagingId								int not null,
			[SchoolYearId] [int] NULL,
			[CountDateId] [int] NULL,
			[K12StudentId] [bigint] NULL,
			[SeaId] [int] NULL,
			[IeuId] [int] NULL,
			[LeaId] [int] NULL,
			[K12SchoolId] [int] NULL,
			[AccessibleEducationMaterialProviderId] [int] NULL,
			[AccessibleEducationMaterialId] [int] NULL,
			[DataCollectionId] [int] NULL,
			[DisabilityStatusId] [int] NULL,
			[EconomicallyDisadvantagedStatusId] [int] NULL,
			[EnglishLearnerStatusId] [int] NULL,
			[EntryGradeLevelId] [int] NULL,
			[FosterCareStatusId] [int] NULL,
			[HomelessnessStatusId] [int] NULL,
			[IdeaStatusId] [int] NULL,
			[ImmigrantStatusId] [int] NULL,
			[K12CourseId] [int] NULL,
			[K12DemographicId] [int] NULL,
			[K12EnrollmentStatusId] [int] NULL,
			[MigrantStatusId] [int] NULL,
			[MilitaryStatusId] [int] NULL,
			[PrimaryIdeaDisabilityTypeId] [int] NULL,
			[SecondaryIdeaDisabilityTypeId] [int] NULL,
			[ScedCodeId] [int] NULL,
			[EnrollmentEntryDateId] [int] NULL,
			[EnrollmentExitDateId] [int] NULL,
			[StatusStartDateEconomicallyDisadvantagedId(*)] [int] NULL,
			[StatusEndDateEconomicallyDisadvantagedId] [int] NULL,
			[StatusStartDateEnglishLearnerId] [int] NULL,
			[StatusEndDateEnglishLearnerId] [int] NULL,
			[StatusStartDateHomelessnessId] [int] NULL,
			[StatusEndDateHomelessnessId] [int] NULL,
			[StatusStartDateIdeaId] [int] NULL,
			[StatusEndDateIdeaId] [int] NULL,
			[StatusStartDateMigrantId] [int] NULL,
			[StatusEndDateMigrantId] [int] NULL,
			[StatusStartDateMilitaryId] [int] NULL,
			[StatusEndDateMilitaryId] [int] NULL,
			[StatusStartDatePerkinsEnglishLearnerId] [int] NULL,
			[StatusEndDatePerkinsEnglishLearnerId] [int] NULL,
			[LearningResourceIssuedDateId] [int] NULL,
			[LearningResourceOrderedDateId] [int] NULL,
			[LearningResourceReceivedDateId] [int] NULL,
			[CourseSectionStartDateId] [int] NULL,
			[CourseSectionEndDateId] [int] NULL
		)

		INSERT INTO #Facts
		SELECT DISTINCT
			sppse.Id													StagingId
			, rsy.DimSchoolYearId										SchoolYearId
			, rdd.DimDateId												CountDateId
			, ISNULL(rdp.DimPersonId, -1)								K12StudentId
			, ISNULL(rds.DimSeaId, -1)									SEAId
			, -1														IEUId
			, ISNULL(rdl.DimLeaID, -1)									LEAId
			, ISNULL(rdksch.DimK12SchoolId, -1)							K12SchoolId

			, -1														AccessibleEducationMaterialProviderId
			, -1														AccessibleEducationMaterialId

			, -1														DisabilityStatusId
			, -1										 				EconomicallyDisadvantagedStatusId
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)				EnglishLearnerStatusId
			, ISNULL(rgls.DimGradeLevelId, -1)							EntryGradeLevelId
			, -1														FosterCareStatusId
			, -1										 				HomelessnessStatusId
			, ISNULL(rdis.DimIdeaStatusId, -1)							IdeaStatusId
			, -1														ImmigrantStatusId
			, -1														K12CourseId
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId
			, -1														K12EnrollmentStatusId
			, -1														MigrantStatusId
			, -1														MilitaryStatusId
			, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)					PrimaryIdeaDisabilityTypeId
			, -1														SecondaryIdeaDisabilityTypeId
			, -1														ScedCodeId
			, rda.DimAgeId												AgeId
			, ISNULL(rdr.DimRaceId, -1)									RaceId
			, -1														EnrollmentEntryDateId
			, -1														EnrollmentExitDateId
			, -1														StatusStartDateEconomicallyDisadvantagedId
			, -1														StatusEndDateEconomicallyDisadvantagedId
			, -1														StatusStartDateEnglishLearnerId
			, -1														StatusEndDateEnglishLearnerId
			, -1														StatusStartDateHomelessnessId
			, -1														StatusEndDateHomelessnessId
			, -1														StatusStartDateIdeaId
			, -1														StatusEndDateIdeaId
			, -1														StatusStartDateMigrantId
			, -1														StatusEndDateMigrantId
			, -1														StatusStartDateMilitaryId
			, -1														StatusEndDateMilitaryId
			, -1														StatusStartDatePerkinsEnglishLearnerId
			, -1														StatusEndDatePerkinsEnglishLearnerId
			, -1														LearningResourceIssuedDateId
			, -1														LearningResourceOrderedDateId
			, -1														LearningResourceReceivedDateId
			, -1														CourseSectionStartDateId
			, -1														CourseSectionEndDateId
		FROM Staging.K12Enrollment ske
			JOIN RDS.DimSchoolYears rsy
				ON ske.SchoolYear = rsy.SchoolYear
		--demographics			
			JOIN RDS.vwDimK12Demographics rdkd
 				ON rsy.SchoolYear = rdkd.SchoolYear
				AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		--age			
			JOIN RDS.DimAges rda
				ON RDS.Get_Age(ske.Birthdate, @SYStartDate) = rda.AgeValue
		--seas (rds)			
			JOIN RDS.DimSeas rds
				ON @SYStartDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())		
		--program participation special education	
			JOIN Staging.ProgramParticipationSpecialEducation sppse
				ON ske.StudentIdentifierState = sppse.StudentIdentifierState
				AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(sppse.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(sppse.SchoolIdentifierSea,'')
				AND @SYStartDate BETWEEN sppse.ProgramParticipationBeginDate AND ISNULL(sppse.ProgramParticipationEndDate, GETDATE())
		--dimpeople	(rds)
			JOIN RDS.DimPeople rdp
				ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
				AND IsActiveK12Student = 1
				AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
				AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
				AND ISNULL(ske.LastOrSurname, 'MISSING') = rdp.LastOrSurname
				AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
				AND @SYStartDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
			--idea disability type			
			LEFT JOIN Staging.IdeaDisabilityType sidt	
				ON ske.SchoolYear = sidt.SchoolYear
				AND sidt.StudentIdentifierState = sppse.StudentIdentifierState
				AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
				AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
				AND sidt.IsPrimaryDisability = 1
				AND @SYStartDate BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, GETDATE())
			LEFT JOIN RDS.DimDates rdd
				ON sppse.ProgramParticipationEndDate = rdd.DateValue
				AND rdd.DateValue BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		--leas (rds)	
			LEFT JOIN RDS.DimLeas rdl
				ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
				AND @SYStartDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
		--schools (rds)
			LEFT JOIN RDS.DimK12Schools rdksch
				ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
				AND @SYStartDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
		--grade levels (rds)
			LEFT JOIN #vwGradeLevels rgls
				ON ske.GradeLevel = rgls.GradeLevelMap
				AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
		--person status 
			LEFT JOIN Staging.PersonStatus el 
				ON ske.StudentIdentifierState = el.StudentIdentifierState
				AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(el.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(el.SchoolIdentifierSea,'')
				AND @SYStartDate BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, GETDATE())
		--english learner (rds)
			LEFT JOIN #vwEnglishLearnerStatuses rdels
				ON rsy.SchoolYear = rdels.SchoolYear
				AND rdels.PerkinsEnglishLearnerStatusCode = 'MISSING'
				AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
		--race (rds)
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
		--idea status (rds)	
			LEFT JOIN #vwIdeaStatuses rdis
				ON rdis.IdeaIndicatorCode = 'Yes'
				AND rdis.SpecialEducationExitReasonCode = 'MISSING'
				AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
				AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
		--idea disability type (rds)
			LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
				ON sidt.SchoolYear = rdidt.SchoolYear
				AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidt.IdeaDisabilityTypeMap, rdidt.IdeaDisabilityTypeCode)
				AND sidt.IsPrimaryDisability = 1
			
			WHERE @SYStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, GETDATE())

	--Final insert into RDS.FactK12AccessibleEducationMaterialAssignments table
		INSERT INTO RDS.FactK12AccessibleEducationMaterialAssignments (
			   [SchoolYearId]
			  ,[CountDateId]
			  ,[K12StudentId]
			  ,[SeaId]
			  ,[IeuId]
			  ,[LeaId]
			  ,[K12SchoolId]
			  ,[AccessibleEducationMaterialProviderId]
			  ,[AccessibleEducationMaterialId]
			  ,[DataCollectionId]
			  ,[DisabilityStatusId]
			  ,[EconomicallyDisadvantagedStatusId]
			  ,[EnglishLearnerStatusId]
			  ,[EntryGradeLevelId]
			  ,[FosterCareStatusId]
			  ,[HomelessnessStatusId]
			  ,[IdeaStatusId]
			  ,[ImmigrantStatusId]
			  ,[K12CourseId]
			  ,[K12DemographicId]
			  ,[K12EnrollmentStatusId]
			  ,[MigrantStatusId]
			  ,[MilitaryStatusId]
			  ,[PrimaryIdeaDisabilityTypeId]
			  ,[SecondaryIdeaDisabilityTypeId]
			  ,[ScedCodeId]
			  ,[EnrollmentEntryDateId]
			  ,[EnrollmentExitDateId]
			  ,[StatusStartDateEconomicallyDisadvantagedId(*)]
			  ,[StatusEndDateEconomicallyDisadvantagedId]
			  ,[StatusStartDateEnglishLearnerId]
			  ,[StatusEndDateEnglishLearnerId]
			  ,[StatusStartDateHomelessnessId]
			  ,[StatusEndDateHomelessnessId]
			  ,[StatusStartDateIdeaId]
			  ,[StatusEndDateIdeaId]
			  ,[StatusStartDateMigrantId]
			  ,[StatusEndDateMigrantId]
			  ,[StatusStartDateMilitaryId]
			  ,[StatusEndDateMilitaryId]
			  ,[StatusStartDatePerkinsEnglishLearnerId]
			  ,[StatusEndDatePerkinsEnglishLearnerId]
			  ,[LearningResourceIssuedDateId]
			  ,[LearningResourceOrderedDateId]
			  ,[LearningResourceReceivedDateId]
			  ,[CourseSectionStartDateId]
			  ,[CourseSectionEndDateId]
		)
		SELECT 
			   [SchoolYearId]
			  ,[CountDateId]
			  ,[K12StudentId]
			  ,[SeaId]
			  ,[IeuId]
			  ,[LeaId]
			  ,[K12SchoolId]
			  ,[AccessibleEducationMaterialProviderId]
			  ,[AccessibleEducationMaterialId]
			  ,[DataCollectionId]
			  ,[DisabilityStatusId]
			  ,[EconomicallyDisadvantagedStatusId]
			  ,[EnglishLearnerStatusId]
			  ,[EntryGradeLevelId]
			  ,[FosterCareStatusId]
			  ,[HomelessnessStatusId]
			  ,[IdeaStatusId]
			  ,[ImmigrantStatusId]
			  ,[K12CourseId]
			  ,[K12DemographicId]
			  ,[K12EnrollmentStatusId]
			  ,[MigrantStatusId]
			  ,[MilitaryStatusId]
			  ,[PrimaryIdeaDisabilityTypeId]
			  ,[SecondaryIdeaDisabilityTypeId]
			  ,[ScedCodeId]
			  ,[EnrollmentEntryDateId]
			  ,[EnrollmentExitDateId]
			  ,[StatusStartDateEconomicallyDisadvantagedId(*)]
			  ,[StatusEndDateEconomicallyDisadvantagedId]
			  ,[StatusStartDateEnglishLearnerId]
			  ,[StatusEndDateEnglishLearnerId]
			  ,[StatusStartDateHomelessnessId]
			  ,[StatusEndDateHomelessnessId]
			  ,[StatusStartDateIdeaId]
			  ,[StatusEndDateIdeaId]
			  ,[StatusStartDateMigrantId]
			  ,[StatusEndDateMigrantId]
			  ,[StatusStartDateMilitaryId]
			  ,[StatusEndDateMilitaryId]
			  ,[StatusStartDatePerkinsEnglishLearnerId]
			  ,[StatusEndDatePerkinsEnglishLearnerId]
			  ,[LearningResourceIssuedDateId]
			  ,[LearningResourceOrderedDateId]
			  ,[LearningResourceReceivedDateId]
			  ,[CourseSectionStartDateId]
			  ,[CourseSectionEndDateId]
		FROM #Facts

		ALTER INDEX ALL ON RDS.FactK12AccessibleEducationMaterialAssignments REBUILD

	END TRY
	BEGIN CATCH
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12AccessibleEducationMaterialAssignments', 'RDS.FactK12AccessibleEducationMaterialAssignments', 'FactK12AccessibleEducationMaterialAssignments', 'FactK12AccessibleEducationMaterialAssignments', ERROR_MESSAGE(), 1, NULL, GETDATE())

		insert into app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) values	(getutcdate(), 2, 'ERROR: ' + ERROR_MESSAGE())

	END CATCH

END
GO


