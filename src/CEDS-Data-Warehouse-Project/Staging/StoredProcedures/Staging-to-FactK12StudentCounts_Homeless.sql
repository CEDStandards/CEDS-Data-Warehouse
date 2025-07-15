/**********************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Homeless Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 118, 194
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_Homeless]
	@SchoolYear SMALLINT
AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwMigrantStatuses') IS NOT NULL DROP TABLE #vwMigrantStatuses
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#vwIdeaStatuses') IS NOT NULL DROP TABLE #vwIdeaStatuses
		IF OBJECT_ID(N'tempdb..#tempELStatus') IS NOT NULL DROP TABLE #tempELStatus
		IF OBJECT_ID(N'tempdb..#tempMigrantStatus') IS NOT NULL DROP TABLE #tempMigrantStatus

	BEGIN TRY

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId INT,
		@SYStartDate DATE,
		@SYEndDate DATE
		
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SET @SYStartDate = Staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = Staging.GetFiscalYearEndDate(@SchoolYear)

	--Get the set of students from DimPeople to be used for the migrated SY
		SELECT K12StudentStudentIdentifierState
			, max(DimPersonId)								DimPersonId
			, min(RecordStartDateTime)						RecordStartDateTime
			, max(isnull(RecordEndDateTime, @SYEndDate))	RecordEndDateTime
			, max(isnull(birthdate, '1900-01-01'))			BirthDate
		INTO #dimPeople
		FROM RDS.DimPeople
		WHERE ((RecordStartDateTime <= @SYStartDate AND RecordEndDateTime > @SYStartDate)
			OR (RecordStartDateTime > @SYStartDate AND isnull(RecordEndDateTime, @SYEndDate) <= @SYEndDate))
		AND IsActiveK12Student = 1
		GROUP BY K12StudentStudentIdentifierState
		ORDER BY K12StudentStudentIdentifierState

		CREATE INDEX IDX_dimPeople ON #dimPeople (K12StudentStudentIdentifierState, DimPersonId, RecordStartDateTime, RecordEndDateTime, Birthdate)

	--reset the RecordStartDateTime if the date is prior to the default start date of 7/1
		UPDATE #dimPeople
		SET RecordStartDateTime = @SYStartDate
		WHERE RecordStartDateTime < @SYStartDate

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
		INTO #vwIdeaStatuses
		FROM RDS.vwDimIdeaStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwIdeaStatuses 
			ON #vwIdeaStatuses (IdeaIndicatorMap, IdeaEducationalEnvironmentForSchoolageMap);

		SELECT *
		INTO #vwMigrantStatuses
		FROM RDS.vwDimMigrantStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwMigrantStatuses
			ON #vwMigrantStatuses (MigrantStatusCode, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, ConsolidatedMEPFundsStatusCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode);

	--Pull the EL Status into a temp table
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea
			, EnglishLearnerStatus
			, EnglishLearner_StatusStartDate
			, EnglishLearner_StatusEndDate
			, SchoolYear
		INTO #tempELStatus
		FROM Staging.PersonStatus
		WHERE SchoolYear = @SchoolYear

	-- Create Index for #tempELStatus 
		CREATE INDEX IX_tempELStatus 
			ON #tempELStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, Englishlearner_StatusStartDate, EnglishLearner_StatusEndDate)

	--Pull the Migrant Status into a temp table
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea
			, MigrantStatus
			, Migrant_StatusStartDate
			, Migrant_StatusEndDate
			, SchoolYear
		INTO #tempMigrantStatus
		FROM Staging.PersonStatus
		WHERE SchoolYear = @SchoolYear

	-- Create Index for #tempMigrantStatus 
		CREATE INDEX IX_tempMigrantStatus 
			ON #tempMigrantStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, Migrant_StatusStartDate, Migrant_StatusEndDate)

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'homeless'	--FactTypeId = 16

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
			, SeaId									int null
			, IeuId									int null
			, LeaId									int null
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
			, EnrollmentEntryDateId					int null
			, EnrollmentExitDateId					int null
		)

		INSERT INTO #Facts
		SELECT DISTINCT
			ske.id											StagingId								
			, rsy.DimSchoolYearId							SchoolYearId							
			, @FactTypeId									FactTypeId							
			, ISNULL(rgls.DimGradeLevelId, -1)				GradeLevelId							
			, rda.DimAgeId									AgeId									
			, ISNULL(rdr.DimRaceId, -1)						RaceId								
			, ISNULL(rdkd.DimK12DemographicId, -1)			K12DemographicId						
			, 1												StudentCount							
			, ISNULL(rds.DimSeaId, -1)						SeaId									
			, -1											IeuId									
			, ISNULL(rdl.DimLeaID, -1)						LeaId									
			, ISNULL(rdksch.DimK12SchoolId, -1)				K12SchoolId							
			, ISNULL(rdp.DimPersonId, -1)					K12StudentId							
			, ISNULL(rdis.DimIdeaStatusId, -1)				IdeaStatusId
			, -1											DisabilityStatusId							
			, -1											LanguageId							
			, ISNULL(rdms.DimMigrantStatusId, -1)			MigrantStatusId						
			, -1											TitleIStatusId						
			, -1											TitleIIIStatusId						
			, -1											AttendanceId							
			, -1 											CohortStatusId						
			, -1											NOrDStatusId							
			, -1											CteStatusId							
			, -1											K12EnrollmentStatusId					
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)	EnglishLearnerStatusId				
			, ISNULL(rdhs.DimHomelessnessStatusId, -1)		HomelessnessStatusId					
			, -1											EconomicallyDisadvantagedStatusId		
			, -1											FosterCareStatusId					
			, -1											ImmigrantStatusId						
			, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)		PrimaryDisabilityTypeId
			, -1											SpecialEducationServicesExitDateId	
			, -1											MigrantStudentQualifyingArrivalDateId	
			, -1											LastQualifyingMoveDateId						
			, ISNULL(enrollEntry.DimDateId, -1)				EnrollmentEntryDateId
			, ISNULL(enrollExit.DimDateId, -1)				EnrollmentExitDateId

		FROM Staging.K12Enrollment ske
		JOIN RDS.DimDates enrollEntry
			ON ske.EnrollmentEntryDate = enrollEntry.DateValue
		JOIN RDS.DimDates enrollExit
			ON ske.EnrollmentEntryDate = enrollExit.DateValue
	--homeless
		JOIN Staging.PersonStatus hmStatus
			ON ske.SchoolYear = hmStatus.SchoolYear
			AND ske.StudentIdentifierState = hmStatus.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(hmStatus.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(hmStatus.SchoolIdentifierSea, '')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
		JOIN RDS.DimSeas rds
			ON hmStatus.Homelessness_StatusStartDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, @SYEndDate)
	--age
		JOIN RDS.DimAges rda
			ON RDS.Get_Age(ske.Birthdate, @SYStartDate) = rda.AgeValue
	--demographics			
		JOIN RDS.vwDimK12Demographics rdkd
 			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		JOIN #dimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND (rdl.RecordStartDateTime BETWEEN hmStatus.Homelessness_StatusStartDate AND ISNULL(hmStatus.Homelessness_StatusEndDate, @SYEndDate)
				OR hmStatus.Homelessness_StatusStartDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, @SYEndDate))
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND (rdksch.RecordStartDateTime BETWEEN hmStatus.Homelessness_StatusStartDate AND ISNULL(hmStatus.Homelessness_StatusEndDate, @SYEndDate)
				OR hmStatus.Homelessness_StatusStartDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, @SYEndDate))
	--homeless nighttime residence
		LEFT JOIN Staging.PersonStatus hmNight
			ON ske.SchoolYear = hmNight.SchoolYear
			AND ske.StudentIdentifierState = hmNight.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(hmNight.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(hmNight.SchoolIdentifierSea, '')
			AND hmNight.HomelessNightTimeResidence_StartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
	--disability status
		LEFT JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON ske.SchoolYear = sppse.SchoolYear
			AND ske.StudentIdentifierState = sppse.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN sppse.ProgramParticipationBeginDate AND ISNULL(sppse.ProgramParticipationEndDate, @SYEndDate)
			AND sppse.IDEAIndicator = 1
	--idea disability type			
		LEFT JOIN Staging.IdeaDisabilityType sidt	
			ON ske.SchoolYear = sidt.SchoolYear
			AND sidt.StudentIdentifierState = sppse.StudentIdentifierState
			AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
			AND sidt.IsPrimaryDisability = 1
			AND hmStatus.Homelessness_StatusStartDate BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, @SYEndDate)
	--english learner
		LEFT JOIN #tempELStatus el 
			ON hmStatus.SchoolYear = el.SchoolYear
			AND hmStatus.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(hmStatus.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(hmStatus.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, @SYEndDate)
	--migratory status	
		LEFT JOIN #tempMigrantStatus migrant
			ON hmStatus.SchoolYear = migrant.SchoolYear
			AND hmStatus.StudentIdentifierState = migrant.StudentIdentifierState
			AND ISNULL(hmStatus.LeaIdentifierSeaAccountability, '') = ISNULL(migrant.LeaIdentifierSeaAccountability, '')
			AND ISNULL(hmStatus.SchoolIdentifierSea, '') = ISNULL(migrant.SchoolIdentifierSea, '')
			AND hmStatus.Homelessness_StatusStartDate BETWEEN migrant.Migrant_StatusStartDate AND ISNULL(migrant.Migrant_StatusEndDate, @SYEndDate)
	--race	
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr 
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LEAIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
	--homelessness (RDS)
		LEFT JOIN RDS.vwDimHomelessnessStatuses rdhs
			ON ISNULL(CAST(hmStatus.HomelessnessStatus AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessnessStatusMap AS SMALLINT), -1)
			AND ISNULL(hmNight.HomelessNightTimeResidence, 'MISSING') = ISNULL(rdhs.HomelessPrimaryNighttimeResidenceMap, rdhs.HomelessPrimaryNighttimeResidenceCode)
			AND ISNULL(CAST(hmStatus.HomelessUnaccompaniedYouth AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessUnaccompaniedYouthStatusMap AS SMALLINT), -1)
			AND ISNULL(CAST(hmStatus.HomelessServicedIndicator AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessServicedIndicatorMap AS SMALLINT), -1)
	--migrant (RDS)
		LEFT JOIN #vwMigrantStatuses rdms
			ON ISNULL(CAST(migrant.MigrantStatus AS SMALLINT), -1) = ISNULL(CAST(rdms.MigrantStatusMap AS SMALLINT), -1)
			AND rdms.MigrantEducationProgramEnrollmentTypeCode = 'MISSING' 
			AND rdms.ContinuationOfServicesReasonCode = 'MISSING'
			AND rdms.MEPContinuationOfServicesStatusCode = 'MISSING'
			AND rdms.ConsolidatedMEPFundsStatusCode = 'MISSING'
			AND rdms.MigrantEducationProgramServicesTypeCode = 'MISSING'
			AND rdms.MigrantPrioritizedForServicesCode = 'MISSING'
	--english learner (RDS)
		LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--idea status (rds)	
		LEFT JOIN #vwIdeaStatuses rdis
			ON ISNULL(CAST(sppse.IDEAIndicator AS SMALLINT), -1) = ISNULL(CAST(rdis.IdeaIndicatorMap AS SMALLINT), -1)
			AND rdis.SpecialEducationExitReasonCode = 'MISSING'
			AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
			AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
	--idea disability type (rds)
		LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
			ON sidt.SchoolYear = rdidt.SchoolYear
			AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidt.IdeaDisabilityTypeMap, rdidt.IdeaDisabilityTypeCode)
			AND sidt.IsPrimaryDisability = 1
	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
	--race (RDS)	
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					WHEN ske.HispanicLatinoEthnicity = 1 THEN 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
		WHERE hmStatus.HomelessnessStatus = 1 
		AND hmStatus.Homelessness_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)


	--Final insert into RDS.FactK12StudentCounts table
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
			, [DisabilityStatusId]
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
			, [EnrollmentEntryDateId]
			, [EnrollmentExitDateId]
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
			, [DisabilityStatusId]
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
			, [EnrollmentEntryDateId]
			, [EnrollmentExitDateId]
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


