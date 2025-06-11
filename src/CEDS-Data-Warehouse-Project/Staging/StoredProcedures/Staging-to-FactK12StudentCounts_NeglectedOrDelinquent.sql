
/**********************************************************************
Author: AEM Corp
Date:	2/20/2023
Description: Migrates Neglected Or Delinquent Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 
FS119 
	1. Neglected programs participation table - state agency	869	The number of students participating in NEGLECTED programs 
		under Title I, Part D, Subpart 1 (State Agency) of ESEA as amended.
	2. Delinquent programs participation table - state agency	870	The number of students participating in DELINQUENT programs 
		under Title I, Part D, Subpart 1 (State Agency) of ESEA as amended.

FS127
	1. Delinquent programs participation table - LEA	872	The number of students participating in programs for DELINQUENT students 
		under Title I, Part D, Subpart 2 (LEA) of ESEA, as amended.
	2. At-Risk programs participation table - LEA	873	The number of students participating in programs for AT-RISK students 
		under Title I, Part D, Subpart 2 (LEA) of ESEA, as amended.

FS180 - Retired?

FS181 - Retired?

FS218
	1. The number of students participating in NEGLECTED AND DELINQUENT programs under Title I, Part D, Subpart 1 (State Agency) of ESEA, as amended, 
		who attained academic and career and technical outcomes while enrolled in the programs.

FS219
	1. The number of students participating in AT-RISK AND DELINQUENT programs under Title I, Part D, Subpart 2 (LEA) of ESEA, as amended, 
		who attained academic and career and technical outcomes while enrolled in the programs.
FS220
	1. The number of students participating in NEGLECTED AND DELINQUENT programs under Title I, Part D, Subpart 1 (State Agency) of ESEA, as amended, 
		who attained academic and career and technical outcomes up to 90 calendar days after exiting the program.

FS221
	1. The number of students participating in AT-RISK AND DELINQUENT programs under Title I, Part D, Subpart 2 (LEA) of ESEA, as amended, 
		who attained academic and career and technical outcomes up to 90 calendar days after exiting the program.

************************************************************************/

CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_NeglectedOrDelinquent]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#vwNorDStatuses') IS NOT NULL DROP TABLE #vwNorDStatuses

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
		select K12StudentStudentIdentifierState
			, max(DimPersonId)								DimPersonId
			, min(RecordStartDateTime)						RecordStartDateTime
			, max(isnull(RecordEndDateTime, @SYEndDate))	RecordEndDateTime
			, max(isnull(Birthdate, '1900-01-01'))			Birthdate
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
		INTO #vwNorDStatuses
		FROM RDS.vwDimNOrDStatuses
		WHERE SchoolYear = @SchoolYear
			--AND NeglectedOrDelinquentLongTermStatusCode = 'MISSING'
			--AND NeglectedOrDelinquentProgramTypeCode = 'MISSING'
			--AND NeglectedProgramTypeCode = 'MISSING'
			--AND DelinquentProgramTypeCode = 'MISSING'
			--AND NeglectedOrDelinquentAcademicAchievementIndicatorCode = 'MISSING'
			--AND NeglectedOrDelinquentAcademicOutcomeIndicatorCode = 'MISSING'

		CREATE CLUSTERED INDEX ix_tempvwNorDStatuses 
			ON #vwNorDStatuses (
				NeglectedOrDelinquentLongTermStatusCode,
				NeglectedProgramTypeCode,
				DelinquentProgramTypeCode,
				NeglectedOrDelinquentProgramTypeCode,
				NeglectedOrDelinquentAcademicAchievementIndicatorMap,
				NeglectedOrDelinquentAcademicOutcomeIndicatorMap,
				EdFactsAcademicOrCareerAndTechnicalOutcomeTypeMap,
				EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeMap
			);

		--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM RDS.DimFactTypes
		WHERE FactTypeCode = 'neglectedordelinquent'	--DimFactTypeId = 15

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
			, SeaId										int null
			, IeuId										int null
			, LeaId										int null
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
			, CteStatusId								int null
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
			, StatusStartDateNeglectedOrDelinquentId	int null
			, StatusEndDateNeglectedOrDelinquentId		int null
		)

		INSERT INTO #Facts
		SELECT DISTINCT
			ske.Id														StagingId								
			, rsy.DimSchoolYearId										SchoolYearId							
			, @FactTypeId												FactTypeId							
			, ISNULL(rgls.DimGradeLevelId, -1)							GradeLevelId							
			, -1 														AgeId									
			, ISNULL(rdr.DimRaceId, -1)									RaceId								
			, -1														K12DemographicId						
			, 1															StudentCount							
			, ISNULL(RDS.DimSeaId, -1)									SeaId									
			, -1														IeuId									
			, ISNULL(rdl.DimLeaId, -1)									LeaId									
			, ISNULL(rdksch.DimK12SchoolId, -1)							K12SchoolId							
			, ISNULL(rdp.DimPersonId, -1)								K12StudentId							
			, ISNULL(rdis.DimIdeaStatusId, -1)							IdeaStatusId							
			, -1														DisabilityStatusId							
			, -1														LanguageId							
			, -1								 						MigrantStatusId						
			, -1														TitleIStatusId						
			, -1														TitleIIIStatusId						
			, -1														AttendanceId							
			, -1 														CohortStatusId						
			, ISNULL(rdnds.DimNOrDStatusId, -1)							NOrDStatusId							
			, -1														CteStatusId							
			, -1														K12EnrollmentStatusId					
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)				EnglishLearnerStatusId				
			, -1														HomelessnessStatusId					
			, -1														EconomicallyDisadvantagedStatusId		
			, -1														FosterCareStatusId					
			, -1														ImmigrantStatusId						
			, -1														PrimaryDisabilityTypeId				
			, -1														SpecialEducationServicesExitDateId	
			, -1														MigrantStudentQualifyingArrivalDateId	
			, -1														LastQualifyingMoveDateId	
			, ISNULL(BeginDate.DimDateId, -1)							StatusStartDateNeglectedOrDelinquentId
			, ISNULL(EndDate.DimDateId, -1)								StatusEndDateNeglectedOrDelinquentId
		FROM Staging.K12Enrollment ske
		JOIN Staging.K12Organization sko
			on isnull(ske.LeaIdentifierSeaAccountability,'') = isnull(sko.LeaIdentifierSea,'')
			and isnull(ske.SchoolIdentifierSea,'') = isnull(sko.SchoolIdentifierSea,'')
			and Lea_IsReportedFederally = 1
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
			and ske.SchoolYear = @SchoolYear
		JOIN RDS.DimSeas rds
			ON ske.EnrollmentEntryDate BETWEEN RDS.RecordStartDateTime AND ISNULL(RDS.RecordEndDateTime, @SYEndDate)
		JOIN #dimPeople rdp
			ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.Birthdate, '1/1/1900')
			AND ske.EnrollmentEntryDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, @SYEndDate)
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND ske.EnrollmentEntryDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, @SYEndDate)
	--negelected or delinquent
		LEFT JOIN Staging.ProgramParticipationNorD sppnord
			ON ske.SchoolYear = sppnord.SchoolYear		
			AND ske.StudentIdentifierState = sppnord.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(sppnord.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppnord.SchoolIdentifierSea, '')
			AND sppnord.ProgramParticipationBeginDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
	--idea disability status
		LEFT JOIN Staging.ProgramParticipationSpecialEducation idea
			ON ske.SchoolYear = idea.SchoolYear		
			AND ske.StudentIdentifierState = idea.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(idea.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(idea.SchoolIdentifierSea, '')
			AND sppnord.ProgramParticipationBeginDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
	--english learner
		LEFT JOIN Staging.PersonStatus el 
			ON ske.SchoolYear = el.SchoolYear		
			AND ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND el.EnglishLearner_StatusStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @SYEndDate)
	--race	
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr 
			ON spr.SchoolYear = @SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LeaIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
	--neglected or delinquent (RDS)
		LEFT JOIN #vwNorDStatuses rdnds
			ON rdnds.SchoolYear = @SchoolYear

			/* THESE WILL BE NEEDED FOR FS119 and FS127 but for now we are defaulting to 'MISSING' for FS218, FS219, FS220, FS221
				*** Uncomment below lines for FS 119 & comment other JOINS
			--AND ISNULL(sppnord.NeglectedProgramType, 'MISSING') = ISNULL(rdnds.NeglectedProgramTypeMap, rdnds.NeglectedProgramTypeCode)
			--AND ISNULL(sppnord.DelinquentProgramType, 'MISSING') = ISNULL(rdnds.DelinquentProgramTypeMap, rdnds.DelinquentProgramTypeCode)
			*/
			
			/*
			--AND ISNULL(sppnord.NeglectedOrDelinquentProgramType, 'MISSING') = ISNULL(rdnds.NeglectedOrDelinquentProgramTypeMap, rdnds.NeglectedOrDelinquentProgramTypeCode)
			*/

			AND ISNULL(sppnord.EdFactsAcademicOrCareerAndTechnicalOutcomeType, 'MISSING') = ISNULL(rdnds.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeMap, rdnds.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode)
			AND ISNULL(sppnord.EdFactsAcademicOrCareerAndTechnicalOutcomeExitType, 'MISSING') = ISNULL(rdnds.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeMap, rdnds.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode)
	
			AND rdnds.NeglectedOrDelinquentProgramEnrollmentSubpartMap = sppnord.NeglectedOrDelinquentProgramEnrollmentSubpart
			AND rdnds.NeglectedOrDelinquentStatusMap = sppnord.NeglectedOrDelinquentStatus
	--idea disability (RDS)
		LEFT JOIN RDS.vwDimIdeaStatuses rdis
			ON rdis.SchoolYear = @SchoolYear
			AND ISNULL(CAST(idea.IdeaIndicator AS SMALLINT), -1) = ISNULL(rdis.IdeaIndicatorMap, -1)
			AND rdis.IdeaEducationalEnvironmentForSchoolAgeCode = 'MISSING'
			AND rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode = 'MISSING'
			AND rdis.SpecialEducationExitReasonCode = 'MISSING'
	--english learner (RDS)
		LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rdels.SchoolYear = @SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--grade (RDS)
		LEFT JOIN #vwGradeLevels rgls
			ON ske.GradeLevel = rgls.GradeLevelMap
			AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
	--race (RDS)	
		LEFT JOIN #vwRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
	-- ProgramParticipationEndDate
		LEFT JOIN RDS.DimDates BeginDate 
			ON sppnord.ProgramParticipationEndDate = BeginDate.DateValue
	-- ProgramParticipationEndDate
		LEFT JOIN RDS.DimDates EndDate 
			ON sppnord.ProgramParticipationEndDate = EndDate.DateValue
	--Lea Operational Status	
		LEFT JOIN Staging.SourceSystemReferenceData sssrd
			ON sko.SchoolYear = sssrd.SchoolYear
			AND sko.Lea_OperationalStatus = sssrd.InputCode
			AND sssrd.TableName = 'RefOperationalStatus'
			AND sssrd.TableFilter = '000174'
		WHERE sppnord.NeglectedOrDelinquentProgramEnrollmentSubpart is not NULL
			AND sppnord.NeglectedOrDelinquentStatus = 1 -- Only get NorD students
			AND sssrd.OutputCode not in ('Closed', 'FutureAgency', 'Inactive', 'MISSING')

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
			, StatusStartDateNeglectedOrDelinquentId
			, StatusEndDateNeglectedOrDelinquentId
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
			, StatusStartDateNeglectedOrDelinquentId
			, StatusEndDateNeglectedOrDelinquentId
		FROM #Facts

		ALTER INDEX ALL ON RDS.FactK12StudentCounts REBUILD

	END TRY
	BEGIN CATCH
		INSERT INTO app.DataMigrationHistories
			(DataMigrationHistoryDate, DataMigrationTypeId, DataMigrationHistoryMessage) 
			values	(getutcdate(), 2, 'ERROR: ' + ERROR_MESSAGE())
	END CATCH

END
GO


