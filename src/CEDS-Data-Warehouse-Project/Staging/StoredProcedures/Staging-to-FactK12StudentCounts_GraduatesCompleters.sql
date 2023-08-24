/**********************************************************************
Author: AEM Corp
Date:	1/6/2022
Description: Migrates Graduate/Completer Data from Staging to RDS.FactK12StudentCounts

NOTE: This Stored Procedure processes files: 040
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentCounts_GraduatesCompleters]
	@SchoolYear SMALLINT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwK12AcademicAwardStatuses') IS NOT NULL DROP TABLE #vwK12AcademicAwardStatuses
		IF OBJECT_ID(N'tempdb..#vwK12Demographics') IS NOT NULL DROP TABLE #vwK12Demographics
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwIdeaStatuses') IS NOT NULL DROP TABLE #vwIdeaStatuses

	--Set the standard variables used throughout
		DECLARE 
		@FactTypeId int,
		@SchoolYearId int,
		@ReportingStartDate date,
		@ReportingEndDate date

		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		--Set the reporting period as 10-01 to 09-30
		SELECT @ReportingStartDate = CAST(CAST(@SchoolYear - 1 AS CHAR(4)) + '-10-01'AS DATE)
		SELECT @ReportingEndDate = CAST(CAST(@SchoolYear AS CHAR(4)) + '-09-30'AS DATE)

	--Create the temp views (and any relevant indexes) needed for this domain
		SELECT *
		INTO #vwK12AcademicAwardStatuses
		FROM RDS.vwDimK12StudentStatuses
		WHERE SchoolYear = @SchoolYear
		CREATE CLUSTERED INDEX ix_tempvwK12AcademicAwardStatuses 
			ON #vwK12AcademicAwardStatuses (HighSchoolDiplomaTypeCode, NSLPDirectCertificationIndicatorCode);

		SELECT *
		INTO #vwK12Demographics
		FROM RDS.vwDimK12Demographics
		WHERE SchoolYear = @SchoolYear
		CREATE CLUSTERED INDEX ix_tempvwK12Demographics 
			ON #vwK12Demographics (EnglishLearnerStatusMap, EconomicDisadvantageStatusCode, HomelessnessStatusCode, HomelessPrimaryNighttimeResidenceCode, HomelessUnaccompaniedYouthStatusCode, MigrantStatusCode, MilitaryConnectedStudentIndicatorCode);

		SELECT *
		INTO #vwIdeaStatuses
		FROM RDS.vwDimIdeaStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwIdeaStatuses ON #vwIdeaStatuses (IdeaIndicatorMap, PrimaryDisabilityTypeMap, IdeaEducationalEnvironmentMap);

		SELECT *
		INTO #vwRaces
		FROM RDS.vwDimRaces
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwRaces ON #vwRaces (RaceMap);

	--Set the correct Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'Grad'  --FactTypeId = 8

		DELETE RDS.FactK12StudentCounts
		WHERE SchoolYearId = @SchoolYearId 
			AND FactTypeId = @FactTypeId

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
			, LanguageId								int null
			, MigrantStatusId							int null
			, K12AcademicAwardStatusId					int null
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
			ske.id														StagingId								
			, rsy.DimSchoolYearId										SchoolYearId							
			, @FactTypeId												FactTypeId							
			, -1														GradeLevelId							
			, -1														AgeId									
			, ISNULL(rdr.DimRaceId, -1)									RaceId								
			, ISNULL(rdkd.DimK12DemographicId, -1)						K12DemographicId						
			, 1															StudentCount							
			, ISNULL(rds.DimSeaId, -1)									SEAId									
			, -1														IEUId									
			, ISNULL(rdl.DimLeaID, -1)									LEAId									
			, ISNULL(rdksch.DimK12SchoolId, -1)							K12SchoolId							
			, ISNULL(rdp.DimPeopleId, -1)								K12StudentId							
			, ISNULL(rdis.DimIdeaStatusId, -1)							IdeaStatusId							
			, -1														LanguageId							
			, ISNULL(rdhs.DimMigrantStatusId, -1)						MigrantStatusId						
			, ISNULL(rdkaas.DimK12AcademicAwardStatusId, -1)				K12AcademicAwardStatusId					
			, -1														TitleIStatusId						
			, -1														TitleIIIStatusId						
			, -1														AttendanceId							
			, -1														CohortStatusId						
			, -1														NOrDStatusId							
			, -1														CTEStatusId							
			, -1														K12EnrollmentStatusId					
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)				EnglishLearnerStatusId				
			, ISNULL(rdhs.DimHomelessnessStatusId, -1)					HomelessnessStatusId					
			, ISNULL(rdeds.DimEconomicallyDisadvantagedStatusId, -1)	EconomicallyDisadvantagedStatusId		
			, -1														FosterCareStatusId					
			, -1 														ImmigrantStatusId						
			, -1														PrimaryDisabilityTypeId				
			, -1 														SpecialEducationServicesExitDateId	
			, -1														MigrantStudentQualifyingArrivalDateId	
			, -1														LastQualifyingMoveDateId				

		FROM Staging.K12Enrollment ske
		JOIN RDS.DimSchoolYears rsy
			ON ske.SchoolYear = rsy.SchoolYear
		LEFT JOIN RDS.DimLeas rdl
			ON ske.LEAIdentifierSeaAccountability = rdl.LeaIdentifierSea
			AND ((rdl.RecordStartDateTime BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (rdl.RecordStartDateTime < @ReportingStartDate AND ISNULL(rdl.RecordEndDateTime, GETDATE()) > @ReportingStartDate))
		LEFT JOIN RDS.DimK12Schools rdksch
			ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
			AND ((rdksch.RecordStartDateTime BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (rdksch.RecordStartDateTime < @ReportingStartDate AND ISNULL(rdksch.RecordEndDateTime, GETDATE()) > @ReportingStartDate))
		JOIN RDS.DimSeas rds
			ON ((rds.RecordStartDateTime BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (rds.RecordStartDateTime < @ReportingStartDate AND ISNULL(rds.RecordEndDateTime, GETDATE()) > @ReportingStartDate))
	--disability
		LEFT JOIN Staging.ProgramParticipationSpecialEducation sppse
			ON ske.StudentIdentifierState = sppse.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability, '') = ISNULL(sppse.LEAIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
			AND ((sppse.ProgramParticipationBeginDate BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (sppse.ProgramParticipationBeginDate < @ReportingStartDate AND ISNULL(sppse.ProgramParticipationEndDate, GETDATE()) > @ReportingStartDate))
	--race
		LEFT JOIN RDS.vwUnduplicatedRaceMap spr
			ON ske.SchoolYear = spr.SchoolYear
			AND ske.StudentIdentifierState = spr.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability, '') = ISNULL(spr.LeaIdentifierSeaAccountability, '')
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(spr.SchoolIdentifierSea, '')
	--english learner
		LEFT JOIN Staging.PersonStatus el 
			ON ske.StudentIdentifierState = el.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability, '') = ISNULL(el.LEAIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(el.SchoolIdentifierSea, '')
			AND el.EnglishLearnerStatus = 1
			AND ((el.EnglishLearner_StatusStartDate BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (el.EnglishLearner_StatusStartDate < @ReportingStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, GETDATE()) > @ReportingStartDate))
	--homelessness
		LEFT JOIN Staging.PersonStatus homeless 
			ON ske.StudentIdentifierState = homeless.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability, '') = ISNULL(homeless.LEAIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(homeless.SchoolIdentifierSea, '')
			AND homeless.HomelessnessStatus = 1
			AND ((homeless.Homelessness_StatusStartDate BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (homeless.Homelessness_StatusStartDate < @ReportingStartDate AND ISNULL(homeless.Homelessness_StatusEndDate, GETDATE()) > @ReportingStartDate))
	--economically disadvantaged
		LEFT JOIN Staging.PersonStatus ecoDis
			ON ske.StudentIdentifierState = ecoDis.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability, '') = ISNULL(ecoDis.LEAIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(ecoDis.SchoolIdentifierSea, '')
			AND ecoDis.EconomicDisadvantageStatus = 1
			AND ((ecoDis.EconomicDisadvantage_StatusStartDate BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (ecoDis.EconomicDisadvantage_StatusStartDate < @ReportingStartDate AND ISNULL(ecoDis.EconomicDisadvantage_StatusEndDate, GETDATE()) > @ReportingStartDate))
	--migrant
		LEFT JOIN Staging.PersonStatus migrant
			ON ske.StudentIdentifierState = migrant.StudentIdentifierState
			AND ISNULL(ske.LEAIdentifierSeaAccountability, '') = ISNULL(migrant.LEAIdentifierSeaAccountability, '') 
			AND ISNULL(ske.SchoolIdentifierSea, '') = ISNULL(migrant.SchoolIdentifierSea, '')
			AND migrant.MigrantStatus = 1
			AND ((migrant.Migrant_StatusStartDate BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (migrant.Migrant_StatusStartDate < @ReportingStartDate AND ISNULL(migrant.Migrant_StatusEndDate, GETDATE()) > @ReportingStartDate))
		JOIN RDS.vwDimK12Demographics rdkd
			ON rsy.SchoolYear = rdkd.SchoolYear
			AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
		JOIN #vwDimK12AcademicAwardStatuses rdkaas
			ON ISNULL(ske.HighSchoolDiplomaType, 'MISSING') = ISNULL(rdkaas.HighSchoolDiplomaTypeCode, rdkaas.HighSchoolDiplomaTypeMap)
	--english learner (RDS)
		LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
			ON rsy.SchoolYear = rdels.SchoolYear
			AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)
			AND PerkinsEnglishLearnerStatusCode = 'MISSING'
	--disability status (RDS)
		LEFT JOIN #vwIdeaStatuses rdis
			ON rdis.IdeaIndicatorCode = 'Yes'
			AND rdis.SpecialEducationExitReasonCode = 'MISSING'
			AND rdis.[IdeaEducationalEnvironmentForSchoolAgeCode] = 'MISSING'
			AND rdis.[IdeaEducationalEnvironmentForEarlyChildhoodCode] = 'MISSING'
	--homelessness (RDS)
		LEFT JOIN #vwHomelessnessStatus rdhs
			ON ISNULL(CAST(homeless.HomelessnessStatus AS SMALLINT), -1) = ISNULL(CAST(rdhs.HomelessnessStatusMap AS SMALLINT), -1)
			AND rdhs.HomelessPrimaryNighttimeResidenceCode = 'MISSING'
			AND rdhs.HomelessUnaccompaniedYouthStatusCode = 'MISSING'
	--economically disadvantaged (RDS)
		LEFT JOIN #vwEconomicallyDisadvantagedStatuses rdeds
			ON ISNULL(CAST(ecoDis.EconomicDisadvantageStatus AS SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, -1)
			AND rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode = 'MISSING'
			AND rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode = 'MISSING'
	--migrant (RDS)
		LEFT JOIN #vwMigrantStatuses rdms
			ON ISNULL(CAST(migrant.MigrantStatus AS SMALLINT), -1) = ISNULL(CAST(rdms.MigrantStatusMap AS SMALLINT), -1)
	--race (RDS)
		LEFT JOIN #vwDimRaces rdr
			ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
				CASE
					when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
					WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
					ELSE 'Missing'
				END
				AND rsy.SchoolYear = rdr.SchoolYear
		JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState = rdp.StateStudentIdentifier
			AND rdp.IsActiveK12Student = 1
			AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
			AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
			AND ISNULL(ske.LastOrSurname, 'MISSING') = rdp.LastOrSurname
			AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
			AND ((rdp.RecordStartDateTime BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (rdp.RecordStartDateTime < @ReportingStartDate AND ISNULL(rdp.RecordEndDateTime, GETDATE()) > @ReportingStartDate))
		WHERE (ske.EnrollmentEntryDate BETWEEN @ReportingStartDate and @ReportingEndDate)
				OR (ske.EnrollmentEntryDate < @ReportingStartDate AND ISNULL(ske.EnrollmentExitDate, GETDATE()) > @ReportingStartDate)
		AND ISNULL(ske.HighSchoolDiplomaType, '') <> ''

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
			, [K12AcademicAwardStatusId]
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
			, [K12AcademicAwardStatusId]
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

	END TRY
	BEGIN CATCH
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StudentCounts_ChildCount', 'RDS.FactK12StudentCounts', 'FactK12StudentCounts', 'FactK12StudentCounts', ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH
		
END

GO

