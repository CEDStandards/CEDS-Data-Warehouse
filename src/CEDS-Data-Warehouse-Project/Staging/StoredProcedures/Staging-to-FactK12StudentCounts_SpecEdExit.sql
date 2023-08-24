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
	IF OBJECT_ID(N'tempdb..#Facts') IS NOT NULL DROP TABLE #Facts
	IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
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
			, K12StudentStatusId					int null
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

			, -1														IdeaStatusId
			, -1														LanguageId
			, -1														MigrantStatusId
			, -1														K12StudentStatusId
			, -1														TitleIStatusId
			, -1														TitleIIIStatusId
			, -1														AttendanceId
			, -1														CohortStatusId
			, -1														NOrDStatusId
			, -1														CTEStatusId
			, -1														K12EnrollmentStatusId
			, -1 														EnglishLearnerStatusId
			, -1														HomelessnessStatusId
			, -1														EconomicallyDisadvantagedStatusId
			, -1														FosterCareStatusId
			, -1														ImmigrantStatusId
			, -1														PrimaryDisabilityTypeId
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
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND (ske.SchoolIdentifierSea = spr.SchoolIdentifierSea
				OR ske.LEAIdentifierSeaAccountability = spr.LeaIdentifierSeaAccountability)
		JOIN RDS.vwDimK12Demographics rdkd
 			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		JOIN RDS.DimAges rda
			ON RDS.Get_Age(ske.Birthdate, IIF(rdd.DateValue < @ChildCountDate, @PreviousChildCountDate, @ChildCountDate)) = rda.AgeValue
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

	--Get a unique set of Lea IDs to match against for Title I and Migrant update
		IF OBJECT_ID('tempdb..#uniqueLEAs') IS NOT NULL 
			DROP TABLE #uniqueLEAs		

		CREATE TABLE #uniqueLEAs (
			  LeaIdentifierSea					VARCHAR(50)
			, LEA_RecordStartDateTime			DATETIME
			, LEA_RecordEndDateTime				DATETIME
			, LEA_TitleIProgramType				VARCHAR(50)
			, LEA_TitleIinstructionalService	VARCHAR(50)
			, LEA_K12LeaTitleISupportService	VARCHAR(50)
		)

		INSERT INTO #uniqueLEAs
		SELECT DISTINCT LeaIdentifierSea, LEA_RecordStartDateTime, LEA_RecordEndDateTime, LEA_TitleIProgramType, LEA_TitleIinstructionalService, LEA_K12LeaTitleISupportService
		FROM Staging.K12Organization
		WHERE LEA_IsReportedFederally = 1
		
	--Update the #Facts table with IDEA data
		UPDATE #Facts
		SET   IdeaStatusId = ISNULL(rdis.DimIdeaStatusId, -1)
			, PrimaryDisabilityTypeId = ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)
		FROM #Facts fact
		JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON fact.StagingId = sppse.Id
		JOIN Staging.IdeaDisabilityType sidt	
			ON sidt.StudentIdentifierState = sppse.StudentIdentifierState
			AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
			AND sidt.IsPrimaryDisability = 1
			AND sppse.ProgramParticipationEndDate BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, GETDATE())
		JOIN RDS.vwDimIdeaStatuses rdis
			ON  ISNULL(sppse.SpecialEducationExitReason, 'MISSING') = ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode)
			AND IdeaIndicatorCode = 'Yes'
			AND rdis.IdeaEducationalEnvironmentForSchoolAgeCode = 'MISSING'
		JOIN RDS.vwDimIdeaDisabilityTypes rdidt
			ON sidt.SchoolYear = rdidt.SchoolYear
			AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidt.IdeaDisabilityTypeMap, rdidt.IdeaDisabilityTypeCode)
			AND sidt.IsPrimaryDisability = 1

	--Update the #Facts table with EL data
		UPDATE #Facts
		SET	EnglishLearnerStatusId								= ISNULL(rdels.DimEnglishLearnerStatusId, -1) 				
		FROM #Facts fact
		JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON fact.StagingId = sppse.Id
		JOIN Staging.PersonStatus el 
			ON sppse.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(sppse.LeaIdentifierSeaAccountability, '') = ISNULL(el.LeaIdentifierSeaAccountability, '')
			AND ISNULL(sppse.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND sppse.ProgramParticipationEndDate BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, GETDATE())
		JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'

		
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