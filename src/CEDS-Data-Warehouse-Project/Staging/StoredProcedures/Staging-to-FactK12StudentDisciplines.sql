--/**********************************************************************
--Author: AEM Corp
--Date:  5/1/2022
--Description: Migrates Discipline Data from Staging to RDS.FactK12StudentDisciplines

--NOTE: This Stored Procedure processes files: 005, 006, 007, 086, 088, 143, 144
--************************************************************************/
CREATE PROCEDURE  [Staging].[Staging-to-FactK12StudentDisciplines] 
	@SchoolYear SMALLINT
AS
BEGIN
	--SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Drop temp tables.  This allows for running the procedure as a script while debugging
		IF OBJECT_ID(N'tempdb..#vwGradeLevels') IS NOT NULL DROP TABLE #vwGradeLevels
		IF OBJECT_ID(N'tempdb..#vwRaces') IS NOT NULL DROP TABLE #vwRaces
		IF OBJECT_ID(N'tempdb..#vwIdeaStatuses') IS NOT NULL DROP TABLE #vwIdeaStatuses
		IF OBJECT_ID(N'tempdb..#vwUnduplicatedRaceMap') IS NOT NULL DROP TABLE #vwUnduplicatedRaceMap
		IF OBJECT_ID(N'tempdb..#vwEnglishLearnerStatuses') IS NOT NULL DROP TABLE #vwEnglishLearnerStatuses                             
		IF OBJECT_ID(N'tempdb..#vwDisciplineStatuses') IS NOT NULL DROP TABLE #vwDisciplineStatuses
		IF OBJECT_ID(N'tempdb..#tempELStatus') IS NOT NULL DROP TABLE #tempELStatus
		IF OBJECT_ID(N'tempdb..#Facts') IS NOT NULL DROP TABLE #Facts
               
	BEGIN TRY

		DECLARE 
		@FactTypeId INT,
		@SchoolYearId INT,
		@ChildCountDate DATE,
		@StartDate DATE,
		@EndDate DATE
		
	--Setting variables to be used in the select statements 
		SELECT @SchoolYearId = DimSchoolYearId 
		FROM RDS.DimSchoolYears
		WHERE SchoolYear = @SchoolYear

		SELECT @StartDate = CAST('7/1/' + CAST(@SchoolYear - 1 AS VARCHAR(4)) AS DATE)
		SELECT @EndDate = CAST('6/30/' + CAST(@SchoolYear  AS VARCHAR(4)) AS DATE)

		
		DECLARE @DimSeaId int
		SELECT @DimSeaId = (
		SELECT TOP 1 DimSeaId FROM rds.DimSeas 
		WHERE RecordStartDateTime between @StartDate and @EndDate
		ORDER BY RecordStartDateTime)
					

	-- Creating temp tables to be used in the select statement joins 
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
		INTO #vwEnglishLearnerStatuses 
		FROM RDS.vwDimEnglishLearnerStatuses
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwEnglishLearnerStatuses ON #vwEnglishLearnerStatuses (EnglishLearnerStatusMap)

		SELECT * 
		INTO #vwUnduplicatedRaceMap 
		FROM RDS.vwUnduplicatedRaceMap
		WHERE SchoolYear = @SchoolYear

		CREATE CLUSTERED INDEX ix_tempvwUnduplicatedRaceMap ON #vwUnduplicatedRaceMap (StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, RaceMap);

		SELECT * 
		INTO #vwDisciplineStatuses 
		FROM RDS.vwDimDisciplineStatuses 
		WHERE SchoolYear = @SchoolYear
		
		CREATE INDEX IX_vwDimDisciplines ON #vwDisciplineStatuses(SchoolYear, IdeaInterimRemovalMap, IdeaInterimRemovalReasonMap) INCLUDE (IdeaInterimRemovalCode, IdeaInterimRemovalReasonCode)


	--Set the Fact Type
		SELECT @FactTypeId = DimFactTypeId 
		FROM rds.DimFactTypes
		WHERE FactTypeCode = 'submission'

	--Pull the EL Status into the temp table
		CREATE TABLE #tempELStatus (
			StudentIdentifierState 				nvarchar(40)
			, LeaIdentifierSeaAccountability 	nvarchar(50)
			, SchoolIdentifierSea 				nvarchar(50)
			, EnglishLearnerStatus 				bit
			, EnglishLearner_StatusStartDate 	date
			, EnglishLearner_StatusEndDate 		date
		)
		INSERT INTO #tempELStatus
		SELECT DISTINCT 
			StudentIdentifierState
			, LeaIdentifierSeaAccountability
			, SchoolIdentifierSea 
			, EnglishLearnerStatus
			, EnglishLearner_StatusStartDate
			, EnglishLearner_StatusEndDate
		FROM Staging.PersonStatus

		CREATE INDEX IX_tempELStatus ON #tempELStatus(StudentIdentifierState, LeaIdentifierSeaAccountability, SchoolIdentifierSea, englishlearner_statusstartdate, englishlearner_statusenddate)-- INCLUDE (IdeaInterimRemovalCode, IdeaInterimRemovalReasonCode, DisciplineELStatusCode)

	-- Clear the Fact table for the SY being migrated
		DELETE RDS.FactK12StudentDisciplines
		WHERE SchoolYearId = @SchoolYearId 

	--Create and load #Facts temp table
		CREATE TABLE #Facts (
			StagingId 										int not null                                                                                                 
			, AgeId   										int null
			, SchoolYearId     								int null
			, K12DemographicId         						int null
			, DisciplineId 									int null
			, FactTypeId        							int null
			, IdeaStatusId     								int null
			, K12SchoolId      								int null
			, K12StudentId    								int null
			, DisciplineCount               				int null
			, FirearmId          							int null
			, GradeLevelId    								int null
			, CTEStatusId      								int null
			, LEAId   										int null                                 
			, RaceId 										int null
			, SEAId   										int null
			, IEUId   										int null
			, DataCollectionId 								int null
			, DisabilityStatusId 							int null 
			, DisciplinaryActionEndDateId  					int null 
			, DisciplinaryActionStartDateId 				int null
			, DisciplineStatusId 							int null 
			, EconomicallyDisadvantagedStatusId 			int null 
			, EnglishLearnerStatusId 						int null 
			, FirearmDisciplineStatusId 					int null 
			, FosterCareStatusId 							int null 
			, HomelessnessStatusId 							int null 
			, ImmigrantStatusId 							int null 
			, IncidentIdentifier 							nvarchar(40) 
			, IncidentStatusId 								int null 
			, IncidentDateId 								int null 
			, MigrantStatusId 								int null 
			, MilitaryStatusId  							int null 
			, NOrDStatusId 									int null 
			, PrimaryDisabilityTypeId 						int null 
			, SecondaryDisabilityTypeId 					int null 
			, TitleIStatusId 								int null 
			, TitleIIIStatusId 								int null 
			, DurationOfDisciplinaryAction 					decimal(18,2)	null 
		)
		INSERT INTO #Facts
		SELECT 
			sd.Id                                         			StagingId
			, -1                                     	 			AgeId
			, rsy.DimSchoolYearId                                   SchoolYearId
			, ISNULL(rdkd.DimK12DemographicId, -1)                  K12DemographicId
			, ISNULL(rddisc.DimDisciplineStatusId, -1)              DisciplineId
			, @FactTypeId                                           FactTypeId
			, ISNULL(rdis.DimIdeaStatusId, -1)                      IdeaStatusId
			, ISNULL(rdksch.DimK12SchoolId, -1)                     K12SchoolId
			, rdp.DimPersonId                                       K12StudentId
			, 1                                                     DisciplineCount
			, ISNULL(rdf.DimFirearmId, -1)                          FirearmId
			, ISNULL(rgls.DimGradeLevelId, -1)                      GradeLevelId
			, -1                                                    CteStatusId
			, ISNULL(rdl.DimLeaID, -1)                              LeaId
			, ISNULL(rdr.DimRaceId, -1)                             RaceId
			, ISNULL(rds.DimSeaId, -1)                              SeaId
			, -1                                                    IeuId
			, -1                                                    DataCollectionId
			, -1                                                    DisabilityStatusId
			, -1                                                    DisciplinaryActionEndDateId  
			, ISNULL(disaction.DimDateId, -1)                       DisciplinaryActionStartDateId 
			, ISNULL(rddisc.DimDisciplineStatusId, -1)              DisciplineStatusId
			, -1                                                    EconomicallyDisadvantagedStatusId 
			, ISNULL(rdels.DimEnglishLearnerStatusId, -1)           EnglishLearnerStatusId
			, ISNULL(rdfds.DimFirearmDisciplineStatusId, -1)		FirearmDisciplineStatusId 
			, -1                                                    FosterCareStatusId
			, -1                                                    HomelessnessStatusId
			, -1                                                    ImmigrantStatusId
			, sd.IncidentIdentifier                                 IncidentIdentifier
			, -1                                                    IncidentStatusId
			, ISNULL(Incident.DimDateId, -1)                        IncidentDateId 
			, -1                                                    MigrantStatusId
			, -1                                                    MilitaryStatusId
			, -1                                                    NOrDStatusId
			, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)             PrimaryDisabilityTypeId
			, -1                                                    SecondaryDisabilityTypeId
			, -1                                                    TitleIStatusId
			, -1                                                    TitleIIIStatusId
			, ISNULL(sd.DurationOfDisciplinaryAction, 0)            DurationOfDisciplinaryAction
		FROM Staging.Discipline sd 
			JOIN Staging.K12Enrollment ske
				ON sd.StudentIdentifierState 						= ske.StudentIdentifierState
				AND ISNULL(sd.LeaIdentifierSeaAccountability, '') 	= ISNULL(ske.LeaIdentifierSeaAccountability, '')
				AND ISNULL(sd.SchoolIdentifierSea, '') 				= ISNULL(ske.SchoolIdentifierSea, '')
				AND sd.DisciplinaryActionStartDate BETWEEN ske.EnrollmentEntryDate AND ISNULL(ske.EnrollmentExitDate, @EndDate)

		--program participation special education              
			JOIN Staging.ProgramParticipationSpecialEducation sppse
				ON ske.StudentIdentifierState 						= sppse.StudentIdentifierState
				AND ISNULL(ske.LEAIdentifierSeaAccountability,'') 	= ISNULL(sppse.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') 				= ISNULL(sppse.SchoolIdentifierSea,'')
				AND sd.DisciplinaryActionStartDate BETWEEN sppse.ProgramParticipationBeginDate AND ISNULL(sppse.ProgramParticipationEndDate, @EndDate)
			
		--idea disability type
			JOIN Staging.IdeaDisabilityType sidt         
				ON ske.SchoolYear = sidt.SchoolYear
				AND sidt.StudentIdentifierState 					= sppse.StudentIdentifierState
				AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
				AND ISNULL(sidt.SchoolIdentifierSea, '') 			= ISNULL(sppse.SchoolIdentifierSea, '')
				AND sidt.IsPrimaryDisability = 1
				AND sd.DisciplinaryActionStartDate BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, GETDATE())
			
		--person status                 
			LEFT JOIN #tempELStatus el
				ON sd.StudentIdentifierState 						= el.StudentIdentifierState
				AND ISNULL(sd.LeaIdentifierSeaAccountability, '') 	= ISNULL(el.LeaIdentifierSeaAccountability, '')
				AND ISNULL(sd.SchoolIdentifierSea, '') 				= ISNULL(el.SchoolIdentifierSea, '')
				AND sd.DisciplinaryActionStartDate BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, @EndDate)

			JOIN RDS.DimSchoolYears rsy
				ON ske.SchoolYear = rsy.SchoolYear

		--dimpeople (rds)
			JOIN RDS.DimPeople rdp
				ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
				AND IsActiveK12Student = 1
				AND ISNULL(ske.FirstName, '') 				= ISNULL(rdp.FirstName, '')
				AND ISNULL(ske.MiddleName, '') 				= ISNULL(rdp.MiddleName, '')
				AND ISNULL(ske.LastOrSurname, 'MISSING')	= rdp.LastOrSurname
				AND ISNULL(ske.Birthdate, '1/1/1900') 		= ISNULL(rdp.BirthDate, '1/1/1900')
				AND sd.DisciplinaryActionStartDate BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, @EndDate)
				AND IsActiveK12Student = 1

		--seas (rds)                                        
			JOIN RDS.DimSeas rds
				ON sd.DisciplinaryActionStartDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())           

		--leas (rds)
			LEFT JOIN RDS.DimLeas rdl
				ON sd.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
				AND sd.DisciplinaryActionStartDate BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, @EndDate)

		--schools (rds)
			LEFT JOIN RDS.DimK12Schools rdksch
				ON sd.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
				AND sd.DisciplinaryActionStartDate BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, @EndDate)

		--demographics                                
			JOIN RDS.vwDimK12Demographics rdkd
				ON rsy.SchoolYear = rdkd.SchoolYear
				AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
			
		-- disciplineId
			LEFT JOIN #vwDisciplineStatuses rddisc
				ON rsy.SchoolYear = rddisc.SchoolYear
				AND ISNULL(sd.DisciplinaryActionTaken, 'MISSING')						= ISNULL(rddisc.DisciplinaryActionTakenMap, rddisc.DisciplinaryActionTakenCode)
				AND ISNULL(sd.DisciplineMethodOfCwd, 'MISSING')                         = ISNULL(rddisc.DisciplineMethodOfChildrenWithDisabilitiesMap, rddisc.DisciplineMethodOfChildrenWithDisabilitiesCode)
				AND ISNULL(CAST(sd.EducationalServicesAfterRemoval AS SMALLINT), -1)   	= ISNULL(rddisc.EducationalServicesAfterRemovalMap, -1)
				AND ISNULL(sd.IdeaInterimRemoval, 'MISSING')                            = ISNULL(rddisc.IdeaInterimRemovalMap, rddisc.IdeaInterimRemovalCode)
				AND ISNULL(sd.IdeaInterimRemovalReason, 'MISSING')                      = ISNULL(rddisc.IdeaInterimRemovalReasonMap, rddisc.IdeaInterimRemovalReasonCode)
			
		--idea status (rds)             
			LEFT JOIN #vwIdeaStatuses rdis
				ON rsy.SchoolYear = rdis.SchoolYear
				AND rdis.IdeaIndicatorCode = 'Yes'
				AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge, 'MISSING')		= ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
				AND ISNULL(sppse.SpecialEducationExitReason, 'MISSING')                 = ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode) 
			
		--idea disability type (rds)
			LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
				ON ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidt.IdeaDisabilityTypeMap, rdidt.IdeaDisabilityTypeCode)
				AND sidt.IsPrimaryDisability = 1
			
		--grade levels (rds)
			LEFT JOIN #vwGradeLevels rgls
				ON rsy.SchoolYear = rgls.SchoolYear
				AND ske.GradeLevel = rgls.GradeLevelMap
				AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
			
		--race (rds)                                                                      
			LEFT JOIN RDS.vwUnduplicatedRaceMap spr --  Using a view that resolves multiple race records by returinging the value TwoOrMoreRaces
				ON rsy.SchoolYear = spr.SchoolYear
				AND ske.StudentIdentifierState = spr.StudentIdentifierState
				AND ISNULL(ske.LEAIdentifierSeaAccountability,'')	= ISNULL(spr.LeaIdentifierSeaAccountability,'')
				AND ISNULL(ske.SchoolIdentifierSea,'') 				= ISNULL(spr.SchoolIdentifierSea,'')

			LEFT JOIN #vwRaces rdr
				ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
					CASE
						WHEN ske.HispanicLatinoEthnicity = 1 THEN 'HispanicorLatinoEthnicity'
						WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
						ELSE 'Missing'
					END
						
		--english learner (rds)
			LEFT JOIN #vwEnglishLearnerStatuses rdels
				ON rsy.SchoolYear = rdels.SchoolYear
				AND rdels.PerkinsEnglishLearnerStatusCode = 'MISSING'
				AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, -1)

		--firearm disciplines (rds)
			LEFT JOIN RDS.vwDimFirearmDisciplineStatuses rdfds
				ON rsy.SchoolYear = rdis.SchoolYear                                                       
				AND ISNULL(sd.DisciplineMethodFirearm, 'MISSING')   	= ISNULL(rdfds.DisciplineMethodForFirearmsIncidentsMap, rdfds.DisciplineMethodForFirearmsIncidentsCode)
				AND ISNULL(sd.IDEADisciplineMethodFirearm, 'MISSING')   = ISNULL(rdfds.IdeaDisciplineMethodForFirearmsIncidentsMap, rdfds.IdeaDisciplineMethodForFirearmsIncidentsCode) 

		-- incident date
			LEFT JOIN RDS.DimDates incident 
				ON sd.IncidentDate =  incident.DateValue

		-- disciplinary action start date
			LEFT JOIN RDS.DimDates disaction 
				ON sd.DisciplinaryActionStartDate =  disaction.DateValue
			
		-- firearm type
			LEFT JOIN RDS.vwDimFirearms rdf
				ON rsy.SchoolYear = rdf.SchoolYear                                                         
				AND ISNULL(sd.FirearmType, 'MISSING') 	= ISNULL(rdf.FirearmTypeMap, rdf.FirearmTypeCode)

			--IF EXISTS (SELECT 1 FROM Staging.ProgramParticipationCTE) BEGIN

			--            IF OBJECT_ID('tempdb.dbo.#vwDimCteStatuses', 'U') IS NOT NULL 
			--                           DROP TABLE #vwDimCteStatuses;                            
			--            SELECT v.* INTO #vwDimCteStatuses FROM RDS.vwDimCteStatuses v
			--            WHERE v.SchoolYear = @SchoolYear
			--            CREATE INDEX IX_vwDimCteStatuses ON #vwDimCteStatuses(SchoolYear, CteProgramMap, CteAeDisplacedHomemakerIndicatorMap, CteNontraditionalGenderStatusMap, RepresentationStatusMap, SingleParentOrSinglePregnantWomanMap, CteGraduationRateInclusionMap, LepPerkinsStatusMap) INCLUDE (CteProgramCode, CteAeDisplacedHomemakerIndicatorCode, CteNontraditionalGenderStatusCode, RepresentationStatusCode, SingleParentOrSinglePregnantWomanCode, CteGraduationRateInclusionCode, LepPerkinsStatusCode)

			--/*  Update the #Facts table */                                
				-- UPDATE #Facts
				-- SET CteStatusId = ISNULL(rdcs.DimCteStatusId, -1)
				-- FROM #Facts fact
				-- JOIN Staging.Discipline sd
				-- 	ON fact.StagingId = sd.Id
				-- LEFT JOIN Staging.ProgramParticipationCTE sppc_part_conc
				-- 	ON sd.StudentIdentifierState = sppc_part_conc.StudentIdentifierState
				-- 	AND ISNULL(sd.LeaIdentifierSeaAccountability, '') = ISNULL(sppc_part_conc.LeaIdentifierSeaAccountability, '')
				-- 	AND ISNULL(sd.SchoolIdentifierSea, '') = ISNULL(sppc_part_conc.SchoolIdentifierSea, '')
				-- 	AND sd.DisciplinaryActionStartDate BETWEEN sppc_part_conc.ProgramParticipationBeginDate AND ISNULL(sppc_part_conc.ProgramParticipationEndDate, @EndDate)
				-- LEFT JOIN Staging.ProgramParticipationCTE sppc_dhm
				-- 	ON sd.StudentIdentifierState = sppc_dhm.StudentIdentifierState
				-- 	AND ISNULL(sd.LeaIdentifierSeaAccountability, '') = ISNULL(sppc_dhm.LeaIdentifierSeaAccountability, '')
				-- 	AND ISNULL(sd.SchoolIdentifierSea, '') = ISNULL(sppc_dhm.SchoolIdentifierSea, '')
				-- 	AND sd.DisciplinaryActionStartDate BETWEEN sppc_dhm.DisplacedHomeMaker_StatusStartDate AND ISNULL(sppc_dhm.DisplacedHomeMaker_StatusEndDate, @EndDate)
				-- LEFT JOIN Staging.ProgramParticipationCTE sppc_sp
				-- 	ON sd.StudentIdentifierState = sppc_sp.StudentIdentifierState
				-- 	AND ISNULL(sd.LeaIdentifierSeaAccountability, '') = ISNULL(sppc_sp.LeaIdentifierSeaAccountability, '')
				-- 	AND ISNULL(sd.SchoolIdentifierSea, '') = ISNULL(sppc_sp.SchoolIdentifierSea, '')
				-- 	AND sd.DisciplinaryActionStartDate BETWEEN sppc_sp.SingleParent_StatusStartDate AND ISNULL(sppc_sp.SingleParent_StatusEndDate, @EndDate)
				-- LEFT JOIN Staging.PersonStatus sps
				-- 	ON sd.StudentIdentifierState = sps.StudentIdentifierState
				-- 	AND ISNULL(sd.LeaIdentifierSeaAccountability, '') = ISNULL(sps.LeaIdentifierSeaAccountability, '')
				-- 	AND ISNULL(sd.SchoolIdentifierSea, '') = ISNULL(sps.SchoolIdentifierSea, '')
				-- 	AND sd.DisciplinaryActionStartDate BETWEEN sps.PerkinsLEPStatus_StatusStartDate AND ISNULL(sps.PerkinsLEPStatus_StatusEndDate, @EndDate)
				-- LEFT JOIN #vwDimCteStatuses rdcs
				-- 	ON CASE
				-- 		WHEN ISNULL(sppc_part_conc.CteConcentrator, 0) = 1 THEN 2
				-- 		WHEN ISNULL(sppc_part_conc.CteParticipant, 0) = 1  THEN 1
				-- 		WHEN sppc_part_conc.CteParticipant = 0                                                                                                                      THEN 0
				-- 		ELSE -1
				-- 	END                                                                                                                                                                                                                                                                                  = ISNULL(rdcs.CteProgramMap, -1)
				-- 	AND ISNULL(CAST(sppc_dhm.DisplacedHomeMakerIndicator AS SMALLINT), -1)		= ISNULL(rdcs.CteAeDisplacedHomemakerIndicatorMap, -1)
				-- 	AND ISNULL(CAST(sppc_part_conc.NonTraditionalGenderStatus AS SMALLINT), -1) = ISNULL(rdcs.CteNontraditionalGenderStatusMap, -1)
				-- 	AND ISNULL(CAST(sppc_part_conc.NonTraditionalGenderStatus AS SMALLINT), -1) = ISNULL(rdcs.RepresentationStatusMap, -1)
				-- 	AND ISNULL(CAST(sppc_sp.SingleParentIndicator AS SMALLINT), -1)             = ISNULL(rdcs.SingleParentOrSinglePregnantWomanMap, -1)
				-- 	AND ISNULL(CAST(sppc_sp.SingleParentIndicator AS SMALLINT), -1)             = ISNULL(rdcs.SingleParentOrSinglePregnantWomanMap, -1)
				-- 	AND ISNULL(CAST(sps.PerkinsLEPStatus AS SMALLINT), -1)                      = ISNULL(rdcs.LepPerkinsStatusMap, -1)
			--END

	--Final insert into RDS.FactK12StudentDisciplines table
		INSERT INTO RDS.FactK12StudentDisciplines (
			SchoolYearId
			, FactTypeId
			, DataCollectionId
			, SeaId
			, IeuId
			, LeaId
			, K12SchoolId
			, K12StudentId
			, AgeId
			, CteStatusId
			, DisabilityStatusId
			, DisciplinaryActionStartDateId
			, DisciplinaryActionEndDateId
			, DisciplineStatusId
			, EconomicallyDisadvantagedStatusId
			, EnglishLearnerStatusId
			, FirearmId
			, FirearmDisciplineStatusId
			, FosterCareStatusId
			, GradeLevelId
			, HomelessnessStatusId
			, IdeaStatusId
			, ImmigrantStatusId
			, IncidentIdentifier
			, IncidentStatusId
			, IncidentDateId
			, K12DemographicId
			, MigrantStatusId
			, MilitaryStatusId
			, NOrDStatusId
			, RaceId
			, PrimaryDisabilityTypeId
			, SecondaryDisabilityTypeId
			, TitleIStatusId
			, TitleIIIStatusId
			, DurationOfDisciplinaryAction
			, DisciplineCount
		)
		SELECT 
			SchoolYearId
			, FactTypeId
			, DataCollectionId
			, SeaId
			, IeuId
			, LeaId
			, K12SchoolId
			, K12StudentId
			, AgeId
			, CteStatusId
			, DisabilityStatusId
			, DisciplinaryActionStartDateId
			, DisciplinaryActionEndDateId
			, DisciplineStatusId
			, EconomicallyDisadvantagedStatusId
			, EnglishLearnerStatusId
			, FirearmId
			, FirearmDisciplineStatusId
			, FosterCareStatusId
			, GradeLevelId
			, HomelessnessStatusId
			, IdeaStatusId
			, ImmigrantStatusId
			, IncidentIdentifier
			, IncidentStatusId
			, IncidentDateId
			, K12DemographicId
			, MigrantStatusId
			, MilitaryStatusId
			, NOrDStatusId
			, RaceId
			, PrimaryDisabilityTypeId
			, SecondaryDisabilityTypeId
			, TitleIStatusId
			, TitleIIIStatusId
			, DurationOfDisciplinaryAction
			, DisciplineCount
		FROM #Facts

		ALTER INDEX ALL ON RDS.FactK12StudentCounts REBUILD
	
	END TRY
	BEGIN CATCH
		INSERT INTO Staging.ValidationErrors VALUES ('Staging.Staging-to-FactK12StudentDisciplines', 'RDS.FactK12StudentDisciplines', 'FactK12StudentDisciplines', NULL, ERROR_MESSAGE(), 1, NULL, GETDATE())
	END CATCH

END

GO

