
CREATE PROCEDURE [Staging].[Staging-To-FactSpecialEducation]
	@DataCollectionName	VARCHAR(60) = NULL
AS
BEGIN

	SET NOCOUNT ON
	
	DROP TABLE IF EXISTS #SchoolYears
	SELECT DISTINCT SchoolYear INTO #SchoolYears FROM Staging.K12Enrollment

	--ALTER INDEX ALL ON RDS.FactK12StudentEnrollments DISABLE
	DROP TABLE IF EXISTS #vwDimK12Demographics
	SELECT v.* INTO #vwDimK12Demographics FROM RDS.vwDimK12Demographics v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimK12Demographics ON #vwDimK12Demographics(SchoolYear, SexMap) INCLUDE (SexCode)

	DROP TABLE IF EXISTS #vwDimIdeaStatuses
	SELECT v.* INTO #vwDimIdeaStatuses FROM RDS.vwDimIdeaStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimIdeaStatuses ON #vwDimIdeaStatuses(SchoolYear, IdeaIndicatorMap, IdeaEducationalEnvironmentForEarlyChildhoodMap, IdeaEducationalEnvironmentForSchoolAgeMap, SpecialEducationExitReasonMap) INCLUDE (IdeaEducationalEnvironmentForEarlyChildhoodCode, IdeaEducationalEnvironmentForSchoolAgeCode, SpecialEducationExitReasonCode)

	DROP TABLE IF EXISTS #vwDimEnglishLearnerStatuses
	SELECT v.* INTO #vwDimEnglishLearnerStatuses FROM RDS.vwDimEnglishLearnerStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimEnglishLearnerStatuses ON #vwDimEnglishLearnerStatuses(SchoolYear, EnglishLearnerStatusMap, PerkinsLEPStatusMap, TitleIIIAccountabilityProgressStatusMap, TitleIIILanguageInstructionProgramTypeMap) INCLUDE (EnglishLearnerStatusCode, PerkinsLEPStatusCode, TitleIIIAccountabilityProgressStatusCode, TitleIIILanguageInstructionProgramTypeCode)

	DROP TABLE IF EXISTS #vwDimGradeLevels
	SELECT v.* INTO #vwDimGradeLevels FROM RDS.vwDimGradeLevels  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear WHERE GradeLevelTypeDescription = 'Entry Grade Level' 
	CREATE INDEX IX_vwDimGradeLevels ON #vwDimGradeLevels(SchoolYear, GradeLevelMap) INCLUDE (GradeLevelCode)

	DROP TABLE IF EXISTS #vwDimHomelessnessStatuses
	SELECT v.* INTO #vwDimHomelessnessStatuses FROM RDS.vwDimHomelessnessStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimHomelessnessStatuses ON #vwDimHomelessnessStatuses(SchoolYear, HomelessnessStatusMap, HomelessPrimaryNighttimeResidenceMap, HomelessServicedIndicatorMap, HomelessUnaccompaniedYouthStatusMap) INCLUDE (HomelessnessStatusCode, HomelessPrimaryNighttimeResidenceCode, HomelessServicedIndicatorCode, HomelessUnaccompaniedYouthStatusCode)

	DROP TABLE IF EXISTS #vwDimEconomicallyDisadvantagedStatuses
	SELECT v.* INTO #vwDimEconomicallyDisadvantagedStatuses FROM RDS.vwDimEconomicallyDisadvantagedStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimEconomicallyDisadvantagedStatuses ON #vwDimEconomicallyDisadvantagedStatuses(SchoolYear, EconomicDisadvantageStatusMap, EligibilityStatusForSchoolFoodServiceProgramsMap, NationalSchoolLunchProgramDirectCertificationIndicatorMap) INCLUDE (EconomicDisadvantageStatusCode, EligibilityStatusForSchoolFoodServiceProgramsCode, NationalSchoolLunchProgramDirectCertificationIndicatorCode)

	DROP TABLE IF EXISTS #vwDimFosterCareStatuses
	SELECT v.* INTO #vwDimFosterCareStatuses FROM RDS.vwDimFosterCareStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimFosterCareStatuses ON #vwDimFosterCareStatuses(SchoolYear, ProgramParticipationFosterCareMap) INCLUDE (ProgramParticipationFosterCareCode)

	DROP TABLE IF EXISTS #vwDimImmigrantStatuses
	SELECT v.* INTO #vwDimImmigrantStatuses FROM RDS.vwDimImmigrantStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimImmigrantStatuses ON #vwDimImmigrantStatuses(SchoolYear, TitleIIIImmigrantStatusMap, TitleIIIImmigrantParticipationStatusMap) INCLUDE (TitleIIIImmigrantStatusCode, TitleIIIImmigrantParticipationStatusCode)

	DROP TABLE IF EXISTS #vwDimMigrantStatuses
	SELECT v.* INTO #vwDimMigrantStatuses FROM RDS.vwDimMigrantStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimMigrantStatuses ON #vwDimMigrantStatuses(SchoolYear, MigrantStatusMap, MigrantEducationProgramEnrollmentTypeMap, ContinuationOfServicesReasonMap, MigrantEducationProgramServicesTypeMap, MigrantPrioritizedForServicesMap) INCLUDE (MigrantStatusCode, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode)

	DROP TABLE IF EXISTS #vwDimMilitaryStatuses
	SELECT v.* INTO #vwDimMilitaryStatuses FROM RDS.vwDimMilitaryStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimMilitaryStatuses ON #vwDimMilitaryStatuses(SchoolYear, MilitaryConnectedStudentIndicatorMap, MilitaryActiveStudentIndicatorMap, MilitaryBranchMap, MilitaryVeteranStudentIndicatorMap) INCLUDE (MilitaryConnectedStudentIndicatorCode, MilitaryActiveStudentIndicatorCode, MilitaryBranchCode, MilitaryVeteranStudentIndicatorCode)

	DROP TABLE IF EXISTS #vwDimIdeaDisabilityTypes
	SELECT v.* INTO #vwDimIdeaDisabilityTypes FROM RDS.vwDimIdeaDisabilityTypes  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimIdeaDisabilityTypes ON #vwDimIdeaDisabilityTypes(SchoolYear, IdeaDisabilityTypeMap) INCLUDE (IdeaDisabilityTypeCode)

	DROP TABLE IF EXISTS #vwDimTitleIIIStatuses
	SELECT v.* INTO #vwDimTitleIIIStatuses FROM RDS.vwDimTitleIIIStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimTitleIIIStatuses ON #vwDimTitleIIIStatuses(SchoolYear, TitleIIIProgramParticipationMap, FormerEnglishLearnerYearStatusMap, ProficiencyStatusMap) INCLUDE (TitleIIIProgramParticipationCode, FormerEnglishLearnerYearStatusCode, ProficiencyStatusCode)

	DROP TABLE IF EXISTS #vwDimDisabilityStatuses
	SELECT v.* INTO #vwDimDisabilityStatuses FROM RDS.vwDimDisabilityStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimDisabilityStatuses ON #vwDimDisabilityStatuses(SchoolYear, DisabilityStatusMap, Section504StatusMap, DisabilityConditionTypeMap, DisabilityDeterminationSourceTypeMap) INCLUDE (DisabilityStatusCode, DisabilityConditionTypeCode, DisabilityDeterminationSourceTypeCode)

	DROP TABLE IF EXISTS #vwDimIndividualizedProgramStatuses
	SELECT v.* INTO #vwDimIndividualizedProgramStatuses FROM RDS.vwDimIndividualizedProgramStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimIndividualizedProgramStatuses ON #vwDimIndividualizedProgramStatuses(SchoolYear, IndividualizedProgramTypeMap, StudentSupportServiceTypeMap) INCLUDE (IndividualizedProgramTypeCode, StudentSupportServiceTypeCode)

	DROP TABLE IF EXISTS #vwDimChildOutcomeSummaries
	SELECT v.* INTO #vwDimChildOutcomeSummaries FROM RDS.vwDimChildOutcomeSummaries  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimChildOutcomeSummaries ON #vwDimChildOutcomeSummaries(SchoolYear, COSRatingAMap, COSRatingBMap, COSRatingCMap, COSProgressAIndicatorMap, COSProgressBIndicatorMap, COSProgressCIndicatorMap) 
				INCLUDE (COSRatingACode, COSRatingBCode, COSRatingCCode, COSProgressAIndicatorCode, COSProgressBIndicatorCode, COSProgressCIndicatorCode)
	
	DROP TABLE IF EXISTS #vwDimK12EnrollmentStatuses
	SELECT v.* INTO #vwDimK12EnrollmentStatuses FROM RDS.vwDimK12EnrollmentStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE INDEX IX_vwDimK12EnrollmentStatuses ON #vwDimK12EnrollmentStatuses(SchoolYear, EnrollmentStatusMap, EntryTypeMap, ExitOrWithdrawalTypeMap) INCLUDE (EnrollmentStatusCode, EntryTypeCode, ExitOrWithdrawalTypeCode)

	DROP TABLE IF EXISTS #Facts
	CREATE TABLE #Facts (
			  [StagingId]											INT NOT NULL
			, [SchoolYearId]										INT NULL
			, [DataCollectionId]									INT NULL
			, [CountDateId]											INT NULL
			, [SeaId]												INT NULL
			, [IeuId]												INT NULL
			, [LeaAccountabilityId]									INT NULL
			, [LeaAttendanceId]										INT NULL
			, [LeaFundingId]										INT NULL
			, [LeaGraduationID]										INT NULL
			, [LeaIndividualizedEducationProgramId]					INT NULL
			, [K12SchoolId]											INT NULL
			, [ResponsibleSchoolTypeId]								INT NULL          
			, [K12StudentId]										INT NULL
			, [EnrollmentEntryDateId]								INT NULL
			, [EnrollmentExitDateId]								INT NULL
			, [ConsentToEvaluationDateId]							INT NULL
			, [ChildOutcomeSummaryBaselineId]						INT NULL 
			, [ChildOutcomeSummaryAtExitId]							INT NULL 
			, [ChildOutcomeSummaryDateBaselineId]					INT NULL	
			, [ChildOutcomeSummaryDateAtExitId]						INT NULL
			, [DisabilityStatusId]									INT NULL
			, [CteStatusId]											INT NULL
			, [EconomicallyDisadvantagedStatusId]					INT NULL
			, [EnglishLearnerStatusId]								INT NULL
			, [EntryGradeLevelId]									INT NULL
			, [EligibilityEvaluationDateInitialId]					INT NULL
			, [EligibilityEvaluationDateReevaluationId]				INT NULL
			, [FosterCareStatusId]									INT NULL
			, [HomelessnessStatusId]								INT NULL
			, [IdeaStatusId]										INT NULL
			, [ImmigrantStatusId]									INT NULL
			, [IndividualizedProgramStatusId]						INT NULL
			, [IndividualizedProgramServicePlanDateId]				INT NULL
			, [IndividualizedProgramServicePlanReevaluationDateId]	INT NULL
			, [IndividualizedProgramServicePlanExitDateId]			INT NULL
			, [IndividualizedProgramDateId]							INT NULL
			, [K12EnrollmentStatusId]								INT NULL
			, [K12DemographicId]									INT NULL
			, [MigrantStatusId]										INT NULL
			, [MilitaryStatusId]									INT NULL
			, [NOrDStatusId]										INT NULL
			, [ProgramParticipationStartDateId]						INT NULL
			, [PrimaryDisabilityTypeId]								INT NULL
			, [SecondaryDisabilityTypeId]							INT NULL
			, [SpecialEducationServicesExitDateId]					INT NULL
			, [TitleIIIStatusId]									INT NULL
			, [FullTimeEquivalency]									DECIMAL(5,2) NULL
			, [SpecialEducationFTE]									DECIMAL(5,2) NULL
			, [StudentCount]										INT NULL
			)

	INSERT INTO #Facts (
		  [StagingId]
		, [SchoolYearId]                         
		, [DataCollectionId]  
		, [CountDateId]
		, [SeaId]                                
		, [IeuId]                                
		, [LeaAccountabilityId]                  
		, [LeaAttendanceId]                      
		, [LeaFundingId]                         
		, [LeaGraduationID]                      
		, [LeaIndividualizedEducationProgramId]  
		, [K12SchoolId]		
		--, [ResponsibleSchoolTypeId]	
		, [K12StudentId]    
		--, [K12EnrollmentStatusId]
		, [EntryGradeLevelId]                             
		, [EnrollmentEntryDateId]                         
		, [EnrollmentExitDateId]    
		, [ProgramParticipationStartDateId]	
		, [SpecialEducationServicesExitDateId]	
		, [FullTimeEquivalency]
		, [SpecialEducationFTE]
		)
		
	SELECT  DISTINCT 
		  ske.Id									AS StagingId
		, rsy.DimSchoolYearId
		, rddc.DimDataCollectionId					AS DataCollectionId
		, countdate.DimDateId						AS CountDateId
		, rds.DimSeaId								AS SeaId
		, rdi.DimIeuId								AS IeuId
		, rdlAcc.DimLeaId							AS LeaAccountabilityId
		, rdlAtt.DimLeaId							AS LeaAttendanceId
		, rdlFun.DimLeaId							AS LeaFundingId
		, rdlGrad.DimLeaId							AS LeaGraduationId
		, rdlIep.DimLeaId							AS LeaIepId
		, rdksch.DimK12SchoolId						AS K12SchoolId
		--, rdrst.DimResponsibleSchoolTypeId			AS ResponsibleSchoolTypeId
		, rdp.DimPersonId							AS K12StudentId
		, entryGrade.DimGradeLevelId				AS EntryGradeLevelId
		, entryDate.DimDateId						AS EnrollmentEntryDateId
		, exitDate.DimDateId						AS EnrollmentExitDateId
		, progStartDate.DimDateId					AS ProgramParticipationStartDateId
		, serviceExitDate.DimDateId					AS SpecialEducationServicesExitDateId
		, ske.FullTimeEquivalency					
		, sppse.SpecialEducationFTE						
	FROM staging.ProgramParticipationSpecialEducation sppse
	INNER JOIN staging.K12Enrollment ske 
		ON ske.DataCollectionName											= sppse.DataCollectionName
		AND ske.StudentIdentifierState										= sppse.StudentIdentifierState
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')					= ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						= ISNULL(sppse.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sppse.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sppse.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sppse.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')								= ISNULL(sppse.SchoolIdentifierSea, '')
	INNER JOIN RDS.DimPeople rdp
		ON ske.StudentIdentifierState										= rdp.K12StudentStudentIdentifierState
		AND ske.RecordStartDateTime											BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		AND ISNULL(ske.FirstName, 'MISSING')								= ISNULL(rdp.FirstName, 'MISSING')
		AND ISNULL(ske.MiddleName, 'MISSING')								= ISNULL(rdp.MiddleName, 'MISSING')
		AND ISNULL(ske.LastOrSurname, 'MISSING')							= ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(ske.Birthdate, '1/1/1900')								= ISNULL(rdp.BirthDate, '1/1/1900')
	INNER JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN RDS.DimLeas rdlAcc
		ON ske.LeaIdentifierSeaAccountability = rdlAcc.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlAcc.RecordStartDateTime AND ISNULL(rdlAcc.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlAtt
		ON ske.LeaIdentifierSeaAttendance = rdlAtt.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlAtt.RecordStartDateTime AND ISNULL(rdlAtt.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlFun
		ON ske.LeaIdentifierSeaFunding = rdlFun.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlFun.RecordStartDateTime AND ISNULL(rdlFun.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlGrad
		ON ske.LeaIdentifierSeaGraduation = rdlGrad.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlGrad.RecordStartDateTime AND ISNULL(rdlGrad.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimLeas rdlIep
		ON ske.LeaIdentifierSeaIndividualizedEducationProgram = rdlIep.LeaIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdlIep.RecordStartDateTime AND ISNULL(rdlIep.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimK12Schools rdksch
		ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		AND ske.RecordStartDateTime BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimIeus rdi
		ON (ISNULL(rdksch.IeuOrganizationIdentifierSea, 'MISSING') = rdi.IeuOrganizationIdentifierSea
			OR ISNULL(rdlAcc.IeuOrganizationIdentifierSea, 'MISSING') = rdi.IeuOrganizationIdentifierSea)
		AND ske.RecordStartDateTime BETWEEN rdi.RecordStartDateTime AND ISNULL(rdi.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimSeas rds
		ON ske.RecordStartDateTime BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimDataCollections rddc
		ON ske.DataCollectionName = rddc.DataCollectionName 
	LEFT JOIN RDS.DimDates entryDate
		ON ske.EnrollmentEntryDate = entryDate.DateValue
	LEFT JOIN RDS.DimDates exitDate
		ON ske.EnrollmentExitDate = exitDate.DateValue
	LEFT JOIN RDS.DimDates countDate
		ON ske.RecordStartDateTime = countDate.DateValue
	--LEFT JOIN #vwDimResponsibleSchoolTypes rdrst
	--	ON ske.SchoolYear						= rdrst.SchoolYear
	--	AND ISNULL(ske.SchoolTypeCode, 'MISSING') = ISNULL(rdrst.ResponsibleSchoolTypeMap, rdrst.ResponsibleSchoolTypeCode)
	LEFT JOIN #vwDimGradeLevels entryGrade
		ON ske.SchoolYear = entryGrade.SchoolYear
		AND ske.GradeLevel = entryGrade.GradeLevelMap
	LEFT JOIN RDS.DimDates progStartDate
		ON sppse.ProgramParticipationBeginDate			= progStartDate.DateValue
	LEFT JOIN RDS.DimDates serviceExitDate
		ON sppse.ProgramParticipationEndDate			= serviceExitDate.DateValue
	WHERE @DataCollectionName IS NULL
		OR ske.DataCollectionName = @DataCollectionName

	CREATE NONCLUSTERED INDEX IX_Facts ON #Facts(StagingId) 

	UPDATE #Facts
	SET   K12DemographicId										= rdkd.DimK12DemographicId
		, HomelessnessStatusId									= rdhs.DimHomelessnessStatusId
		, EconomicallyDisadvantagedStatusId						= rdeds.DimEconomicallyDisadvantagedStatusId
		, FosterCareStatusId									= rdfcs.DimFosterCareStatusId
		, ImmigrantStatusId										= rdimms.DimImmigrantStatusId
		, PrimaryDisabilityTypeId								= rdidtPrimary.DimIdeaDisabilityTypeId
		, SecondaryDisabilityTypeId								= rdidtSecondary.DimIdeaDisabilityTypeId
		, ConsentToEvaluationDateId								= consentDate.DimDateId
		, IndividualizedProgramDateId							= programDate.DimDateId
		, IndividualizedProgramStatusId							= rdips.DimIndividualizedProgramStatusId 
		, IndividualizedProgramServicePlanDateId				= planDate.DimDateId 
		, IndividualizedProgramServicePlanExitDateId			= ipExitDate.DimDateId
		, EligibilityEvaluationDateInitialId					= evaluationDate.DimDateId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')								= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')							= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')		= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')							= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ske.EnrollmentEntryDate												= sps.EnrollmentEntryDate
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')							= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN staging.IndividualizedProgram sip
		ON ske.SchoolYear							= sip.SchoolYear
		AND ISNULL(ske.DataCollectionName, '')		= ISNULL(sip.DataCollectionName, '')
		AND ISNULL(ske.StudentIdentifierState, '')	= ISNULL(sip.StudentIdentifierState, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')		= ISNULL(sip.SchoolIdentifierSea, '')
	LEFT JOIN #vwDimK12Demographics rdkd
		ON ske.SchoolYear = rdkd.SchoolYear
		AND ISNULL(ske.Sex, 'MISSING')				= ISNULL(rdkd.SexMap, rdkd.SexCode)
	LEFT JOIN #vwDimHomelessnessStatuses rdhs
		ON ske.SchoolYear													= rdhs.SchoolYear
		AND ISNULL(CAST(sps.HomelessnessStatus AS SMALLINT), -1)			= rdhs.HomelessnessStatusMap
		AND ISNULL(sps.HomelessNightTimeResidence, 'MISSING')				= ISNULL(rdhs.HomelessPrimaryNighttimeResidenceMap, rdhs.HomelessPrimaryNighttimeResidenceCode)
		AND ISNULL(CAST(sps.HomelessServicedIndicator AS SMALLINT), -1)		= rdhs.HomelessServicedIndicatorMap
		AND ISNULL(CAST(sps.HomelessUnaccompaniedYouth AS SMALLINT), -1)	= rdhs.HomelessUnaccompaniedYouthStatusMap
	LEFT JOIN #vwDimEconomicallyDisadvantagedStatuses rdeds
		ON ske.SchoolYear																				= rdeds.SchoolYear
		AND ISNULL(CAST(sps.EconomicDisadvantageStatus AS SMALLINT), -1)								= rdeds.EconomicDisadvantageStatusMap
		AND ISNULL(sps.EligibilityStatusForSchoolFoodServicePrograms, 'MISSING')						= ISNULL(rdeds.EligibilityStatusForSchoolFoodServiceProgramsMap, rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode)
		AND ISNULL(CAST(sps.NationalSchoolLunchProgramDirectCertificationIndicator AS SMALLINT), -1)	= rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap
	LEFT JOIN #vwDimFosterCareStatuses rdfcs
		ON ske.SchoolYear													= rdfcs.SchoolYear
		AND ISNULL(CAST(sps.ProgramType_FosterCare AS SMALLINT), -1)		= rdfcs.ProgramParticipationFosterCareMap
	LEFT JOIN #vwDimImmigrantStatuses rdimms
		ON ske.SchoolYear													= rdimms.SchoolYear
		AND ISNULL(CAST(sps.ProgramType_Immigrant AS SMALLINT), -1)			= rdimms.TitleIIIImmigrantStatusMap
		AND -1																= rdimms.TitleIIIImmigrantParticipationStatusMap -- Where in Staging?
	LEFT JOIN #vwDimIdeaDisabilityTypes rdidtPrimary
		ON ske.SchoolYear													= rdidtPrimary.SchoolYear
		AND ISNULL(sps.PrimaryDisabilityType, 'MISSING')					= ISNULL(rdidtPrimary.IdeaDisabilityTypeMap, rdidtPrimary.IdeaDisabilityTypeCode)
	LEFT JOIN #vwDimIdeaDisabilityTypes rdidtSecondary
		ON ske.SchoolYear													= rdidtSecondary.SchoolYear
		AND ISNULL(sps.SecondaryDisabilityType, 'MISSING')					= ISNULL(rdidtSecondary.IdeaDisabilityTypeMap, rdidtSecondary.IdeaDisabilityTypeCode)
	LEFT JOIN #vwDimIndividualizedProgramStatuses rdips
		ON ske.SchoolYear													= rdips.SchoolYear
		AND ISNULL(sip.IndividualizedProgramType, 'MISSING')				= ISNULL(rdips.IndividualizedProgramTypeMap, rdips.IndividualizedProgramTypeCode)
		AND ISNULL(sip.StudentSupportServiceType, 'MISSING')				= ISNULL(rdips.StudentSupportServiceTypeMap, rdips.StudentSupportServiceTypeCode)
		AND ISNULL(CAST(sip.ConsentToEvaluationIndicator AS SMALLINT), -1)	= rdips.ConsentToEvaluationIndicatorMap
	LEFT JOIN RDS.DimDates planDate
		ON sip.IndividualizedProgramServicePlanDate				= planDate.DateValue
	LEFT JOIN RDS.DimDates evaluationDate
		ON sip.EligibilityEvaluationDateInitial					= evaluationDate.DateValue
	LEFT JOIN RDS.DimDates programDate
		ON sip.IndividualizedProgramDate						= programDate.DateValue
	LEFT JOIN RDS.DimDates consentDate
		ON sip.ConsentToEvaluationDate							= consentDate.DateValue
	LEFT JOIN RDS.DimDates ipExitDate
		ON sip.IndividualizedProgramServicePlanEndDate			= ipExitDate.DateValue	

	UPDATE #Facts
	SET  CteStatusId	= rdcs.DimCteStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN Staging.ProgramParticipationCte sppc
		ON ske.DataCollectionName												= sppc.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sppc.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sppc.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sppc.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sppc.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sppc.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sppc.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sppc.StudentIdentifierState, '')
	JOIN RDS.vwDimCteStatuses rdcs
		ON ske.SchoolYear = rdcs.SchoolYear
		AND ISNULL(CAST(sppc.DisplacedHomeMakerIndicator AS SMALLINT), -1)	= rdcs.CteAeDisplacedHomemakerIndicatorMap
		AND ISNULL(CAST(sppc.NonTraditionalGenderStatus AS SMALLINT), -1)	= rdcs.CteNontraditionalGenderStatusMap
		AND -1																= rdcs.CteNontraditionalCompletionMap
		AND ISNULL(CAST(sppc.SingleParentIndicator AS SMALLINT), -1)		= rdcs.SingleParentOrSinglePregnantWomanStatusMap
		AND ISNULL(CAST(sppc.CteParticipant AS SMALLINT), -1)				= rdcs.CteParticipantMap
		AND ISNULL(CAST(sppc.CteConcentrator AS SMALLINT), -1)				= rdcs.CteConcentratorMap
	
	UPDATE #Facts
	SET  ChildOutcomeSummaryBaselineId		= coBaseline.DimChildOutcomeSummaryId,
		 ChildOutcomeSummaryDateBaselineId	= coBaselineDate.DimDateId,
		 ChildOutcomeSummaryAtExitId		= coAtExit.DimChildOutcomeSummaryId,
		 ChildOutcomeSummaryDateAtExitId	= coAtExitDate.DimDateId
	FROM #Facts f
	INNER JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	LEFT JOIN staging.EarlyLearningChildOutcomeSummary selcosBaseline
		ON ske.SchoolYear														= selcosBaseline.SchoolYear
		AND ISNULL(ske.DataCollectionName, '')									= ISNULL(selcosBaseline.DataCollectionName, '')
		AND ske.StudentIdentifierState											= selcosBaseline.StudentIdentifierState
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(selcosBaseline.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(selcosBaseline.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(selcosBaseline.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(selcosBaseline.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(selcosBaseline.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(selcosBaseline.SchoolIdentifierSea, '')
		AND selcosBaseline.EarlyLearningOutcomeTimePoint	= 'Baseline'
	LEFT JOIN #vwDimChildOutcomeSummaries coBaseline
		ON selcosBaseline.SchoolYear											= coBaseline.SchoolYear
		AND ISNULL(selcosBaseline.COSRatingA, 'MISSING')						= ISNULL(coBaseline.COSRatingAMap, coBaseline.COSRatingACode)
		AND ISNULL(selcosBaseline.COSRatingB, 'MISSING')						= ISNULL(coBaseline.COSRatingBMap, coBaseline.COSRatingBCode)
		AND ISNULL(selcosBaseline.COSRatingC, 'MISSING')						= ISNULL(coBaseline.COSRatingCMap, coBaseline.COSRatingCCode)
		AND ISNULL(CAST(selcosBaseline.COSProgressAIndicator AS SMALLINT), -1)	= coBaseline.COSProgressAIndicatorMap
		AND ISNULL(CAST(selcosBaseline.COSProgressBIndicator AS SMALLINT), -1)	= coBaseline.COSProgressBIndicatorMap
		AND ISNULL(CAST(selcosBaseline.COSProgressCIndicator AS SMALLINT), -1)	= coBaseline.COSProgressCIndicatorMap
	LEFT JOIN staging.EarlyLearningChildOutcomeSummary selcosAtExit
		ON ske.SchoolYear														= selcosAtExit.SchoolYear
		AND ISNULL(ske.DataCollectionName, '')									= ISNULL(selcosAtExit.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(selcosAtExit.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(selcosAtExit.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(selcosAtExit.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(selcosAtExit.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(selcosAtExit.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(selcosAtExit.SchoolIdentifierSea, '')
		AND ske.StudentIdentifierState											= selcosAtExit.StudentIdentifierState
		AND selcosAtExit.EarlyLearningOutcomeTimePoint							= 'AtExit'
	LEFT JOIN #vwDimChildOutcomeSummaries coAtExit
		ON selcosAtExit.SchoolYear												= coAtExit.SchoolYear
		AND ISNULL(selcosAtExit.COSRatingA, 'MISSING')							= ISNULL(coAtExit.COSRatingAMap, coAtExit.COSRATINGACode)
		AND ISNULL(selcosAtExit.COSRatingB, 'MISSING')							= ISNULL(coAtExit.COSRatingBMap, coAtExit.COSRATINGBCode)
		AND ISNULL(selcosAtExit.COSRatingC, 'MISSING')							= ISNULL(coAtExit.COSRatingCMap, coAtExit.COSRATINGCCode)
		AND ISNULL(CAST(selcosAtExit.COSProgressAIndicator AS SMALLINT), -1)	= coAtExit.COSProgressAIndicatorMap
		AND ISNULL(CAST(selcosAtExit.COSProgressBIndicator AS SMALLINT), -1)	= coAtExit.COSProgressBIndicatorMap
		AND ISNULL(CAST(selcosAtExit.COSProgressCIndicator AS SMALLINT), -1)	= coAtExit.COSProgressCIndicatorMap
	LEFT JOIN RDS.DimDates coAtExitDate
		ON selcosAtExit.EarlyLearningOutcomeDate	= coAtExitDate.DateValue	
	LEFT JOIN RDS.DimDates coBaselineDate
		ON selcosBaseline.EarlyLearningOutcomeDate	= coBaselineDate.DateValue

	UPDATE #Facts
	SET  DisabilityStatusId	= rdds.DimDisabilityStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ske.StudentIdentifierState											= sps.StudentIdentifierState
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')							= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')							= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')							= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	JOIN Staging.Disability sd
		ON ske.DataCollectionName												= sd.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sd.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						= ISNULL(sppc.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sppc.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sppc.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sppc.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sd.SchoolIdentifierSea, '')
		AND ske.StudentIdentifierState											= sd.StudentIdentifierState
	JOIN #vwDimDisabilityStatuses rdds
		ON ske.SchoolYear														= rdds.SchoolYear
		AND ISNULL(CAST(sd.DisabilityStatus AS SMALLINT), -1)					= rdds.DisabilityStatusMap
		AND ISNULL(CAST(sps.ProgramType_Section504 AS SMALLINT), -1)			= rdds.Section504StatusMap
		AND ISNULL(sd.DisabilityConditionType, 'MISSING')						= ISNULL(rdds.DisabilityConditionTypeMap, rdds.DisabilityConditionTypeCode)
		AND ISNULL(sd.DisabilityDeterminationSourceType, 'MISSING')				= ISNULL(rdds.DisabilityDeterminationSourceTypeMap, rdds.DisabilityDeterminationSourceTypeCode)

	UPDATE #Facts
	SET  IdeaStatusId	= rdis.DimIdeaStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')							= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')							= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')							= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN Staging.ProgramParticipationSpecialEducation sppse
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sppse.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sppse.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sppse.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sppse.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sppse.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sppse.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sppse.StudentIdentifierState, '')
	JOIN #vwDimIdeaStatuses rdis
		ON ske.SchoolYear = rdis.SchoolYear
		AND ISNULL(CAST(sps.IDEAIndicator AS SMALLINT), -1)						= rdis.IdeaIndicatorMap
		AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood, 'MISSING')= ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
		AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge, 'MISSING')		= ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
		AND ISNULL(sppse.SpecialEducationExitReason, 'MISSING')					= ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode) 

	UPDATE #Facts
	SET   EnglishLearnerStatusId	= rdels.DimEnglishLearnerStatusId
		, TitleIIIStatusId			= rdtiiis.DimTitleIIIStatusId
    FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN Staging.PersonStatus sps 
		ON ske.DataCollectionName												= sps.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')							= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')							= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')							= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	LEFT JOIN Staging.ProgramParticipationTitleIII spptiii
		ON ske.DataCollectionName												= spptiii.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(spptiii.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(spptiii.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(spptiii.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(spptiii.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(spptiii.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(spptiii.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(spptiii.StudentIdentifierState, '')
	LEFT JOIN #vwDimEnglishLearnerStatuses rdels
		ON ske.SchoolYear														= rdels.SchoolYear
		AND ISNULL(sps.EnglishLearnerStatus, -1)								= rdels.EnglishLearnerStatusMap
		AND ISNULL(sps.PerkinsLEPStatus, -1)									= rdels.PerkinsLEPStatusMap
		AND ISNULL(spptiii.TitleIIIAccountabilityProgressStatus, 'MISSING')		= ISNULL(rdels.TitleIIIAccountabilityProgressStatusMap, rdels.TitleIIIAccountabilityProgressStatusCode)
		AND ISNULL(spptiii.TitleIIILanguageInstructionProgramType, 'MISSING')	= ISNULL(rdels.TitleIIILanguageInstructionProgramTypeMap, rdels.TitleIIILanguageInstructionProgramTypeCode)
	LEFT JOIN #vwDimTitleIIIStatuses rdtiiis
		ON ske.SchoolYear														= rdtiiis.SchoolYear
		AND ISNULL(CAST(spptiii.TitleIiiImmigrantStatus AS SMALLINT), -1)		= rdtiiis.TitleIIIProgramParticipationMap 
		AND 'MISSING'															= rdtiiis.FormerEnglishLearnerYearStatusCode -- Where in Staging?
		AND ISNULL(spptiii.Proficiency_TitleIII, 'MISSING')						= ISNULL(rdtiiis.ProficiencyStatusMap, rdtiiis.ProficiencyStatusCode)
	--LEFT JOIN RDS.DimDates rddtiiiStart
	--	ON spptiii.ProgramParticipationBeginDate								= rddtiiiStart.DateValue
	--LEFT JOIN RDS.DimDates rddtiiiEnd
	--	ON spptiii.ProgramParticipationEndDate									= rddtiiiEnd.DateValue

	UPDATE #Facts
	SET   K12EnrollmentStatusId							= rdkes.DimK12EnrollmentStatusId		
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN #vwDimK12EnrollmentStatuses rdkes
		ON ske.SchoolYear = rdkes.SchoolYear
		AND ISNULL(ske.EnrollmentStatus, 'MISSING')		= ISNULL(rdkes.EnrollmentStatusMap, rdkes.EnrollmentStatusCode)
		AND ISNULL(ske.EntryType, 'MISSING')			= ISNULL(rdkes.EntryTypeMap, rdkes.EntryTypeCode)
		AND ISNULL(ske.ExitOrWithdrawalType, 'MISSING')	= ISNULL(rdkes.ExitOrWithdrawalTypeMap, rdkes.ExitOrWithdrawalTypeCode)

	UPDATE #Facts
	SET  MigrantStatusId	= rdms.DimMigrantStatusId
	FROM #Facts f	
	JOIN Staging.K12Enrollment ske
		ON f.StagingId		= ske.Id
	JOIN Staging.Migrant sm
		ON ske.DataCollectionName												  = sm.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						  = ISNULL(sm.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						  	  = ISNULL(sm.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							  = ISNULL(sm.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						  = ISNULL(sm.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	  = ISNULL(sm.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									  = ISNULL(sm.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								  = ISNULL(sm.StudentIdentifierState, '')
	JOIN #vwDimMigrantStatuses rdms
		ON ske.SchoolYear = rdms.SchoolYear
		AND ISNULL(CAST(sm.MigrantStatus AS SMALLINT), -1)						  = rdms.MigrantStatusMap
		AND ISNULL(CAST(sm.MigrantEducationProgramEnrollmentType AS SMALLINT), -1)= rdms.MigrantEducationProgramEnrollmentTypeMap
		AND ISNULL(CAST(sm.ContinuationOfServicesReason AS SMALLINT), -1)		  = rdms.ContinuationOfServicesReasonMap
		AND ISNULL(CAST(sm.MigrantEducationProgramServicesType AS SMALLINT), -1)  = rdms.MigrantEducationProgramServicesTypeMap
		AND ISNULL(CAST(sm.MigrantPrioritizedForServices AS SMALLINT), -1)		  = rdms.MigrantPrioritizedForServicesMap

	UPDATE #Facts
	SET   MilitaryStatusId														= rdmil.DimMilitaryStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN Staging.PersonStatus sps 
		ON ske.DataCollectionName											= sps.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')					= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')								= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')							= ISNULL(sps.StudentIdentifierState, '')
		AND ISNULL(ske.RecordStartDateTime, '1/1/1900')						= ISNULL(sps.RecordStartDateTime, '1/1/1900')
		AND ISNULL(ske.EnrollmentEntryDate, '1/1/1900')						= ISNULL(sps.EnrollmentEntryDate, '1/1/1900')
		AND ISNULL(ske.EnrollmentExitDate, '1/1/1900')						= ISNULL(sps.EnrollmentExitDate, '1/1/1900')
	JOIN Staging.Military sm
		ON ISNULL(ske.DataCollectionName, '')								= ISNULL(sm.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')					= ISNULL(sm.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						= ISNULL(sm.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sm.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sm.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sm.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')								= ISNULL(sm.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')							= ISNULL(sm.StudentIdentifierState, '')
	JOIN #vwDimMilitaryStatuses rdmil
		ON ske.SchoolYear = rdmil.SchoolYear
		AND ISNULL(sps.MilitaryConnectedStudentIndicator, 'MISSING')		= ISNULL(rdmil.MilitaryConnectedStudentIndicatorMap, rdmil.MilitaryConnectedStudentIndicatorCode)
		AND ISNULL(sm.MilitaryActiveStudentIndicator, 'MISSING')			= ISNULL(rdmil.MilitaryActiveStudentIndicatorMap, rdmil.MilitaryActiveStudentIndicatorCode)
		AND ISNULL(sm.MilitaryBranch, 'MISSING')							= ISNULL(rdmil.MilitaryBranchMap, rdmil.MilitaryBranchCode)
		AND ISNULL(sm.MilitaryVeteranStudentIndicator, 'MISSING')			= ISNULL(rdmil.MilitaryVeteranStudentIndicatorMap, rdmil.MilitaryVeteranStudentIndicatorCode)

	--ALTER INDEX ALL ON RDS.FactSpecialEducation DISABLE;

	INSERT INTO [RDS].[FactSpecialEducation]	
				(
					SchoolYearId
					, DataCollectionId
					, CountDateId
					, SeaId
					, IeuId
					, LeaAccountabilityId
					, LeaAttendanceId
					, LeaFundingId
					, LeaGraduationId
					, LeaIndividualizedEducationProgramId
					, K12SchoolId
					, ResponsibleSchoolTypeId
					, K12StudentId
					, EnrollmentEntryDateId
					, EnrollmentExitDateId
					, ConsentToEvaluationDateId
					, ChildOutcomeSummaryBaselineId
					, ChildOutcomeSummaryAtExitId
					, ChildOutcomeSummaryDateBaselineId
					, ChildOutcomeSummaryDateAtExitId
					, DisabilityStatusId
					, CteStatusId
					, EconomicallyDisadvantagedStatusId
					, EnglishLearnerStatusId
					, EntryGradeLevelId
					, EligibilityEvaluationDateInitialId
					, EligibilityEvaluationDateReevaluationId
					, FosterCareStatusId
					, HomelessnessStatusId
					, IdeaStatusId
					, ImmigrantStatusId
					, IndividualizedProgramStatusId
					, IndividualizedProgramServicePlanDateId
					, IndividualizedProgramServicePlanReevaluationDateId
					, IndividualizedProgramServicePlanExitDateId
					, IndividualizedProgramDateId
					, K12EnrollmentStatusId
					, K12DemographicId
					, MigrantStatusId
					, MilitaryStatusId
					, NOrDStatusId
					, ProgramParticipationStartDateId
					, PrimaryDisabilityTypeId
					, SecondaryDisabilityTypeId
					, SpecialEducationServicesExitDateId
					, TitleIIIStatusId
					, FullTimeEquivalency
					, SpecialEducationFTE
					, StudentCount
				)
SELECT		  ISNULL([SchoolYearId]											, -1)
			, ISNULL([DataCollectionId]										, -1)
			, ISNULL([CountDateId]											, -1)
			, ISNULL([SeaId]												, -1)
			, ISNULL([IeuId]												, -1)
			, ISNULL([LeaAccountabilityId]									, -1)
			, ISNULL([LeaAttendanceId]										, -1)
			, ISNULL([LeaFundingId]											, -1)
			, ISNULL([LeaGraduationID]										, -1)
			, ISNULL([LeaIndividualizedEducationProgramId]					, -1)
			, ISNULL([K12SchoolId]											, -1)
			, ISNULL([ResponsibleSchoolTypeId]								, -1) 
			, ISNULL([K12StudentId]											, -1)
			, ISNULL([EnrollmentEntryDateId]								, -1)
			, ISNULL([EnrollmentExitDateId]									, -1)
			, ISNULL([ConsentToEvaluationDateId]							, -1)
			, ISNULL([ChildOutcomeSummaryBaselineId]						, -1)
			, ISNULL([ChildOutcomeSummaryAtExitId]							, -1)
			, ISNULL([ChildOutcomeSummaryDateBaselineId]					, -1)
			, ISNULL([ChildOutcomeSummaryDateAtExitId]						, -1)
			, ISNULL([DisabilityStatusId]									, -1)
			, ISNULL([CteStatusId]											, -1)
			, ISNULL([EconomicallyDisadvantagedStatusId]					, -1)
			, ISNULL([EnglishLearnerStatusId]								, -1)
			, ISNULL([EntryGradeLevelId]									, -1)
			, ISNULL([EligibilityEvaluationDateInitialId]					, -1)
			, ISNULL([EligibilityEvaluationDateReevaluationId]				, -1)
			, ISNULL([FosterCareStatusId]									, -1)
			, ISNULL([HomelessnessStatusId]									, -1)
			, ISNULL([IdeaStatusId]											, -1)
			, ISNULL([ImmigrantStatusId]									, -1)
			, ISNULL([IndividualizedProgramStatusId]						, -1)
			, ISNULL([IndividualizedProgramServicePlanDateId]				, -1)
			, ISNULL([IndividualizedProgramServicePlanReevaluationDateId]	, -1)
			, ISNULL([IndividualizedProgramServicePlanExitDateId]			, -1)
			, ISNULL([IndividualizedProgramDateId]							, -1)
			, ISNULL([K12EnrollmentStatusId]								, -1)
			, ISNULL([K12DemographicId]										, -1)
			, ISNULL([MigrantStatusId]										, -1)
			, ISNULL([MilitaryStatusId]										, -1)
			, ISNULL([NOrDStatusId]											, -1)
			, ISNULL([ProgramParticipationStartDateId]						, -1)
			, ISNULL([PrimaryDisabilityTypeId]								, -1)
			, ISNULL([SecondaryDisabilityTypeId]							, -1)
			, ISNULL([SpecialEducationServicesExitDateId]					, -1)
			, ISNULL([TitleIIIStatusId]										, -1)
			, [FullTimeEquivalency]									
			, [SpecialEducationFTE]									
			, 1	AS [StudentCount]																						
	FROM #Facts
	
	--ALTER INDEX ALL ON RDS.FactSpecialEducation REBUILD;

	DROP TABLE IF EXISTS #SchoolYears
	DROP TABLE IF EXISTS #vwDimK12Demographics
	DROP TABLE IF EXISTS #vwDimIdeaStatuses
	DROP TABLE IF EXISTS #vwDimEnglishLearnerStatuses
	DROP TABLE IF EXISTS #vwDimGradeLevels
	DROP TABLE IF EXISTS #vwDimHomelessnessStatuses
	DROP TABLE IF EXISTS #vwDimEconomicallyDisadvantagedStatuses
	DROP TABLE IF EXISTS #vwDimFosterCareStatuses
	DROP TABLE IF EXISTS #vwDimImmigrantStatuses
	DROP TABLE IF EXISTS #vwDimMigrantStatuses
	DROP TABLE IF EXISTS #vwDimMilitaryStatuses
	DROP TABLE IF EXISTS #vwDimIdeaDisabilityTypes
	DROP TABLE IF EXISTS #vwDimTitleIIIStatuses
	DROP TABLE IF EXISTS #vwDimDisabilityStatuses
	--DROP TABLE IF EXISTS #vwDimResponsibleSchoolTypes
	DROP TABLE IF EXISTS #vwDimIndividualizedProgramStatuses
	DROP TABLE IF EXISTS #vwDimChildOutcomeSummaries
	DROP TABLE IF EXISTS #vwDimK12EnrollmentStatuses
	DROP TABLE IF EXISTS #Facts

	INSERT INTO RDS.BridgeSpecialEducationRaces
		(
			  [FactSpecialEducationId]
			, [RaceId]
		)
	SELECT DISTINCT
		  rfse.FactSpecialEducationId
		, ISNULL(rdr.DimRaceId, -1)
	FROM RDS.FactSpecialEducation rfse
	JOIN RDS.DimSchoolYears rdsy
		ON rfse.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfse.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfse.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfse.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfse.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfse.LeaFundingId= rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfse.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfse.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDataCollections rddc
		ON rfse.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	JOIN RDS.DimDates countDate
		ON rfse.CountDateId = countDate.DimDateId
	LEFT JOIN Staging.K12PersonRace skpr
		ON rdp.K12StudentStudentIdentifierState			= skpr.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '')	= ISNULL(skpr.SchoolIdentifierSea, '')
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(rdlsFun.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaFunding, '')
		--AND ISNULL(rdlsGrad.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(rdlsIep.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND rddc.DataCollectionName					= skpr.DataCollectionName
		AND countDate.DateValue						BETWEEN skpr.RecordStartDateTime AND ISNULL(skpr.RecordEndDateTime, GETDATE())
	LEFT JOIN Staging.K12Enrollment ske
		ON rdp.K12StudentStudentIdentifierState									= ske.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '')							= ISNULL(ske.SchoolIdentifierSea, '')
		AND ISNULL(skpr.LeaIdentifierSeaAccountability, '')					= ISNULL(ske.LeaIdentifierSeaAccountability, '')
		AND ISNULL(skpr.LeaIdentifierSeaAttendance, '')						= ISNULL(ske.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(skpr.LeaIdentifierSeaFunding, '')						= ISNULL(ske.LeaIdentifierSeaFunding, '')
		--AND ISNULL(skpr.LeaIdentifierSeaGraduation, '')						= ISNULL(ske.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(skpr.LeaIdentifierSeaIndividualizedEducationProgram, '') = ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ske.HispanicLatinoEthnicity									= 1
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(ske.DataCollectionName, '')
		AND countDate.DateValue BETWEEN ske.RecordStartDateTime AND ISNULL(ske.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.vwDimRaces rdr
		ON skpr.SchoolYear = rdr.SchoolYear
		AND (ISNULL(skpr.RaceType, 'Race and Ethnicity Unknown') = rdr.RaceMap
			OR (ISNULL(ske.HispanicLatinoEthnicity, 0)	= 1
				AND rdr.RaceCode = 'HispanicOrLatinoEthnicity'))
	
	INSERT INTO RDS.BridgeSpecialEducationIdeaDisabilityTypes
		(
			  [FactSpecialEducationId]       
			, [IdeaDisabilityTypeId]
		)
	SELECT DISTINCT
		  rfse.FactSpecialEducationId
		, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)
	FROM RDS.FactSpecialEducation rfse
	JOIN RDS.DimSchoolYears rdsy
		ON rfse.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfse.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfse.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfse.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfse.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfse.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfse.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfse.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDataCollections rddc
		ON rfse.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	JOIN RDS.DimDates countDate
		ON rfse.countDateId = countDate.DimDateId
	LEFT JOIN Staging.IdeaDisabilityType sidt
		ON rdp.K12StudentStudentIdentifierState = sidt.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '')	= ISNULL(sidt.SchoolIdentifierSea, '')
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaAccountability, '')
		AND ISNULL(rdlsAtt.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(rdlsFun.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaFunding, '')
		--AND ISNULL(rdlsGrad.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(rdlsIep.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND rddc.DataCollectionName = sidt.DataCollectionName
		AND countDate.DateValue	BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
		ON sidt.SchoolYear = rdidt.SchoolYear
		AND sidt.IdeaDisabilityTypeCode = rdidt.IdeaDisabilityTypeMap

END

GO