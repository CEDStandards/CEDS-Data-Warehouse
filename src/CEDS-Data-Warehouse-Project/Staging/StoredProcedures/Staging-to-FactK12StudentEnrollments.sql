CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentEnrollments]
	@DataCollectionName	VARCHAR(60) = NULL
AS

	DROP TABLE IF EXISTS #SchoolYears
	SELECT DISTINCT SchoolYear INTO #SchoolYears FROM Staging.K12Enrollment WHERE (@DataCollectionName IS NULL OR DataCollectionName = @DataCollectionName)

	DROP TABLE IF EXISTS #vwDimK12Demographics
	SELECT v.* INTO #vwDimK12Demographics FROM RDS.vwDimK12Demographics v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimK12Demographics ON #vwDimK12Demographics(SchoolYear, SexMap) INCLUDE (SexCode)

	DROP TABLE IF EXISTS #vwDimK12EnrollmentStatuses
	SELECT v.* INTO #vwDimK12EnrollmentStatuses FROM RDS.vwDimK12EnrollmentStatuses v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimK12EnrollmentStatuses ON #vwDimK12EnrollmentStatuses(SchoolYear, EnrollmentStatusMap, EntryTypeMap, ExitOrWithdrawalTypeMap, PostSecondaryEnrollmentStatusMap) INCLUDE (EnrollmentStatusCode, EntryTypeCode, ExitOrWithdrawalTypeCode, PostSecondaryEnrollmentStatusCode)

	DROP TABLE IF EXISTS #vwDimIdeaStatuses
	SELECT v.* INTO #vwDimIdeaStatuses FROM RDS.vwDimIdeaStatuses v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimIdeaStatuses ON #vwDimIdeaStatuses(SchoolYear, IdeaIndicatorMap, IdeaEducationalEnvironmentForEarlyChildhoodMap, IdeaEducationalEnvironmentForSchoolAgeMap, SpecialEducationExitReasonMap) INCLUDE (IdeaEducationalEnvironmentForEarlyChildhoodCode, IdeaEducationalEnvironmentForSchoolAgeCode, SpecialEducationExitReasonCode)

	DROP TABLE IF EXISTS #vwDimEnglishLearnerStatuses
	SELECT v.* INTO #vwDimEnglishLearnerStatuses FROM RDS.vwDimEnglishLearnerStatuses v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimEnglishLearnerStatuses ON #vwDimEnglishLearnerStatuses(SchoolYear, EnglishLearnerStatusMap, PerkinsEnglishLearnerStatusCode, PerkinsEnglishLearnerStatusMap)

	DROP TABLE IF EXISTS #vwDimGradeLevels
	SELECT v.* INTO #vwDimGradeLevels FROM RDS.vwDimGradeLevels  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear WHERE GradeLevelTypeDescription = 'Entry Grade Level' 
	CREATE INDEX IX_vwDimGradeLevels ON #vwDimGradeLevels(SchoolYear, GradeLevelMap) INCLUDE (GradeLevelCode)

	DROP TABLE IF EXISTS #vwDimHomelessnessStatuses
	SELECT v.* INTO #vwDimHomelessnessStatuses FROM RDS.vwDimHomelessnessStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimHomelessnessStatuses ON #vwDimHomelessnessStatuses(SchoolYear, HomelessnessStatusMap, HomelessPrimaryNighttimeResidenceMap, HomelessServicedIndicatorMap, HomelessUnaccompaniedYouthStatusMap) INCLUDE (HomelessnessStatusCode, HomelessPrimaryNighttimeResidenceCode, HomelessServicedIndicatorCode, HomelessUnaccompaniedYouthStatusCode)

	DROP TABLE IF EXISTS #vwDimEconomicallyDisadvantagedStatuses
	SELECT v.* INTO #vwDimEconomicallyDisadvantagedStatuses FROM RDS.vwDimEconomicallyDisadvantagedStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimEconomicallyDisadvantagedStatuses ON #vwDimEconomicallyDisadvantagedStatuses(SchoolYear, EconomicDisadvantageStatusMap, EligibilityStatusForSchoolFoodServiceProgramsMap, NationalSchoolLunchProgramDirectCertificationIndicatorMap) INCLUDE (EconomicDisadvantageStatusCode, EligibilityStatusForSchoolFoodServiceProgramsCode, NationalSchoolLunchProgramDirectCertificationIndicatorCode)

	DROP TABLE IF EXISTS #vwDimFosterCareStatuses
	SELECT v.* INTO #vwDimFosterCareStatuses FROM RDS.vwDimFosterCareStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimFosterCareStatuses ON #vwDimFosterCareStatuses(SchoolYear, ProgramParticipationFosterCareMap) INCLUDE (ProgramParticipationFosterCareCode)

	DROP TABLE IF EXISTS #vwDimImmigrantStatuses
	SELECT v.* INTO #vwDimImmigrantStatuses FROM RDS.vwDimImmigrantStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimImmigrantStatuses ON #vwDimImmigrantStatuses(SchoolYear, TitleIIIImmigrantStatusMap, TitleIIIImmigrantParticipationStatusMap) INCLUDE (TitleIIIImmigrantStatusCode, TitleIIIImmigrantParticipationStatusCode)

	DROP TABLE IF EXISTS #vwDimMigrantStatuses
	SELECT v.* INTO #vwDimMigrantStatuses FROM RDS.vwDimMigrantStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimMigrantStatuses ON #vwDimMigrantStatuses(SchoolYear, MigrantStatusMap, MigrantEducationProgramEnrollmentTypeMap, ContinuationOfServicesReasonMap, MigrantEducationProgramServicesTypeMap, MigrantPrioritizedForServicesMap) INCLUDE (MigrantStatusCode, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode)

	DROP TABLE IF EXISTS #vwDimMilitaryStatuses
	SELECT v.* INTO #vwDimMilitaryStatuses FROM RDS.vwDimMilitaryStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimMilitaryStatuses ON #vwDimMilitaryStatuses(SchoolYear, MilitaryConnectedStudentIndicatorMap, MilitaryActiveStudentIndicatorMap, MilitaryBranchMap, MilitaryVeteranStudentIndicatorMap) INCLUDE (MilitaryConnectedStudentIndicatorCode, MilitaryActiveStudentIndicatorCode, MilitaryBranchCode, MilitaryVeteranStudentIndicatorCode)

	DROP TABLE IF EXISTS #vwDimIdeaDisabilityTypes
	SELECT v.* INTO #vwDimIdeaDisabilityTypes FROM RDS.vwDimIdeaDisabilityTypes  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimIdeaDisabilityTypes ON #vwDimIdeaDisabilityTypes(SchoolYear, IdeaDisabilityTypeMap) INCLUDE (IdeaDisabilityTypeCode)

	DROP TABLE IF EXISTS #vwDimTitleIIIStatuses
	SELECT v.* INTO #vwDimTitleIIIStatuses FROM RDS.vwDimTitleIIIStatuses  v JOIN #SchoolYears t on v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimTitleIIIStatuses ON #vwDimTitleIIIStatuses(SchoolYear, ProgramParticipationTitleIIILiepMap, ProficiencyStatusMap) INCLUDE (ProgramParticipationTitleIIILiepCode, ProficiencyStatusCode)

	DROP TABLE IF EXISTS #Facts
	CREATE TABLE #Facts (
			  [StagingId]									  INT NOT NULL
			, [SchoolYearId]                                  INT NULL
			, [DataCollectionId]                              INT NULL
			, [CountDateId]									  INT NULL
			, [SeaId]                                         INT NULL
			, [IeuId]                                         INT NULL
			, [LeaAccountabilityId]                           INT NULL
			, [LeaAttendanceId]                               INT NULL
			, [LeaFundingId]                                  INT NULL
			, [LeaGraduationID]                               INT NULL
			, [LeaIndividualizedEducationProgramId]           INT NULL
			, [LeaMembershipResidentId]						  INT NULL
			, [K12SchoolId]									  INT NULL
			, [ResponsibleSchoolTypeId]						  INT NULL
			, [EducationOrganizationNetworkId]                INT NULL
			, [K12StudentId]                                  INT NULL
			, [CohortGraduationYearId]                        INT NULL          
			, [CohortYearId]                                  INT NULL
			, [CteStatusId]                                   INT NULL
			, [EntryGradeLevelId]                             INT NULL
			, [ExitGradeLevelId]                              INT NULL
			, [EnrollmentEntryDateId]                         INT NULL
			, [EnrollmentExitDateId]                          INT NULL
			, [EnglishLearnerStatusId]                        INT NULL
			, [K12EnrollmentStatusId]                         INT NULL
			, [K12DemographicId]                              INT NULL
			, [IdeaStatusId]                                  INT NULL
			, [HomelessnessStatusId]                          INT NULL
			, [EconomicallyDisadvantagedStatusId]             INT NULL
			, [FosterCareStatusId]                            INT NULL
			, [ImmigrantStatusId]                             INT NULL
			, [LanguageHomeId]                                INT NULL
			, [LanguageNativeId]                              INT NULL
			, [MigrantStatusId]                               INT NULL
			, [MilitaryStatusId]                              INT NULL
			, [NOrDStatusId]                                  INT NULL
			, [PrimaryDisabilityTypeId]                       INT NULL
			, [SecondaryDisabilityTypeId]                     INT NULL
			, [ProjectedGraduationDateId]                     INT NULL
			, [StatusStartDateEconomicallyDisadvantagedId]    INT NULL
			, [StatusEndDateEconomicallyDisadvantagedId]      INT NULL
			, [StatusStartDateEnglishLearnerId]               INT NULL
			, [StatusEndDateEnglishLearnerId]                 INT NULL
			, [StatusStartDateHomelessnessId]                 INT NULL
			, [StatusEndDateHomelessnessId]                   INT NULL
			, [StatusStartDateIdeaId]                         INT NULL
			, [StatusEndDateIdeaId]                           INT NULL
			, [StatusStartDateMigrantId]                      INT NULL
			, [StatusEndDateMigrantId]                        INT NULL
			, [StatusStartDateMilitaryConnectedStudentId]     INT NULL
			, [StatusEndDateMilitaryConnectedStudentId]       INT NULL
			, [StatusStartDatePerkinsLepId]                   INT NULL
			, [StatusEndDatePerkinsLepId]                     INT NULL
			, [StatusEndDateTitleIIIImmigrantId]              INT NULL
			, [StatusStartDateTitleIIIImmigrantId]            INT NULL
			, [TitleIIIStatusId]                              INT NULL
			, [FullTimeEquivalency]                           DECIMAL(5,2) NULL
			, [StudentCount]                                  INT NULL
			)

	INSERT INTO #Facts (
		  [StagingId]
		, [SchoolYearId]                         
		, [DataCollectionId]           
		, [CountDateId]
		, [SeaId]                                
		, [LeaAccountabilityId]                  
		, [LeaAttendanceId]                      
		, [LeaFundingId]                         
		, [LeaGraduationID]                      
		, [LeaIndividualizedEducationProgramId]  
		, [LeaMembershipResidentId]
		, [K12SchoolId]               
		, [ResponsibleSchoolTypeId]
		, [K12StudentId]    
		, [CohortGraduationYearId]                                  
		, [CohortYearId]                                  
		, [ProjectedGraduationDateId]
		, [EntryGradeLevelId]                             
		, [EnrollmentEntryDateId]                         
		, [EnrollmentExitDateId]       
		, [FullTimeEquivalency]
		)
	
	SELECT DISTINCT
		  ske.Id
		, rsy.DimSchoolYearId
		, rddc.DimDataCollectionId													AS DataCollectionId
		, countdate.DimDateId
		, rds.DimSeaId																AS SeaId
		, rdlAcc.DimLeaId															AS LeaAccountabilityId
		, rdlAtt.DimLeaId															AS LeaAttendanceId
		, rdlFun.DimLeaId															AS LeaFundingId
		, rdlGrad.DimLeaId															AS LeaGraduationId
		, rdlIep.DimLeaId															AS LeaIepId
		, rdlRes.DimLeaId															AS LeaMembershipResidentId
		, rdksch.DimK12SchoolId														AS K12SchoolId
		, rdrst.DimResponsibleSchoolTypeId											AS ResponsibleSchoolTypeId
		, rdp.DimPersonId															AS K12StudentId
		, gradCohortYear.DimSchoolYearId											AS GradCohortYearId
		, cohortYear.DimSchoolYearId												AS CohortYearId
		, gradDate.DimDateId														AS ProjectedGraduationDateId
		, entryGrade.DimGradeLevelId												AS EntryGradeLevelId
		, entryDate.DimDateId														AS EnrollmentEntryDateId
		, exitDate.DimDateId														AS EnrollmentExitDateId
		, ske.FullTimeEquivalency													AS FullTimeEquivalency
	FROM Staging.K12Enrollment ske
	LEFT JOIN RDS.DimPeople rdp
		ON ske.StudentIdentifierState																			= rdp.K12StudentStudentIdentifierState
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')																				BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		AND ISNULL(ske.FirstName, 'MISSING')																	= ISNULL(rdp.FirstName, 'MISSING')
		AND ISNULL(ske.MiddleName, 'MISSING')																	= ISNULL(rdp.MiddleName, 'MISSING')
		AND ISNULL(ske.LastOrSurname, 'MISSING')																= ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(ske.Birthdate, '1/1/1900')																	= ISNULL(rdp.BirthDate, '1/1/1900')
	LEFT JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN RDS.DimLeas rdlAcc
		ON ske.LeaIdentifierSeaAccountability = rdlAcc.LeaIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdlAcc.RecordStartDateTime AND ISNULL(rdlAcc.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlAtt
		ON ske.LeaIdentifierSeaAttendance = rdlAtt.LeaIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdlAtt.RecordStartDateTime AND ISNULL(rdlAtt.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlFun
		ON ske.LeaIdentifierSeaFunding = rdlFun.LeaIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdlFun.RecordStartDateTime AND ISNULL(rdlFun.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlGrad
		ON ske.LeaIdentifierSeaGraduation = rdlGrad.LeaIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdlGrad.RecordStartDateTime AND ISNULL(rdlGrad.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlIep
		ON ske.LeaIdentifierSeaIndividualizedEducationProgram = rdlIep.LeaIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdlIep.RecordStartDateTime AND ISNULL(rdlIep.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlRes
		ON ske.LeaIdentifierSeaMembershipResident = rdlRes.LeaIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdlRes.RecordStartDateTime AND ISNULL(rdlRes.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimK12Schools rdksch
		ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimK12Schools rdksch2
		ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		AND ISNULL(ske.EnrollmentExitDate, rsy.SessionEndDate) BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimResponsibleSchoolTypes rdrst
		ON CASE ske.ResponsibleSchoolTypeAccountability WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeAccountability
		AND CASE ske.ResponsibleSchoolTypeAttendance WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeAttendance
		AND CASE ske.ResponsibleSchoolTypeFunding WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeFunding
		AND CASE ske.ResponsibleSchoolTypeGraduation WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeGraduation		
		AND CASE ske.ResponsibleSchoolTypeIndividualizedEducationProgram WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeIndividualizedEducationProgram
		AND CASE ske.ResponsibleSchoolTypeTransportation WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeTransportation
		AND CASE ske.ResponsibleSchoolTypeIepServiceProvider WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'MISSING' END = rdrst.ResponsibleSchoolTypeIepServiceProvider
	LEFT JOIN RDS.DimSeas rds
		ON rsy.SessionEndDate BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimDataCollections rddc
		ON ske.DataCollectionName = rddc.DataCollectionName 
	LEFT JOIN RDS.DimDates entryDate
		ON ske.EnrollmentEntryDate = entryDate.DateValue
	LEFT JOIN RDS.DimDates exitDate
		ON ske.EnrollmentExitDate = exitDate.DateValue
	LEFT JOIN RDS.DimDates gradDate
		ON ske.ProjectedGraduationDate + '-01' = gradDate.DateValue
	LEFT JOIN #vwDimGradeLevels entryGrade
		ON ske.SchoolYear = entryGrade.SchoolYear
		AND ske.GradeLevel = entryGrade.GradeLevelMap
	LEFT JOIN RDS.DimSchoolYears cohortYear
		ON ske.CohortYear = cohortYear.SchoolYear
	LEFT JOIN RDS.DimSchoolYears gradCohortYear
		ON ske.CohortGraduationYear = gradCohortYear.SchoolYear
	LEFT JOIN RDS.DimDates countdate
		ON ISNULL(ske.RecordStartDateTime, '1/1/1900') = ISNULL(countDate.DateValue, '1/1/1900')
	WHERE @DataCollectionName IS NULL
		OR ske.DataCollectionName = @DataCollectionName

	CREATE UNIQUE CLUSTERED INDEX IX_Facts ON #Facts(StagingId) 

	-- Get the FIRST DimPersonId since there isn't an overlap between enrollment dates
	-- This means the enrollment dates are BEFORE the first recordstartdatetime in DimPeople
		UPDATE #Facts
	SET   K12StudentId = p.DimPersonId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN 
	( 
		SELECT 
			  DimPersonId
			, rdp.K12StudentStudentIdentifierState
			, ROW_NUMBER() OVER (PARTITION BY rdp.K12StudentStudentIdentifierState ORDER BY rdp.RecordStartDateTime)		AS RecNum
		FROM #Facts fact
		JOIN Staging.K12Enrollment ske
			ON fact.StagingId = ske.Id
		LEFT JOIN RDS.DimPeople rdp
			ON ske.StudentIdentifierState																			= rdp.K12StudentStudentIdentifierState
			AND ISNULL(ske.FirstName, 'MISSING')																	= ISNULL(rdp.FirstName, 'MISSING')
			AND ISNULL(ske.MiddleName, 'MISSING')																	= ISNULL(rdp.MiddleName, 'MISSING')
			AND ISNULL(ske.LastOrSurname, 'MISSING')																= ISNULL(rdp.LastOrSurname, 'MISSING')
			AND ISNULL(ske.Birthdate, '1/1/1900')																	= ISNULL(rdp.BirthDate, '1/1/1900')
		WHERE fact.K12StudentId IS NULL
	) p
		ON ske.StudentIdentifierState = p.K12StudentStudentIdentifierState
		AND p.RecNum = 1
	

	-- UPDATE Lea & School IDs if they're null
	UPDATE #Facts
	SET LeaAccountabilityId = rdlAcc.DimLeaId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN RDS.DimLeas rdlAcc
		ON ske.LeaIdentifierSeaAccountability = rdlAcc.LeaIdentifierSea
		AND ISNULL(ske.EnrollmentExitDate, rsy.SessionEndDate) BETWEEN rdlAcc.RecordStartDateTime AND ISNULL(rdlAcc.RecordEndDateTime, GETDATE())
	WHERE f.LeaAccountabilityId IS NULL

	UPDATE #Facts
	SET LeaAttendanceId = rdlAtt.DimLeaId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN RDS.DimLeas rdlAtt
		ON ske.LeaIdentifierSeaAttendance = rdlAtt.LeaIdentifierSea
		AND ISNULL(ske.EnrollmentExitDate, rsy.SessionEndDate) BETWEEN rdlAtt.RecordStartDateTime AND ISNULL(rdlAtt.RecordEndDateTime, GETDATE())
	WHERE f.LeaAttendanceId IS NULL

	UPDATE #Facts
	SET K12SchoolId = rdks.DimK12SchoolId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN RDS.DimK12Schools rdks
		ON ske.SchoolIdentifierSea = rdks.SchoolIdentifierSea
		AND ISNULL(ske.EnrollmentExitDate, rsy.SessionEndDate) BETWEEN rdks.RecordStartDateTime AND ISNULL(rdks.RecordEndDateTime, GETDATE())
	WHERE f.K12SchoolId IS NULL

	UPDATE #Facts
	SET K12SchoolId = rdks.DimK12SchoolId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN RDS.DimLeas rdlAcc
		ON f.LeaAccountabilityId = rdlAcc.DimLeaID
	LEFT JOIN RDS.DimLeas rdlAtt
		ON f.LeaAttendanceId = rdlAtt.DimLeaID
	LEFT JOIN RDS.DimK12Schools rdks
		ON f.K12SchoolId = rdks.DimK12SchoolId
	LEFT JOIN RDS.DimIeus rdi
		ON (ISNULL(rdks.IeuOrganizationIdentifierSea, 'MISSING') = rdi.IeuOrganizationIdentifierSea
			OR ISNULL(ISNULL(rdlAcc.IeuOrganizationIdentifierSea, rdlAtt.IeuOrganizationIdentifierSea), 'MISSING') = rdi.IeuOrganizationIdentifierSea)
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900') BETWEEN rdi.RecordStartDateTime AND ISNULL(rdi.RecordEndDateTime, GETDATE())

	UPDATE #Facts
	SET   K12DemographicId								= rdkd.DimK12DemographicId
		, K12EnrollmentStatusId							= rdkes.DimK12EnrollmentStatusId
		, HomelessnessStatusId							= rdhs.DimHomelessnessStatusId
		, StatusStartDateHomelessnessId					= rddhStart.DimDateId
		, StatusEndDateHomelessnessId					= rddhEnd.DimDateId 
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN Staging.PersonStatus homeless 
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(homeless.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(homeless.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(homeless.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(homeless.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(homeless.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(homeless.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(homeless.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')															= ISNULL(homeless.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')															= ISNULL(homeless.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')															= ISNULL(homeless.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN #vwDimK12Demographics rdkd
		ON ske.SchoolYear = rdkd.SchoolYear
		AND ISNULL(ske.Sex, 'MISSING')																			= ISNULL(rdkd.SexMap, rdkd.SexCode)
	LEFT JOIN #vwDimK12EnrollmentStatuses rdkes
		ON ske.SchoolYear = rdkes.SchoolYear
		AND ISNULL(ske.EnrollmentStatus, 'MISSING')																= ISNULL(rdkes.EnrollmentStatusMap, rdkes.EnrollmentStatusCode)
		AND ISNULL(ske.EntryType, 'MISSING')																	= ISNULL(rdkes.EntryTypeMap, rdkes.EntryTypeCode)
		AND ISNULL(ske.ExitOrWithdrawalType, 'MISSING')															= ISNULL(rdkes.ExitOrWithdrawalTypeMap, rdkes.ExitOrWithdrawalTypeCode)
		AND ISNULL(ske.PostSecondaryEnrollmentStatus, 'MISSING')												= ISNULL(rdkes.PostSecondaryEnrollmentStatusMap, rdkes.PostSecondaryEnrollmentStatusCode)
		AND rdkes.EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode											= 'MISSING'
		AND rdkes.EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode										= 'MISSING'
	LEFT JOIN #vwDimHomelessnessStatuses rdhs
		ON ske.SchoolYear																						= rdhs.SchoolYear
		AND ISNULL(CAST(homeless.HomelessnessStatus AS SMALLINT), -1)											= rdhs.HomelessnessStatusMap
		AND ISNULL(homeless.HomelessNightTimeResidence, 'MISSING')												= ISNULL(rdhs.HomelessPrimaryNighttimeResidenceMap, rdhs.HomelessPrimaryNighttimeResidenceCode)
		AND ISNULL(CAST(homeless.HomelessServicedIndicator AS SMALLINT), -1)									= rdhs.HomelessServicedIndicatorMap
		AND ISNULL(CAST(homeless.HomelessUnaccompaniedYouth AS SMALLINT), -1)									= rdhs.HomelessUnaccompaniedYouthStatusMap
	LEFT JOIN RDS.DimDates rddhStart
		ON homeless.Homelessness_StatusStartDate																		= rddhStart.DateValue
	LEFT JOIN RDS.DimDates rddhEnd
		ON homeless.Homelessness_StatusEndDate																		= rddhEnd.DateValue

		
	UPDATE #Facts
	SET   EconomicallyDisadvantagedStatusId				= rdeds.DimEconomicallyDisadvantagedStatusId
		, FosterCareStatusId							= rdfcs.DimFosterCareStatusId
		, ImmigrantStatusId								= rdimms.DimImmigrantStatusId
		, LanguageNativeId								= rdlNative.DimLanguageId
		, LanguageHomeId								= rdlHome.DimLanguageId
		, StatusStartDateEconomicallyDisadvantagedId	= rddedStart.DimDateId 
		, StatusEndDateEconomicallyDisadvantagedId		= rddedEnd.DimDateId 
		, StatusStartDateEnglishLearnerId				= rddelStart.DimDateId 
		, StatusEndDateEnglishLearnerId					= rddelEnd.DimDateId 
		, StatusStartDateMigrantId						= rddmStart.DimDateId 
		, StatusEndDateMigrantId						= rddmEnd.DimDateId 
		, StatusStartDateMilitaryConnectedStudentId		= rddmcStart.DimDateId 
		, StatusEndDateMilitaryConnectedStudentId		= rddmcEnd.DimDateId 
		, StatusStartDatePerkinsLepId					= rddplStart.DimDateId 
		, StatusEndDatePerkinsLepId						= rddplEnd.DimDateId 
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(sps.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(sps.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')															= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')															= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')															= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN #vwDimEconomicallyDisadvantagedStatuses rdeds
		ON ske.SchoolYear																						= rdeds.SchoolYear
		AND ISNULL(CAST(sps.EconomicDisadvantageStatus AS SMALLINT), -1)										= rdeds.EconomicDisadvantageStatusMap
		AND ISNULL(sps.EligibilityStatusForSchoolFoodServicePrograms, 'MISSING')								= ISNULL(rdeds.EligibilityStatusForSchoolFoodServiceProgramsMap, rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode)
		AND ISNULL(CAST(sps.NationalSchoolLunchProgramDirectCertificationIndicator AS SMALLINT), -1)			= rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap
	LEFT JOIN #vwDimFosterCareStatuses rdfcs
		ON ske.SchoolYear																						= rdfcs.SchoolYear
		AND ISNULL(CAST(sps.ProgramType_FosterCare AS SMALLINT), -1)											= rdfcs.ProgramParticipationFosterCareMap
	LEFT JOIN #vwDimImmigrantStatuses rdimms
		ON ske.SchoolYear																						= rdimms.SchoolYear
		AND ISNULL(CAST(sps.ProgramType_Immigrant AS SMALLINT), -1)												= rdimms.TitleIIIImmigrantStatusMap
		AND -1																									= rdimms.TitleIIIImmigrantParticipationStatusMap -- Where in Staging?
	LEFT JOIN RDS.DimLanguages rdlNative
		ON ISNULL(sps.ISO_639_2_NativeLanguage, 'MISSING')														= rdlNative.Iso6392LanguageCodeCode
	LEFT JOIN RDS.DimLanguages rdlHome
		ON ISNULL(sps.ISO_639_2_HomeLanguage, 'MISSING')														= rdlNative.Iso6392LanguageCodeCode
	LEFT JOIN RDS.DimDates rddedStart
		ON sps.EconomicDisadvantage_StatusStartDate																= rddedStart.DateValue
	LEFT JOIN RDS.DimDates rddedEnd
		ON sps.EconomicDisadvantage_StatusEndDate																= rddedEnd.DateValue
	LEFT JOIN RDS.DimDates rddelStart
		ON sps.EnglishLearner_StatusStartDate																	= rddelStart.DateValue
	LEFT JOIN RDS.DimDates rddelEnd
		ON sps.EnglishLearner_StatusEndDate																		= rddelEnd.DateValue
	LEFT JOIN RDS.DimDates rddmStart
		ON sps.Migrant_StatusStartDate																			= rddmStart.DateValue
	LEFT JOIN RDS.DimDates rddmEnd
		ON sps.Migrant_StatusEndDate																			= rddmEnd.DateValue
	LEFT JOIN RDS.DimDates rddmcStart
			ON sps.MilitaryConnected_StatusStartDate															= rddmcStart.DateValue
	LEFT JOIN RDS.DimDates rddmcEnd
		ON sps.MilitaryConnected_StatusEndDate																	= rddmcEnd.DateValue
	LEFT JOIN RDS.DimDates rddplStart
		ON sps.PerkinsEnglishLearnerStatus_StatusEndDate														= rddplStart.DateValue
	LEFT JOIN RDS.DimDates rddplEnd
		ON sps.PerkinsEnglishLearnerStatus_StatusStartDate														= rddplEnd.DateValue


	UPDATE #Facts
	SET   IdeaStatusId									= rdis.DimIdeaStatusId
		, PrimaryDisabilityTypeId						= rdidtPrimary.DimIdeaDisabilityTypeId
		, SecondaryDisabilityTypeId						= rdidtSecondary.DimIdeaDisabilityTypeId
		, StatusStartDateIdeaId							= rddiStart.DimDateId 
		, StatusEndDateIdeaId							= rddiEnd.DimDateId 
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN Staging.ProgramParticipationSpecialEducation sppse
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sppse.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sppse.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sppse.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sppse.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sppse.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sppse.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(sppse.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(sppse.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sppse.StudentIdentifierState, '')
	JOIN Staging.IdeaDisabilityType sidt	
		ON ske.SchoolYear = sidt.SchoolYear
		AND sidt.StudentIdentifierState = sppse.StudentIdentifierState
		AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
	JOIN #vwDimIdeaStatuses rdis
		ON ske.SchoolYear = rdis.SchoolYear
		AND ISNULL(CAST(sppse.IDEAIndicator AS SMALLINT), -1)													= rdis.IdeaIndicatorMap
		AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood, 'MISSING')								= ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
		AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge, 'MISSING')										= ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
		AND ISNULL(sppse.SpecialEducationExitReason, 'MISSING')													= ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode) 
	LEFT JOIN #vwDimIdeaDisabilityTypes rdidtPrimary
		ON ske.SchoolYear																						= rdidtPrimary.SchoolYear
		AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING')														= ISNULL(rdidtPrimary.IdeaDisabilityTypeMap, rdidtPrimary.IdeaDisabilityTypeCode)
		AND sidt.IsPrimaryDisability																			= 1
	LEFT JOIN #vwDimIdeaDisabilityTypes rdidtSecondary
		ON ske.SchoolYear																						= rdidtSecondary.SchoolYear
		AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING')														= ISNULL(rdidtPrimary.IdeaDisabilityTypeMap, rdidtPrimary.IdeaDisabilityTypeCode)
		AND sidt.IsSecondaryDisability																			= 1
	LEFT JOIN RDS.DimDates rddiStart
		ON sppse.ProgramParticipationBeginDate																	= rddiStart.DateValue
	LEFT JOIN RDS.DimDates rddiEnd
		ON sppse.ProgramParticipationEndDate																	= rddiEnd.DateValue


	UPDATE #Facts
	SET  CteStatusId									= rdcs.DimCteStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN Staging.ProgramParticipationCte sppc
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sppc.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sppc.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sppc.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sppc.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sppc.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sppc.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sppc.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(sppc.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(sppc.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sppc.StudentIdentifierState, '')
	JOIN RDS.vwDimCteStatuses rdcs
		ON ske.SchoolYear = rdcs.SchoolYear
		AND ISNULL(CAST(sppc.DisplacedHomeMakerIndicator AS SMALLINT), -1) = CteAeDisplacedHomemakerIndicatorMap
		AND ISNULL(CAST(sppc.NonTraditionalGenderStatus AS SMALLINT), -1) = CteNontraditionalGenderStatusMap
		AND -1 = CteNontraditionalCompletionMap
		AND ISNULL(CAST(sppc.SingleParentIndicator AS SMALLINT), -1) = SingleParentOrSinglePregnantWomanStatusMap
		AND ISNULL(CAST(sppc.CteParticipant AS SMALLINT), -1) = CteParticipantMap
		AND ISNULL(CAST(sppc.CteConcentrator AS SMALLINT), -1) = CteConcentratorMap


	UPDATE #Facts
	SET  MigrantStatusId									= rdms.DimMigrantStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN Staging.Migrant sm
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sm.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sm.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sm.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sm.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sm.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sm.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sm.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sm.StudentIdentifierState, '')
	LEFT JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(sps.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(sps.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')															= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')															= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')															= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN #vwDimMigrantStatuses rdms
		ON ske.SchoolYear = rdms.SchoolYear
		AND ISNULL(CAST(sps.MigrantStatus AS SMALLINT), -1)														= rdms.MigrantStatusMap
		AND rdms.MigrantEducationProgramEnrollmentTypeCode														= 'MISSING'
		AND rdms.ContinuationOfServicesReasonCode																= 'MISSING'
		AND rdms.MigrantEducationProgramServicesTypeCode														= 'MISSING'
		AND rdms.MigrantPrioritizedForServicesMap																= -1

	UPDATE #Facts
	SET   EnglishLearnerStatusId							= rdels.DimEnglishLearnerStatusId
		, TitleIIIStatusId									= rdtiiis.DimTitleIIIStatusId
		, StatusStartDateTitleIIIImmigrantId				= rddtiiiStart.DimDateId             
		, StatusEndDateTitleIIIImmigrantId					= rddtiiiEnd.DimDateId            
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(sps.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(sps.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')															= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')															= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')															= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN Staging.ProgramParticipationTitleIII spptiii
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(spptiii.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(spptiii.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(spptiii.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(spptiii.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(spptiii.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(spptiii.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(spptiii.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(spptiii.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(spptiii.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(spptiii.StudentIdentifierState, '')
	LEFT JOIN #vwDimEnglishLearnerStatuses rdels
		ON ske.SchoolYear																						= rdels.SchoolYear
		AND ISNULL(sps.EnglishLearnerStatus, -1)																= rdels.EnglishLearnerStatusMap
		AND ISNULL(sps.PerkinsEnglishLearnerStatus, -1)															= rdels.PerkinsEnglishLearnerStatusMap
	LEFT JOIN #vwDimTitleIIIStatuses rdtiiis
		ON ske.SchoolYear																						= rdtiiis.SchoolYear
		AND ISNULL(CAST(spptiii.TitleIiiImmigrantStatus AS SMALLINT), -1)										= rdtiiis.ProgramParticipationTitleIIILiepMap 
		AND ISNULL(spptiii.Proficiency_TitleIII, 'MISSING')														= ISNULL(rdtiiis.ProficiencyStatusMap, rdtiiis.ProficiencyStatusCode)
		AND ISNULL(spptiii.TitleIIIAccountabilityProgressStatus, 'MISSING')										= ISNULL(rdtiiis.TitleIIIAccountabilityProgressStatusMap, rdtiiis.TitleIIIAccountabilityProgressStatusCode)
		AND ISNULL(spptiii.TitleIIILanguageInstructionProgramType, 'MISSING')									= ISNULL(rdtiiis.TitleIIILanguageInstructionProgramTypeMap, rdtiiis.TitleIIILanguageInstructionProgramTypeCode)
	LEFT JOIN RDS.DimDates rddtiiiStart
		ON spptiii.ProgramParticipationBeginDate																= rddtiiiStart.DateValue
	LEFT JOIN RDS.DimDates rddtiiiEnd
		ON spptiii.ProgramParticipationEndDate																	= rddtiiiEnd.DateValue

	UPDATE #Facts
	SET   MilitaryStatusId								= rdmil.DimMilitaryStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)														= ISNULL(sps.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)													= ISNULL(sps.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')															= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')															= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')															= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN Staging.Military sm
		ON ISNULL(ske.DataCollectionName, '')																	= ISNULL(sm.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')														= ISNULL(sm.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')															= ISNULL(sm.LeaIdentifierSeaAttendance, '')
		AND ISNULL(ske.LeaIdentifierSeaFunding, '')																= ISNULL(sm.LeaIdentifierSeaFunding, '')
		AND ISNULL(ske.LeaIdentifierSeaGraduation, '')															= ISNULL(sm.LeaIdentifierSeaGraduation, '')
		AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')										= ISNULL(sm.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')																	= ISNULL(sm.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')																= ISNULL(sm.StudentIdentifierState, '')
	JOIN #vwDimMilitaryStatuses rdmil
		ON ske.SchoolYear = rdmil.SchoolYear
		AND ISNULL(sps.MilitaryConnectedStudentIndicator, 'MISSING')											= ISNULL(rdmil.MilitaryConnectedStudentIndicatorMap, rdmil.MilitaryConnectedStudentIndicatorCode)
		AND ISNULL(sm.MilitaryActiveStudentIndicator, 'MISSING')												= ISNULL(rdmil.MilitaryActiveStudentIndicatorMap, rdmil.MilitaryActiveStudentIndicatorCode)
		AND ISNULL(sm.MilitaryBranch, 'MISSING')																= ISNULL(rdmil.MilitaryBranchMap, rdmil.MilitaryBranchCode)
		AND ISNULL(sm.MilitaryVeteranStudentIndicator, 'MISSING')												= ISNULL(rdmil.MilitaryVeteranStudentIndicatorMap, rdmil.MilitaryVeteranStudentIndicatorCode)

	
	UPDATE #Facts
	SET   EducationOrganizationNetworkId = rdeon.DimEducationOrganizationNetworkId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN RDS.DimEducationOrganizationNetworks rdeon
		ON ske.EducationOrganizationNetworkIdentifierSea														= rdeon.OrganizationIdentifierSea
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')															BETWEEN ISNULL(rdeon.RecordStartDateTime, '1/1/1900') AND ISNULL(rdeon.RecordEndDateTime, GETDATE())

	
	INSERT INTO RDS.FactK12StudentEnrollments	
	(
		  [SchoolYearId]                                  
		, [DataCollectionId]                    
		, [CountDateId]
		, [SeaId]                                         
		, [IeuId]                                         
		, [LeaAccountabilityId]                           
		, [LeaAttendanceId]                               
		, [LeaFundingId]                                  
		, [LeaGraduationID]                               
		, [LeaIndividualizedEducationProgramId]           
		, [LeaMembershipResidentId]
		, [K12SchoolId]                        
		, [ResponsibleSchoolTypeId]
		, [EducationOrganizationNetworkId]                
		, [K12StudentId]                                  
		, [CohortGraduationYearId]                                  
		, [CohortYearId]                                  
		, [CteStatusId]                                   
		, [EntryGradeLevelId]                             
		, [ExitGradeLevelId]                              
		, [EnrollmentEntryDateId]                         
		, [EnrollmentExitDateId]                          
		, [EnglishLearnerStatusId]                        
		, [K12EnrollmentStatusId]                         
		, [K12DemographicId]                              
		, [IdeaStatusId]                                  
		, [HomelessnessStatusId]                          
		, [EconomicallyDisadvantagedStatusId]             
		, [FosterCareStatusId]                            
		, [ImmigrantStatusId]                             
		, [LanguageHomeId]                                
		, [LanguageNativeId]                              
		, [MigrantStatusId]                               
		, [MilitaryStatusId]                              
		, [NOrDStatusId]                                  
		, [PrimaryDisabilityTypeId]                       
		, [SecondaryDisabilityTypeId]                     
		, [ProjectedGraduationDateId]                     
		, [StatusStartDateEconomicallyDisadvantagedId]    
		, [StatusEndDateEconomicallyDisadvantagedId]      
		, [StatusStartDateEnglishLearnerId]               
		, [StatusEndDateEnglishLearnerId]                 
		, [StatusStartDateHomelessnessId]                 
		, [StatusEndDateHomelessnessId]                   
		, [StatusStartDateIdeaId]                         
		, [StatusEndDateIdeaId]                           
		, [StatusStartDateMigrantId]                      
		, [StatusEndDateMigrantId]                        
		, [StatusStartDateMilitaryConnectedStudentId]     
		, [StatusEndDateMilitaryConnectedStudentId]       
		, [StatusStartDatePerkinsEnglishLearnerId] 
		, [StatusEndDatePerkinsEnglishLearnerId]        
		, [StatusEndDateTitleIIIImmigrantId]              
		, [StatusStartDateTitleIIIImmigrantId]            
		, [TitleIIIStatusId]                              
		, [FullTimeEquivalency]                           
		, [StudentCount]                                  
	)
	SELECT
		  ISNULL([SchoolYearId]                                  , -1)
		, ISNULL([DataCollectionId]                              , -1)
		, ISNULL([CountDateId]									 , -1)
		, ISNULL([SeaId]                                         , -1)
		, ISNULL([IeuId]                                         , -1)
		, ISNULL([LeaAccountabilityId]                           , -1)
		, ISNULL([LeaAttendanceId]                               , -1)
		, ISNULL([LeaFundingId]                                  , -1)
		, ISNULL([LeaGraduationID]                               , -1)
		, ISNULL([LeaIndividualizedEducationProgramId]           , -1)
		, ISNULL([LeaMembershipResidentId]						 , -1)
		, ISNULL([K12SchoolId]									 , -1)
		, ISNULL([ResponsibleSchoolTypeId]						 , -1)
		, ISNULL([EducationOrganizationNetworkId]                , -1)
		, ISNULL([K12StudentId]                                  , -1)
		, ISNULL([CohortGraduationYearId]                        , -1)          
		, ISNULL([CohortYearId]                                  , -1)
		, ISNULL([CteStatusId]                                   , -1)
		, ISNULL([EntryGradeLevelId]                             , -1)
		, ISNULL([ExitGradeLevelId]                              , -1)
		, ISNULL([EnrollmentEntryDateId]                         , -1)
		, ISNULL([EnrollmentExitDateId]                          , -1)
		, ISNULL([EnglishLearnerStatusId]                        , -1)
		, ISNULL([K12EnrollmentStatusId]                         , -1)
		, ISNULL([K12DemographicId]                              , -1)
		, ISNULL([IdeaStatusId]                                  , -1)
		, ISNULL([HomelessnessStatusId]                          , -1)
		, ISNULL([EconomicallyDisadvantagedStatusId]             , -1)
		, ISNULL([FosterCareStatusId]                            , -1)
		, ISNULL([ImmigrantStatusId]                             , -1)
		, ISNULL([LanguageHomeId]                                , -1)
		, ISNULL([LanguageNativeId]                              , -1)
		, ISNULL([MigrantStatusId]                               , -1)
		, ISNULL([MilitaryStatusId]                              , -1)
		, ISNULL([NOrDStatusId]                                  , -1)
		, ISNULL([PrimaryDisabilityTypeId]                       , -1)
		, ISNULL([SecondaryDisabilityTypeId]                     , -1)
		, ISNULL([ProjectedGraduationDateId]                     , -1)
		, ISNULL([StatusStartDateEconomicallyDisadvantagedId]    , -1)
		, ISNULL([StatusEndDateEconomicallyDisadvantagedId]      , -1)
		, ISNULL([StatusStartDateEnglishLearnerId]               , -1)
		, ISNULL([StatusEndDateEnglishLearnerId]                 , -1)
		, ISNULL([StatusStartDateHomelessnessId]                 , -1)
		, ISNULL([StatusEndDateHomelessnessId]                   , -1)
		, ISNULL([StatusStartDateIdeaId]                         , -1)
		, ISNULL([StatusEndDateIdeaId]                           , -1)
		, ISNULL([StatusStartDateMigrantId]                      , -1)
		, ISNULL([StatusEndDateMigrantId]                        , -1)
		, ISNULL([StatusStartDateMilitaryConnectedStudentId]     , -1)
		, ISNULL([StatusEndDateMilitaryConnectedStudentId]       , -1)
		, ISNULL([StatusStartDatePerkinsLepId]                   , -1)
		, ISNULL([StatusEndDatePerkinsLepId]                     , -1)
		, ISNULL([StatusEndDateTitleIIIImmigrantId]              , -1)
		, ISNULL([StatusStartDateTitleIIIImmigrantId]            , -1)
		, ISNULL([TitleIIIStatusId]                              , -1)
		, [FullTimeEquivalency]                           
		, 1											as [StudentCount]										
	FROM #Facts

	DROP TABLE IF EXISTS #temp

	SELECT DISTINCT
		  rfkse.FactK12StudentEnrollmentId
		, ske.SchoolYear
		, ISNULL(skpr.RaceType,'MISSING') as RaceType
		, ISNULL(ske.HispanicLatinoEthnicity,0) as HispanicLatinoEthnicity
		--, ISNULL(rdr.DimRaceId, -1) as DimRaceId
	INTO #temp
	FROM RDS.FactK12StudentEnrollments rfkse
	JOIN RDS.DimSchoolYears rdsy
		ON rfkse.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfkse.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfkse.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfkse.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfkse.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfkse.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfkse.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfkse.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDates countDate
		ON rfkse.CountDateId = countDate.DimDateId
	JOIN RDS.DimDates entryDate
		ON rfkse.EnrollmentEntryDateId = entryDate.DimDateId
	JOIN RDS.DimDates exitDate
		ON rfkse.EnrollmentExitDateId = exitDate.DimDateId
	JOIN RDS.DimDataCollections rddc
		ON rfkse.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	JOIN RDS.DimResponsibleSchoolTypes rdrst
		ON rfkse.ResponsibleSchoolTypeId = rdrst.DimResponsibleSchoolTypeId
	LEFT JOIN Staging.K12Enrollment ske
		ON rdp.K12StudentStudentIdentifierState = ske.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '') = ISNULL(ske.SchoolIdentifierSea, '')
		AND CASE rdrst.ResponsibleSchoolTypeAttendance WHEN 'Yes' THEN 1 ELSE 0 END = ISNULL(ske.ResponsibleSchoolTypeAttendance, 0)
		AND CASE rdrst.ResponsibleSchoolTypeAccountability WHEN 'Yes' THEN 1 ELSE 0 END = ISNULL(ske.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaAttendance, '')
		AND ISNULL(rdlsFun.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaFunding, '')
		AND ISNULL(rdlsGrad.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaGraduation, '')
		AND ISNULL(rdlsIep.LeaIdentifierSea, '') = ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')
		--AND ske.HispanicLatinoEthnicity = 1
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(ske.DataCollectionName, '')
		AND ISNULL(countDate.DateValue, '1/1/1900') = ISNULL(ske.RecordStartDateTime, '1/1/1900')
		AND ISNULL(entryDate.DateValue, '1/1/1900') = ISNULL(ske.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(exitDate.DateValue, '1/1/1900') = ISNULL(ske.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN Staging.K12PersonRace skpr
		ON rdp.K12StudentStudentIdentifierState = skpr.StudentIdentifierState
		AND ISNULL(ske.ResponsibleSchoolTypeAttendance, 0) = ISNULL(skpr.ResponsibleSchoolTypeAttendance, 0)
		AND ISNULL(ske.ResponsibleSchoolTypeAccountability, 0) = ISNULL(skpr.ResponsibleSchoolTypeAccountability, 0)
		AND	ISNULL(rdks.SchoolIdentifierSea, '') = ISNULL(skpr.SchoolIdentifierSea, '')
		AND	ISNULL(rdlsAcc.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaAttendance, '')
		AND ISNULL(rdlsFun.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaFunding, '')
		AND ISNULL(rdlsGrad.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaGraduation, '')
		AND ISNULL(rdlsIep.LeaIdentifierSea, '') = ISNULL(skpr.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(skpr.DataCollectionName, '')
		AND ISNULL(countDate.DateValue, '1/1/1900')	= ISNULL(skpr.RecordStartDateTime, '1/1/1900')
		AND ISNULL(skpr.EnrollmentEntryDate, '1/1/1900') = ISNULL(ske.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(skpr.EnrollmentExitDate, '1/1/1900') = ISNULL(ske.EnrollmentExitDate, '1/1/1900')

	Insert Into RDS.BridgeK12StudentEnrollmentRaces
			(
			[FactK12StudentEnrollmentId]       
			, [RaceId]                          
			)
	Select distinct t.FactK12StudentEnrollmentId,rdr.DimRaceId From #temp t 
		join RDS.vwDimRaces rdr
			on t.SchoolYear=rdr.SchoolYear
				and Case When t.RaceType = 'MISSING' and t.HispanicLatinoEthnicity = 0 Then 'Race and Ethnicity Unknown'
						When t.RaceType = 'MISSING' and t.HispanicLatinoEthnicity = 1 Then 'HispanicorLatinoEthnicity'
					Else t.RaceType End = rdr.RaceMap


	INSERT INTO RDS.BridgeK12StudentEnrollmentIdeaDisabilityTypes
		(
			  [FactK12StudentEnrollmentId]       
			, [IdeaDisabilityTypeId]
		)
	SELECT DISTINCT
		  rfkse.FactK12StudentEnrollmentId
		, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)
	FROM RDS.FactK12StudentEnrollments rfkse
	JOIN RDS.DimSchoolYears rdsy
		ON rfkse.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfkse.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfkse.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfkse.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfkse.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfkse.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfkse.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfkse.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDates countDate
		ON rfkse.CountDateId = countDate.DimDateId
	JOIN RDS.DimDataCollections rddc
		ON rfkse.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	JOIN RDS.DimResponsibleSchoolTypes rdrst
		ON rfkse.ResponsibleSchoolTypeId = rdrst.DimResponsibleSchoolTypeId
	LEFT JOIN Staging.IdeaDisabilityType sidt
		ON rdp.K12StudentStudentIdentifierState = sidt.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '') = ISNULL(sidt.SchoolIdentifierSea, '')
		AND CASE rdrst.ResponsibleSchoolTypeAttendance WHEN 'Yes' THEN 1 ELSE 0 END  = ISNULL(sidt.ResponsibleSchoolTypeAttendance, 0)
		AND CASE rdrst.ResponsibleSchoolTypeAccountability WHEN 'Yes' THEN 1 ELSE 0 END  = ISNULL(sidt.ResponsibleSchoolTypeAccountability, 0)
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(rdlsFun.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaFunding, '')
		--AND ISNULL(rdlsGrad.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(rdlsIep.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(sidt.DataCollectionName, '')
		AND ISNULL(countDate.DateValue, '1/1/1900')	BETWEEN ISNULL(sidt.RecordStartDateTime, '1/1/1900') AND ISNULL(sidt.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
		ON sidt.SchoolYear = rdidt.SchoolYear
		AND sidt.IdeaDisabilityTypeCode = rdidt.IdeaDisabilityTypeMap

	DROP TABLE IF EXISTS #temp
	
	INSERT INTO RDS.BridgeK12StudentEnrollmentPersonAddresses
		(
			  [FactK12StudentEnrollmentId]       
			, [PersonAddressId]
		)
	SELECT DISTINCT
		  rfkse.FactK12StudentEnrollmentId
		, ISNULL(rdpa.DimPersonAddressId, -1)
	FROM RDS.FactK12StudentEnrollments rfkse
	JOIN RDS.DimSchoolYears rdsy
		ON rfkse.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfkse.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfkse.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfkse.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfkse.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfkse.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfkse.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfkse.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDates countDate
		ON rfkse.CountDateId = countDate.DimDateId
	JOIN RDS.DimDataCollections rddc
		ON rfkse.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	LEFT JOIN Staging.K12StudentAddress sksa
		ON rdp.K12StudentStudentIdentifierState = sksa.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '') = ISNULL(sksa.SchoolIdentifierSea, '')
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '') = ISNULL(sksa.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '') = ISNULL(sksa.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(rdlsFun.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaFunding, '')
		--AND ISNULL(rdlsGrad.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(rdlsIep.LeaIdentifierSea, '') = ISNULL(sidt.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(sksa.DataCollectionName, '')
		AND ISNULL(countDate.DateValue, '1/1/1900')	BETWEEN ISNULL(sksa.RecordStartDateTime, '1/1/1900') AND ISNULL(sksa.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimPersonAddresses rdpa
		ON  ISNULL(sksa.AddressApartmentRoomOrSuite, '')					= ISNULL(rdpa.AddressStreetNumberAndName , '')
		AND ISNULL(sksa.AddressCity, '')									= ISNULL(rdpa.AddressCity , '')
		AND ISNULL(sksa.StateAbbreviation, '')								= ISNULL(rdpa.StateAbbreviationCode , '')
		AND ISNULL(sksa.AddressPostalCode, '')								= ISNULL(rdpa.AddressPostalCode, '')
		AND ISNULL(sksa.CountyAnsiCode, '')									= ISNULL(rdpa.CountyAnsiCodeCode, '')
		AND ISNULL(sksa.CountryCode, '')									= ISNULL(rdpa.CountryCodeCode, '')
		AND ISNULL(sksa.Latitude, '')										= ISNULL(rdpa.Latitude, '')
		AND ISNULL(sksa.Longitude, '')										= ISNULL(rdpa.Longitude, '')