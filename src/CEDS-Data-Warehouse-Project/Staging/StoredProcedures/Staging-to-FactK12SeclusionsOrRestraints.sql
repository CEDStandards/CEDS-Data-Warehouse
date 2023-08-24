CREATE PROCEDURE Staging.[Staging-To-FactK12SeclusionsOrRestraints]
	@DataCollectionName	VARCHAR(60) = NULL
AS
BEGIN

	SET NOCOUNT ON
	
	DROP TABLE IF EXISTS #SchoolYears
	SELECT DISTINCT SchoolYear INTO #SchoolYears FROM Staging.K12Enrollment

	DROP TABLE IF EXISTS #vwDimDisabilityStatuses
	SELECT v.* INTO #vwDimDisabilityStatuses FROM RDS.vwDimDisabilityStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimDisabilityStatuses ON #vwDimDisabilityStatuses(SchoolYear, DisabilityStatusMap, Section504StatusMap, DisabilityConditionTypeMap, DisabilityDeterminationSourceTypeMap) INCLUDE (DisabilityStatusCode, DisabilityConditionTypeCode, DisabilityDeterminationSourceTypeCode)

	DROP TABLE IF EXISTS #vwDimEconomicallyDisadvantagedStatuses
	SELECT v.* INTO #vwDimEconomicallyDisadvantagedStatuses FROM RDS.vwDimEconomicallyDisadvantagedStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimEconomicallyDisadvantagedStatuses ON #vwDimEconomicallyDisadvantagedStatuses(SchoolYear, EconomicDisadvantageStatusMap, EligibilityStatusForSchoolFoodServiceProgramsMap, NationalSchoolLunchProgramDirectCertificationIndicatorMap) INCLUDE (EconomicDisadvantageStatusCode, EligibilityStatusForSchoolFoodServiceProgramsCode, NationalSchoolLunchProgramDirectCertificationIndicatorCode)

	DROP TABLE IF EXISTS #vwDimFosterCareStatuses
	SELECT v.* INTO #vwDimFosterCareStatuses FROM RDS.vwDimFosterCareStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimFosterCareStatuses ON #vwDimFosterCareStatuses(SchoolYear, ProgramParticipationFosterCareMap) INCLUDE (ProgramParticipationFosterCareCode)

	DROP TABLE IF EXISTS #vwDimGradeLevels
	SELECT v.* INTO #vwDimGradeLevels FROM RDS.vwDimGradeLevels v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear WHERE v.GradeLevelTypeDescription = 'Entry Grade Level' 
	CREATE NONCLUSTERED INDEX IX_vwDimGradeLevels ON #vwDimGradeLevels(SchoolYear, GradeLevelMap) INCLUDE (GradeLevelCode)

	DROP TABLE IF EXISTS #vwDimHomelessnessStatuses
	SELECT v.* INTO #vwDimHomelessnessStatuses FROM RDS.vwDimHomelessnessStatuses  v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimHomelessnessStatuses ON #vwDimHomelessnessStatuses(SchoolYear, HomelessnessStatusMap, HomelessPrimaryNighttimeResidenceMap, HomelessServicedIndicatorMap, HomelessUnaccompaniedYouthStatusMap) INCLUDE (HomelessnessStatusCode, HomelessPrimaryNighttimeResidenceCode, HomelessServicedIndicatorCode, HomelessUnaccompaniedYouthStatusCode)

	DROP TABLE IF EXISTS #vwDimIdeaStatuses
	SELECT v.* INTO #vwDimIdeaStatuses FROM RDS.vwDimIdeaStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimIdeaStatuses ON #vwDimIdeaStatuses(SchoolYear, IdeaIndicatorMap, IdeaEducationalEnvironmentForEarlyChildhoodMap, IdeaEducationalEnvironmentForSchoolAgeMap, SpecialEducationExitReasonMap) INCLUDE (IdeaEducationalEnvironmentForEarlyChildhoodCode, IdeaEducationalEnvironmentForSchoolAgeCode, SpecialEducationExitReasonCode)

	DROP TABLE IF EXISTS #vwDimIdeaDisabilityTypes
	SELECT v.* INTO #vwDimIdeaDisabilityTypes FROM RDS.vwDimIdeaDisabilityTypes v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimIdeaDisabilityTypes ON #vwDimIdeaDisabilityTypes(SchoolYear, IdeaDisabilityTypeMap) INCLUDE (IdeaDisabilityTypeCode)

	DROP TABLE IF EXISTS #vwDimImmigrantStatuses
	SELECT v.* INTO #vwDimImmigrantStatuses FROM RDS.vwDimImmigrantStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimImmigrantStatuses ON #vwDimImmigrantStatuses(SchoolYear, TitleIIIImmigrantStatusMap, TitleIIIImmigrantParticipationStatusMap) INCLUDE (TitleIIIImmigrantStatusCode, TitleIIIImmigrantParticipationStatusCode)

	DROP TABLE IF EXISTS #vwDimK12Demographics
	SELECT v.* INTO #vwDimK12Demographics FROM RDS.vwDimK12Demographics v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimK12Demographics ON #vwDimK12Demographics(SchoolYear, SexMap) INCLUDE (SexCode)

	DROP TABLE IF EXISTS #vwDimMigrantStatuses
	SELECT v.* INTO #vwDimMigrantStatuses FROM RDS.vwDimMigrantStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimMigrantStatuses ON #vwDimMigrantStatuses(SchoolYear, MigrantStatusMap, MigrantEducationProgramEnrollmentTypeMap, ContinuationOfServicesReasonMap, MigrantEducationProgramServicesTypeMap, MigrantPrioritizedForServicesMap) INCLUDE (MigrantStatusCode, MigrantEducationProgramEnrollmentTypeCode, ContinuationOfServicesReasonCode, MigrantEducationProgramServicesTypeCode, MigrantPrioritizedForServicesCode)

	DROP TABLE IF EXISTS #vwDimSeclusionOrRestraintStatuses
	SELECT v.* INTO #vwDimSeclusionOrRestraintStatuses FROM RDS.vwDimSeclusionOrRestraintStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimSeclusionOrRestraintStatuses ON #vwDimSeclusionOrRestraintStatuses(SchoolYear, ProblemBehaviorTriggerMap, ProblemBehaviorTypeMap, SeclusionOrRestraintTypeMap, SeclusionOrRestraintStudentResponseTypeMap, InterventionFollowUpTypeMap) INCLUDE (ProblemBehaviorTriggerCode, ProblemBehaviorTypeCode, SeclusionOrRestraintTypeCode, SeclusionOrRestraintStudentResponseTypeCode, InterventionFollowUpTypeCode)

	DROP TABLE IF EXISTS #vwDimTitleIIIStatuses
	SELECT v.* INTO #vwDimTitleIIIStatuses FROM RDS.vwDimTitleIIIStatuses v JOIN #SchoolYears t ON v.SchoolYear = t.SchoolYear
	CREATE NONCLUSTERED INDEX IX_vwDimTitleIIIStatuses ON #vwDimTitleIIIStatuses(SchoolYear, TitleIIIProgramParticipationMap, FormerEnglishLearnerYearStatusMap, ProficiencyStatusMap) INCLUDE (TitleIIIProgramParticipationCode, FormerEnglishLearnerYearStatusCode, ProficiencyStatusCode)

	DROP TABLE IF EXISTS #SKEAges
	SELECT ske.SchoolYear, DataCollectionName, StudentIdentifierState, LeaIdentifierSeaAttendance, SchoolIdentifierSea, RDS.Get_Age(BirthDate, GETDATE()) Age
		INTO #SKEAges
	FROM  staging.K12Enrollment  ske
	WHERE BirthDate IS NOT NULL
	AND @DataCollectionName IS NULL
		OR ske.DataCollectionName = @DataCollectionName
	CREATE NONCLUSTERED INDEX IX_SKEAges ON #SKEAges(SchoolYear, Age)
	
	DROP TABLE IF EXISTS #K12EnrollmentAges
	SELECT kea.DataCollectionName, kea.StudentIdentifierState,  kea.LeaIdentifierSeaAttendance, kea.SchoolIdentifierSea, da.DimAgeId
		INTO #K12EnrollmentAges
	FROM #SKEAges kea
		INNER JOIN RDS.DimAges da
			ON kea.Age = da.AgeCode
			AND da.AgeCode <> 'MISSING'

	CREATE NONCLUSTERED INDEX IX_K12EnrollmentAges ON #K12EnrollmentAges(DataCollectionName, StudentIdentifierState) INCLUDE (LeaIdentifierSeaAttendance, SchoolIdentifierSea)

	DROP TABLE IF EXISTS #K12SeclusionOrRestraint
	SELECT  DISTINCT Id,
			StudentIdentifierState,
			LeaIdentifierSeaAttendance,
			SchoolIdentifierSea,
			DateOccurred,
			'Seclusion' AS SeclusionOrRestraintType,
			NumberSecluded AS SeclusionOrRestraintCount,
			SchoolYear,
			DataCollectionName
		INTO #K12SeclusionOrRestraint
	FROM Staging.MiK12StudentSeclusionsOrRestraints
	WHERE ISNULL(NumberSecluded, 0) <> 0
	UNION
	SELECT  DISTINCT Id,
			StudentIdentifierState,
			LeaIdentifierSeaAttendance,
			SchoolIdentifierSea,
			DateOccurred,
			'Restraint' AS SeclusionOrRestraintType,
			NumberRestrained AS SeclusionOrRestraintCount,
			SchoolYear,
			DataCollectionName
	FROM Staging.MiK12StudentSeclusionsOrRestraints
	WHERE ISNULL(NumberRestrained, 0) <> 0

	CREATE NONCLUSTERED INDEX IX_K12SeclusionOrRestraint ON #K12EnrollmentAges(DataCollectionName, StudentIdentifierState) INCLUDE (LeaIdentifierSeaAttendance, SchoolIdentifierSea)

	DROP TABLE IF EXISTS #Facts
	CREATE TABLE #Facts (
					[StagingId]										INT NOT NULL
					,[SeclusionOrRestraintId]						INT NOT NULL
					, [SchoolYearId]								INT NULL
					, [DataCollectionId]							INT NULL
					, [K12SchoolId]                         		INT NULL
					, [LeaAccountabilityId]                 		INT NULL
					, [LeaAttendanceId]                     		INT NULL
					, [LeaFundingId]                        		INT NULL
					, [LeaGraduationId]                     		INT NULL
					, [LeaIndividualizedEducationProgramId] 		INT NULL
					, [IeuId]                               		INT NULL
					, [SeaId]                               		INT NULL
					, [K12StudentId]                        		INT NULL
					, [AgeId]                               		INT NULL
					, [GradeLevelId]                        		INT NULL
					, [SeclusionOrRestraintDateId]          		INT NULL
					, [HomelessnessStatusId]                		INT NULL
					, [ImmigrantStatusId]                   		INT NULL
					, [PrimaryDisabilityTypeId]             		INT NULL
					, [SecondaryDisabilityTypeId]           		INT NULL
					, [FosterCareStatusId]                  		INT NULL
					, [TitleIIIStatusId]                    		INT NULL
					, [IdeaStatusId]                        		INT NULL
					, [MigrantStatusId]                     		INT NULL
					, [K12DemographicId]                    		INT NULL
					, [EconomicallyDisadvantagedStatusId]   		INT NULL
					, [DisabilityStatusId]                  		INT NULL
					, [SeclusionOrRestraintStatusId]        		INT NULL
					, [SeclusionOrRestraintCount]   				INT NULL
			)

	INSERT INTO #Facts (
		  [StagingId]
		, [SeclusionOrRestraintId]
		, [SchoolYearId]                         
		, [DataCollectionId]  
		, [K12SchoolId]
		, [LeaAccountabilityId]                  
		, [LeaAttendanceId]                      
		, [LeaFundingId]                         
		, [LeaGraduationID]                      
		, [LeaIndividualizedEducationProgramId]  
		, [IeuId]  
		, [SeaId]                                
		, [K12StudentId]    
		, [GradeLevelId]  
		, [AgeId] 
		, [SeclusionOrRestraintDateId]
		, [SeclusionOrRestraintStatusId]
		, [SeclusionOrRestraintCount]
		)

	SELECT  DISTINCT 
		  ske.Id
		, sksr.Id								AS SeclusionOrRestraintId
		, rsy.DimSchoolYearId
		, rddc.DimDataCollectionId
		, rdksch.DimK12SchoolId					AS K12SchoolId
		, rdlAcc.DimLeaId						AS LeaAccountabilityId
		, rdlAtt.DimLeaId						AS LeaAttendanceId
		, rdlFun.DimLeaId						AS LeaFundingId
		, rdlGrad.DimLeaId						AS LeaGraduationId
		, rdlIep.DimLeaId						AS LeaIndividualizedEducationProgramId
		, rdi.DimIeuId							AS IeuId
		, rds.DimSeaId							AS SeaId
		, rdp.DimPersonId						AS K12StudentId
		, grade.DimGradeLevelId					AS GradeLevelId  
		, kea.DimAgeId							AS AgeId
		, srDate.DimDateId						AS SeclusionOrRestraintDateId    
		, rdsrs.DimSeclusionOrRestraintStatusId	AS SeclusionOrRestraintStatusId
		, sksr.SeclusionOrRestraintCount  
	FROM #K12SeclusionOrRestraint sksr
	INNER JOIN staging.K12Enrollment ske 
		ON sksr.DataCollectionName											= ske.DataCollectionName
		AND sksr.StudentIdentifierState										= ske.StudentIdentifierState
		--AND ISNULL(sksr.LeaIdentifierSeaAccountability, '')					= ISNULL(ske.LeaIdentifierSeaAccountability, '')
		AND ISNULL(sksr.LeaIdentifierSeaAttendance, '')						= ISNULL(ske.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(ske.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(ske.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')								= ISNULL(sksr.SchoolIdentifierSea, '')
	INNER JOIN RDS.DimPeople rdp
		ON ske.StudentIdentifierState										= rdp.K12StudentIdentifierState
		AND ske.RecordStartDateTime											BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
		AND ISNULL(ske.FirstName, 'MISSING')								= ISNULL(rdp.FirstName, 'MISSING')
		AND ISNULL(ske.MiddleName, 'MISSING')								= ISNULL(rdp.MiddleName, 'MISSING')
		AND ISNULL(ske.LastOrSurname, 'MISSING')							= ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(ske.Birthdate, '1/1/1900')								= ISNULL(rdp.BirthDate, '1/1/1900')
	INNER JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	LEFT JOIN #K12EnrollmentAges kea
		ON ske.DataCollectionName											= kea.DataCollectionName
		AND ske.StudentIdentifierState										= kea.StudentIdentifierState
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						= ISNULL(kea.LeaIdentifierSeaAttendance, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')								= ISNULL(kea.SchoolIdentifierSea, '')
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
	LEFT JOIN #vwDimGradeLevels grade
		ON ske.SchoolYear = grade.SchoolYear
		AND ske.GradeLevel = grade.GradeLevelMap
	LEFT JOIN #vwDimSeclusionOrRestraintStatuses rdsrs
		ON sksr.SchoolYear = rdsrs.SchoolYear
		AND 'MISSING'						= rdsrs.ProblemBehaviorTriggerCode
		AND 'MISSING'						= rdsrs.ProblemBehaviorTypeCode
		AND ISNULL(sksr.SeclusionOrRestraintType, 'MISSING') = ISNULL(rdsrs.SeclusionOrRestraintTypeMap, 'MISSING')
		AND 'MISSING'						= rdsrs.SeclusionOrRestraintStudentResponseTypeCode
		AND 'MISSING'						= rdsrs.InterventionFollowupTypeCode
	LEFT JOIN RDS.DimDates srDate
		ON sksr.DateOccurred = srDate.DateValue
	WHERE @DataCollectionName IS NULL
		OR ske.DataCollectionName = @DataCollectionName

	CREATE UNIQUE CLUSTERED INDEX IX_Facts ON #Facts(StagingId, SeclusionOrRestraintId, SeclusionOrRestraintStatusId) 

	UPDATE #Facts
	SET   K12DemographicId								= rdkd.DimK12DemographicId
		, HomelessnessStatusId							= rdhs.DimHomelessnessStatusId
		, EconomicallyDisadvantagedStatusId				= rdeds.DimEconomicallyDisadvantagedStatusId
		, FosterCareStatusId							= rdfcs.DimFosterCareStatusId
		, ImmigrantStatusId								= rdimms.DimImmigrantStatusId
		, PrimaryDisabilityTypeId						= rdidtPrimary.DimIdeaDisabilityTypeId
		, SecondaryDisabilityTypeId						= rdidtSecondary.DimIdeaDisabilityTypeId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId = ske.Id
	JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')															= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')												= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(ske.LeaIdentifierSeaAttendance, '')													= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')														= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')													= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')								= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')															= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')														= ISNULL(sps.StudentIdentifierState, '')
	LEFT JOIN #vwDimK12Demographics rdkd
		ON ske.SchoolYear = rdkd.SchoolYear
		AND ISNULL(ske.Sex, 'MISSING')																	= ISNULL(rdkd.SexMap, rdkd.SexCode)
	LEFT JOIN #vwDimHomelessnessStatuses rdhs
		ON ske.SchoolYear																				= rdhs.SchoolYear
		AND ISNULL(CAST(sps.HomelessnessStatus AS SMALLINT), -1)										= rdhs.HomelessnessStatusMap
		AND ISNULL(sps.HomelessNightTimeResidence, 'MISSING')											= ISNULL(rdhs.HomelessPrimaryNighttimeResidenceMap, rdhs.HomelessPrimaryNighttimeResidenceCode)
		AND ISNULL(CAST(sps.HomelessServicedIndicator AS SMALLINT), -1)									= rdhs.HomelessServicedIndicatorMap
		AND ISNULL(CAST(sps.HomelessUnaccompaniedYouth AS SMALLINT), -1)								= rdhs.HomelessUnaccompaniedYouthStatusMap
	LEFT JOIN #vwDimEconomicallyDisadvantagedStatuses rdeds
		ON ske.SchoolYear																				= rdeds.SchoolYear
		AND ISNULL(CAST(sps.EconomicDisadvantageStatus AS SMALLINT), -1)								= rdeds.EconomicDisadvantageStatusMap
		AND ISNULL(sps.EligibilityStatusForSchoolFoodServicePrograms, 'MISSING')						= ISNULL(rdeds.EligibilityStatusForSchoolFoodServiceProgramsMap, rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode)
		AND ISNULL(CAST(sps.NationalSchoolLunchProgramDirectCertificationIndicator AS SMALLINT), -1)	= rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap
	LEFT JOIN #vwDimFosterCareStatuses rdfcs
		ON ske.SchoolYear																				= rdfcs.SchoolYear
		AND ISNULL(CAST(sps.ProgramType_FosterCare AS SMALLINT), -1)									= rdfcs.ProgramParticipationFosterCareMap
	LEFT JOIN #vwDimImmigrantStatuses rdimms
		ON ske.SchoolYear																				= rdimms.SchoolYear
		AND ISNULL(CAST(sps.ProgramType_Immigrant AS SMALLINT), -1)										= rdimms.TitleIIIImmigrantStatusMap
		AND -1																							= rdimms.TitleIIIImmigrantParticipationStatusMap -- Where in Staging?
	LEFT JOIN #vwDimIdeaDisabilityTypes rdidtPrimary
		ON ske.SchoolYear																				= rdidtPrimary.SchoolYear
		AND ISNULL(sps.PrimaryDisabilityType, 'MISSING')												= ISNULL(rdidtPrimary.IdeaDisabilityTypeMap, rdidtPrimary.IdeaDisabilityTypeCode)
	LEFT JOIN #vwDimIdeaDisabilityTypes rdidtSecondary
		ON ske.SchoolYear																				= rdidtSecondary.SchoolYear
		AND ISNULL(sps.SecondaryDisabilityType, 'MISSING')												= ISNULL(rdidtSecondary.IdeaDisabilityTypeMap, rdidtSecondary.IdeaDisabilityTypeCode)

	UPDATE #Facts
	SET  DisabilityStatusId	= rdds.DimDisabilityStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')								= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')							= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')		= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ske.StudentIdentifierState								= sps.StudentIdentifierState
	JOIN Staging.Disability sd
		ON ske.DataCollectionName												= sd.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sd.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						= ISNULL(sppc.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							= ISNULL(sppc.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						= ISNULL(sppc.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	= ISNULL(sppc.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sd.SchoolIdentifierSea, '')
		AND ske.StudentIdentifierState								= sd.StudentIdentifierState
	JOIN #vwDimDisabilityStatuses rdds
		ON ske.SchoolYear													= rdds.SchoolYear
		AND ISNULL(CAST(sd.DisabilityStatus AS SMALLINT), -1)				= rdds.DisabilityStatusMap
		AND ISNULL(CAST(sps.ProgramType_Section504 AS SMALLINT), -1)		= rdds.Section504StatusMap
		AND ISNULL(sd.DisabilityConditionType, 'MISSING')					= ISNULL(rdds.DisabilityConditionTypeMap, rdds.DisabilityConditionTypeCode)
		AND ISNULL(sd.DisabilityDeterminationSourceType, 'MISSING')		= ISNULL(rdds.DisabilityDeterminationSourceTypeMap, rdds.DisabilityDeterminationSourceTypeCode)

	UPDATE #Facts
	SET  IdeaStatusId	= rdis.DimIdeaStatusId
	FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	LEFT JOIN Staging.PersonStatus sps 
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sps.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')								= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')							= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')		= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sps.StudentIdentifierState, '')
	LEFT JOIN Staging.ProgramParticipationSpecialEducation sppse
		ON ISNULL(ske.DataCollectionName, '')									= ISNULL(sppse.DataCollectionName, '')
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sppse.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')								= ISNULL(sppse.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')							= ISNULL(sppse.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')		= ISNULL(sppse.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sppse.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sppse.StudentIdentifierState, '')
	JOIN #vwDimIdeaStatuses rdis
		ON ske.SchoolYear = rdis.SchoolYear
		AND ISNULL(CAST(sps.IDEAIndicator AS SMALLINT), -1)						= rdis.IdeaIndicatorMap
		AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood, 'MISSING')= ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
		AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge, 'MISSING')		= ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
		AND ISNULL(sppse.SpecialEducationExitReason, 'MISSING')					= ISNULL(rdis.SpecialEducationExitReasonMap, rdis.SpecialEducationExitReasonCode) 

	UPDATE #Facts
	SET  MigrantStatusId	= rdms.DimMigrantStatusId
	FROM #Facts f	
	JOIN Staging.K12Enrollment ske
		ON f.StagingId		= ske.Id
	JOIN Staging.Migrant sm
		ON ske.DataCollectionName												  = sm.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						  = ISNULL(sm.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(ske.LeaIdentifierSeaAttendance, '')						  	= ISNULL(sm.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')							  	= ISNULL(sm.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')						  	= ISNULL(sm.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')	  	= ISNULL(sm.LeaIdentifierSeaIndividualizedEducationProgram, '')
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
	SET   TitleIIIStatusId			= rdtiiis.DimTitleIIIStatusId
    FROM #Facts f
	JOIN Staging.K12Enrollment ske
		ON f.StagingId	= ske.Id
	JOIN Staging.PersonStatus sps 
		ON ske.DataCollectionName												= sps.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(sps.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(sps.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')								= ISNULL(sps.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')							= ISNULL(sps.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')		= ISNULL(sps.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(sps.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(sps.StudentIdentifierState, '')
	LEFT JOIN Staging.ProgramParticipationTitleIII spptiii
		ON ske.DataCollectionName												= spptiii.DataCollectionName
		AND ISNULL(ske.LeaIdentifierSeaAccountability, '')						= ISNULL(spptiii.LeaIdentifierSeaAccountability, '')
		AND ISNULL(ske.LeaIdentifierSeaAttendance, '')							= ISNULL(spptiii.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(ske.LeaIdentifierSeaFunding, '')								= ISNULL(spptiii.LeaIdentifierSeaFunding, '')
		--AND ISNULL(ske.LeaIdentifierSeaGraduation, '')							= ISNULL(spptiii.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')		= ISNULL(spptiii.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ISNULL(ske.SchoolIdentifierSea, '')									= ISNULL(spptiii.SchoolIdentifierSea, '')
		AND ISNULL(ske.StudentIdentifierState, '')								= ISNULL(spptiii.StudentIdentifierState, '')
	LEFT JOIN #vwDimTitleIIIStatuses rdtiiis
		ON ske.SchoolYear														= rdtiiis.SchoolYear
		AND ISNULL(CAST(spptiii.TitleIiiImmigrantStatus AS SMALLINT), -1)		= rdtiiis.TitleIIIProgramParticipationMap 
		AND 'MISSING'															= rdtiiis.FormerEnglishLearnerYearStatusCode -- Where in Staging?
		AND ISNULL(spptiii.Proficiency_TitleIII, 'MISSING')						= ISNULL(rdtiiis.ProficiencyStatusMap, rdtiiis.ProficiencyStatusCode)

	INSERT INTO [RDS].[FactK12StudentSeclusionsOrRestraints] (
						[SchoolYearId]   
					, [DataCollectionId]
					, [K12SchoolId]                         
					, [LeaAccountabilityId]                 
					, [LeaAttendanceId]                     
					, [LeaFundingId]                        
					, [LeaGraduationId]                     
					, [LeaIndividualizedEducationProgramId] 
					, [IeuId]                               
					, [SeaId]                               
					, [K12StudentId]                        
					, [AgeId]                               
					, [GradeLevelId]                        
					, [SeclusionOrRestraintDateId]          
					, [HomelessnessStatusId]                
					, [ImmigrantStatusId]                   
					, [PrimaryDisabilityTypeId]             
					, [SecondaryDisabilityTypeId]           
					, [FosterCareStatusId]                  
					, [TitleIIIStatusId]                    
					, [IdeaStatusId]                        
					, [MigrantStatusId]                     
					, [K12DemographicId]                    
					, [EconomicallyDisadvantagedStatusId]   
					, [DisabilityStatusId]                  
					, [SeclusionOrRestraintStatusId]        
					, [SeclusionOrRestraintCount]           
				)
SELECT		  ISNULL([SchoolYearId]								, -1)
			, ISNULL([DataCollectionId]							, -1)
			, ISNULL([K12SchoolId]								, -1)
			, ISNULL([LeaAccountabilityId]						, -1)
			, ISNULL([LeaAttendanceId]							, -1)
			, ISNULL([LeaFundingId]								, -1)
			, ISNULL([LeaGraduationID]							, -1)
			, ISNULL([LeaIndividualizedEducationProgramId]		, -1)
			, ISNULL([IeuId]									, -1)
			, ISNULL([SeaId]									, -1)
			, ISNULL([K12StudentId]								, -1)
			, ISNULL([AgeId]									, -1)
			, ISNULL([GradeLevelId]								, -1)                      
			, ISNULL([SeclusionOrRestraintDateId]				, -1)
			, ISNULL([HomelessnessStatusId]						, -1)
			, ISNULL([ImmigrantStatusId]						, -1)
			, ISNULL([PrimaryDisabilityTypeId]					, -1)
			, ISNULL([SecondaryDisabilityTypeId]				, -1)
			, ISNULL([FosterCareStatusId]						, -1)
			, ISNULL([TitleIIIStatusId]							, -1)
			, ISNULL([IdeaStatusId]								, -1)
			, ISNULL([MigrantStatusId]							, -1)
			, ISNULL([K12DemographicId]							, -1)
			, ISNULL([EconomicallyDisadvantagedStatusId]		, -1)
			, ISNULL([DisabilityStatusId]						, -1)
			, ISNULL([SeclusionOrRestraintStatusId]				, -1)
			, ISNULL([SeclusionOrRestraintCount]				, -1)
	FROM #Facts
	
	DROP TABLE IF EXISTS #vwDimDisabilityStatuses
	DROP TABLE IF EXISTS #vwDimK12Demographics
	DROP TABLE IF EXISTS #vwDimEconomicallyDisadvantagedStatuses
	DROP TABLE IF EXISTS #vwDimK12EnrollmentStatuses
	DROP TABLE IF EXISTS #vwDimFosterCareStatuses
	DROP TABLE IF EXISTS #vwDimGradeLevels
	DROP TABLE IF EXISTS #vwDimHomelessnessStatuses
	DROP TABLE IF EXISTS #vwDimIdeaStatuses
	DROP TABLE IF EXISTS #vwDimIdeaDisabilityTypes
	DROP TABLE IF EXISTS #vwDimImmigrantStatuses
	DROP TABLE IF EXISTS #vwDimMigrantStatuses
	DROP TABLE IF EXISTS #vwDimTitleIIIStatuses
	DROP TABLE IF EXISTS #vwDimSeclusionOrRestraintStatuses
	DROP TABLE IF EXISTS #SchoolYears
	DROP TABLE IF EXISTS #SKEAges
	DROP TABLE IF EXISTS #K12EnrollmentAges
	DROP TABLE IF EXISTS #K12SeclusionOrRestraint
	DROP TABLE IF EXISTS #Facts

	INSERT INTO RDS.BridgeK12SeclusionOrRestraintRaces
		(
			  [FactK12StudentSeclusionOrRestraintId]
			, [RaceId]
		)
	SELECT DISTINCT
		  rfksr.FactK12StudentSeclusionOrRestraintId
		, ISNULL(rdr.DimRaceId, -1)
	FROM RDS.FactK12StudentSeclusionsOrRestraints rfksr
	JOIN RDS.DimSchoolYears rdsy
		ON rfksr.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfksr.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfksr.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfksr.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfksr.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfksr.LeaFundingId= rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfksr.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfksr.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDataCollections rddc
		ON rfksr.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	LEFT JOIN Staging.K12PersonRace skpr
		ON rdp.K12StudentIdentifierState			= skpr.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '')	= ISNULL(skpr.SchoolIdentifierSea, '')
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(rdlsAtt.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(rdlsFun.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaFunding, '')
		--AND ISNULL(rdlsGrad.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(rdlsIep.LeaIdentifierSea, '')	= ISNULL(skpr.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND rddc.DataCollectionName					= skpr.DataCollectionName
	LEFT JOIN Staging.K12Enrollment ske
		ON rdp.K12StudentIdentifierState									= ske.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '')							= ISNULL(ske.SchoolIdentifierSea, '')
		AND ISNULL(skpr.LeaIdentifierSeaAccountability, '')					= ISNULL(ske.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(skpr.LeaIdentifierSeaAttendance, '')						= ISNULL(ske.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(skpr.LeaIdentifierSeaFunding, '')						= ISNULL(ske.LeaIdentifierSeaFunding, '')
		--AND ISNULL(skpr.LeaIdentifierSeaGraduation, '')						= ISNULL(ske.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(skpr.LeaIdentifierSeaIndividualizedEducationProgram, '') = ISNULL(ske.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND ske.HispanicLatinoEthnicity									= 1
		AND ISNULL(rddc.DataCollectionName, '') = ISNULL(ske.DataCollectionName, '')
	LEFT JOIN RDS.vwDimRaces rdr
		ON skpr.SchoolYear = rdr.SchoolYear
		AND (ISNULL(skpr.RaceType, 'Race and Ethnicity Unknown') = rdr.RaceMap
			OR (ISNULL(ske.HispanicLatinoEthnicity, 0)	= 1
				AND rdr.RaceCode = 'HispanicOrLatinoEthnicity'))
	
	INSERT INTO RDS.BridgeK12SeclusionOrRestraintIdeaDisabilityTypes
		(
			  [FactK12StudentSeclusionOrRestraintId]       
			, [IdeaDisabilityTypeId]
		)
	SELECT DISTINCT
		  rfksr.FactK12StudentSeclusionOrRestraintId
		, ISNULL(rdidt.DimIdeaDisabilityTypeId, -1)
	FROM RDS.FactK12StudentSeclusionsOrRestraints rfksr
	JOIN RDS.DimSchoolYears rdsy
		ON rfksr.SchoolYearId = rdsy.DimSchoolYearId
	JOIN RDS.DimPeople rdp
		ON rfksr.K12StudentId = rdp.DimPersonId
	JOIN RDS.DimK12Schools rdks
		ON rfksr.K12SchoolId = rdks.DimK12SchoolId
	JOIN RDS.DimLeas rdlsAcc
		ON rfksr.LeaAccountabilityId = rdlsAcc.DimLeaID
	JOIN RDS.DimLeas rdlsAtt
		ON rfksr.LeaAttendanceId = rdlsAtt.DimLeaID
	JOIN RDS.DimLeas rdlsFun
		ON rfksr.LeaFundingId = rdlsFun.DimLeaID
	JOIN RDS.DimLeas rdlsGrad
		ON rfksr.LeaGraduationId = rdlsGrad.DimLeaID
	JOIN RDS.DimLeas rdlsIep
		ON rfksr.LeaIndividualizedEducationProgramId = rdlsIep.DimLeaID
	JOIN RDS.DimDataCollections rddc
		ON rfksr.DataCollectionId = rddc.DimDataCollectionId
		AND rddc.DataCollectionName = @DataCollectionName
	LEFT JOIN Staging.IdeaDisabilityType sidt
		ON rdp.K12StudentIdentifierState = sidt.StudentIdentifierState
		AND ISNULL(rdks.SchoolIdentifierSea, '')	= ISNULL(sidt.SchoolIdentifierSea, '')
		AND ISNULL(rdlsAcc.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaAccountability, '')
		--AND ISNULL(rdlsAtt.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaAttendance, '')
		--AND ISNULL(rdlsFun.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaFunding, '')
		--AND ISNULL(rdlsGrad.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaGraduation, '')
		--AND ISNULL(rdlsIep.LeaIdentifierSea, '')	= ISNULL(sidt.LeaIdentifierSeaIndividualizedEducationProgram, '')
		AND rddc.DataCollectionName = sidt.DataCollectionName
	LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidt
		ON sidt.SchoolYear = rdidt.SchoolYear
		AND sidt.IdeaDisabilityType = rdidt.IdeaDisabilityTypeMap
END
