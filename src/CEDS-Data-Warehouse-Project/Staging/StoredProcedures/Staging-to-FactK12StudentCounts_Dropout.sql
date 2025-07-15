/**********************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Dropout Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 032

11/1/2023: Updated to properly set DimK12EnrollmentStatusId and improve performance
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
		@SYEndDate DATE,
		@DimK12EnrollmentStatusId int,
		@ExitOrWithdrawalTypeMap varchar(10)
		
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SET @SYStartDate = Staging.GetFiscalYearStartDate(@SchoolYear)
		SET @SYEndDate = Staging.GetFiscalYearEndDate(@SchoolYear)

		SELECT @DimK12EnrollmentStatusId = (
			SELECT TOP 1 DimK12EnrollmentStatusId
			FROM RDS.vwDimK12EnrollmentStatuses
			WHERE ExitOrWithdrawalTypeCode = '01927'
				AND EnrollmentStatusCode = 'MISSING'
				AND EntryTypeCode = 'MISSING'
				AND PostSecondaryEnrollmentStatusCode = 'MISSING'
				AND EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode = 'MISSING'
				AND EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode = 'MISSING'
				AND SchoolYear = @SchoolYear
				)

		SELECT @ExitOrWithdrawalTypeMap = (
			SELECT TOP 1 ExitOrWithdrawalTypeMap
			FROM RDS.vwDimK12EnrollmentStatuses
			WHERE ExitOrWithdrawalTypeCode = '01927'
				AND EnrollmentStatusCode = 'MISSING'
				AND EntryTypeCode = 'MISSING'
				AND PostSecondaryEnrollmentStatusCode = 'MISSING'
				AND EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode = 'MISSING'
				AND EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode = 'MISSING'
				AND SchoolYear = @SchoolYear
				)

	--Get the set of students from DimPeople to be used for the migrated SY
		SELECT K12StudentStudentIdentifierState
			, MAX(DimPersonId)								DimPersonId
			, MIN(RecordStartDateTime)						RecordStartDateTime
			, MAX(ISNULL(RecordEndDateTime, @SYEndDate))	RecordEndDateTime
			, MAX(ISNULL(Birthdate, '1900-01-01'))			Birthdate
		INTO #dimPeople
		FROM RDS.DimPeople
		WHERE ((RecordStartDateTime <= @SYStartDate AND RecordEndDateTime > @SYStartDate)
			OR (RecordStartDateTime > @SYStartDate AND ISNULL(RecordEndDateTime, @SYEndDate) <= @SYEndDate))
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
			AND GradeLevelTypeDescription = 'Exit Grade Level'

		CREATE CLUSTERED INDEX ix_tempvwGradeLevels 
			ON #vwGradeLevels (GradeLevelMap);

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
			AND HomelessPrimaryNighttimeResidenceCode =  'MISSING'
			AND HomelessUnaccompaniedYouthStatusCode = 'MISSING'
			AND HomelessServicedIndicatorCode = 'MISSING'

		SELECT *
		INTO #vwEconomicallyDisadvantagedStatuses
		FROM RDS.vwDimEconomicallyDisadvantagedStatuses
		WHERE SchoolYear = @SchoolYear
			AND EligibilityStatusForSchoolFoodServiceProgramsCode = 'MISSING'
			AND NationalSchoolLunchProgramDirectCertificationIndicatorCode = 'MISSING'

		CREATE CLUSTERED INDEX ix_tempvwEconomicallyDisadvantagedStatuses
			ON #vwEconomicallyDisadvantagedStatuses (EconomicDisadvantageStatusMap) --, EligibilityStatusForSchoolFoodServiceProgramsMap, NationalSchoolLunchProgramDirectCertificationIndicatorMap);

		SELECT *
		INTO #vwMigrantStatuses
		FROM RDS.vwDimMigrantStatuses
		WHERE SchoolYear = @SchoolYear
			AND MigrantEducationProgramEnrollmentTypeCode = 'MISSING' 
			AND ContinuationOfServicesReasonCode = 'MISSING'
			AND MigrantEducationProgramServicesTypeCode = 'MISSING'
			AND MigrantPrioritizedForServicesCode = 'MISSING'
			AND MEPContinuationOfServicesStatusCode = 'MISSING'
			and ConsolidatedMEPFundsStatusCode = 'MISSING'

		CREATE CLUSTERED INDEX ix_tempvwMigrantStatuses
			ON #vwMigrantStatuses (MigrantStatusMap) --, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode, MEPContinuationOfServicesStatusCode, ConsolidatedMepFundsStatusCode);

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM RDS.DimFactTypes
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
		)

		INSERT INTO #Facts
		SELECT 
		DISTINCT
			ske.id														StagingId								
			, rsy.DimSchoolYearId										SchoolYearId							
			, @FactTypeId												FactTypeId							
			, ISNULL(rgls.DimGradeLevelId, -1)							GradeLevelId							
			, -1 														AgeId									
			, ISNULL(rdr.DimRaceId, -1)									RaceId								
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId						
			, 1															StudentCount							
			, ISNULL(rds.DimSeaId, -1)									SeaId									
			, -1														IeuId									
			, ISNULL(rdl.DimLeaID, -1)									LeaId									
			, ISNULL(rdksch.DimK12SchoolId, -1)							K12SchoolId							
			, ISNULL(rdp.DimPersonId, -1)								K12StudentId							
			, ISNULL(rdis.DimIdeaStatusId, -1)							IdeaStatusId							
			, ISNULL(rdds.DimDisabilityStatusId, -1)						DisabilityStatusId							
			, -1														LanguageId							
			, ISNULL(rdms.DimMigrantStatusId, -1) 						MigrantStatusId						
			, -1														TitleIStatusId						
			, -1														TitleIIIStatusId						
			, -1														AttendanceId							
			, -1 														CohortStatusId						
			, -1														NOrDStatusId							
			, -1														CteStatusId							
			, @DimK12EnrollmentStatusId									K12EnrollmentStatusId					
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
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.Birthdate, '1/1/1900')
			AND ske.EnrollmentEntryDate BETWEEN convert(date, rdp.RecordStartDateTime) AND convert(date, ISNULL(rdp.RecordEndDateTime, @SYEndDate))
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, @SYEndDate)
	--homeless
		LEFT JOIN Staging.PersonStatus hmStatus
			ON ske.SchoolYear = hmStatus.SchoolYear		
			AND ske.StudentIdentifierState = hmStatus.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(hmStatus.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(hmStatus.SchoolIdentifierSea, '')
			AND
				(
					(
						ISNULL(hmStatus.Homelessness_StatusStartDate, @SYEndDate) <= ske.EnrollmentEntryDate 
						AND 
						ISNULL(hmStatus.Homelessness_StatusEndDate, @SYEndDate) >= ske.EnrollmentEntryDate
					) 
					OR 
					hmStatus.Homelessness_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) 
				)
	--idea disability status
		LEFT JOIN Staging.ProgramParticipationSpecialEducation idea
			ON ske.SchoolYear = idea.SchoolYear		
			AND ske.StudentIdentifierState = idea.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(idea.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(idea.SchoolIdentifierSea, '')
			AND
				(
					(
						ISNULL(idea.ProgramParticipationBeginDate, @SYEndDate) <= ske.EnrollmentEntryDate 
						AND 
						ISNULL(idea.ProgramParticipationEndDate, @SYEndDate) >= ske.EnrollmentEntryDate
					) 
					OR 
					idea.ProgramParticipationBeginDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) 
				)
	--504 disability status
		LEFT JOIN Staging.Disability disab
			ON ske.SchoolYear = disab.SchoolYear		
			AND ske.StudentIdentifierState = disab.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(disab.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(disab.SchoolIdentifierSea, '')
			AND
				(
					(
						ISNULL(disab.Disability_StatusStartDate, @SYEndDate) <= ske.EnrollmentEntryDate 
						AND 
						ISNULL(disab.Disability_StatusEndDate, @SYEndDate) >= ske.EnrollmentEntryDate
					) 
					OR 
					disab.Disability_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) 
				)
	--economic disadvantage
		LEFT JOIN Staging.PersonStatus ecoDis
			ON ske.SchoolYear = ecoDis.SchoolYear		
			AND ske.StudentIdentifierState = ecoDis.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(ecoDis.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(ecoDis.SchoolIdentifierSea, '')
			AND
				(
					(
						ISNULL(ecoDis.EconomicDisadvantage_StatusStartDate, @SYEndDate) <= ske.EnrollmentEntryDate 
						AND 
						ISNULL(ecoDis.EconomicDisadvantage_StatusEndDate, @SYEndDate) >= ske.EnrollmentEntryDate
					) 
					OR 
					ecoDis.EconomicDisadvantage_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) 
				)
	--english learner
		LEFT JOIN Staging.PersonStatus el 
			ON ske.SchoolYear = el.SchoolYear		
			AND ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND
				(
					(
						ISNULL(el.EnglishLearner_StatusStartDate, @SYEndDate) <= ske.EnrollmentEntryDate 
						AND 
						ISNULL(el.EnglishLearner_StatusEndDate, @SYEndDate) >= ske.EnrollmentEntryDate
					) 
					OR 
					el.EnglishLearner_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) 
				)
	--migratory status	
		LEFT JOIN Staging.PersonStatus migrant
			ON ske.SchoolYear = migrant.SchoolYear		
			AND ske.StudentIdentifierState = migrant.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(migrant.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(migrant.SchoolIdentifierSea, '')
			AND
				(
					(
						ISNULL(migrant.Migrant_StatusStartDate, @SYEndDate) <= ske.EnrollmentEntryDate 
						AND 
						ISNULL(migrant.Migrant_StatusEndDate, @SYEndDate) >= ske.EnrollmentEntryDate
					) 
					OR 
					migrant.Migrant_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate) 
				)
	--race	
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr 
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
				AND ISNULL(ske.LeaIdentifierSeaAccountability,'') = ISNULL(spr.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(spr.SchoolIdentifierSea,'')
	--homelessness (RDS)
		LEFT JOIN #vwHomelessnessStatuses rdhs
			ON ISNULL(CAST(hmStatus.HomelessnessStatus AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessnessStatusMap AS SMALLINT), -1)
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
	--english learner (RDS)
		LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--migrant (RDS)
		LEFT JOIN #vwMigrantStatuses rdms
			ON ISNULL(CAST(migrant.MigrantStatus AS SMALLINT), -1) = ISNULL(CAST(rdms.MigrantStatusMap AS SMALLINT), -1)
	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
	--race (RDS)	
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END

		WHERE ske.ExitOrWithdrawalType = @ExitOrWithdrawalTypeMap

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


