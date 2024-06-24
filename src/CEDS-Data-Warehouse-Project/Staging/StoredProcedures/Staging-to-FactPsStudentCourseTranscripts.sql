CREATE PROCEDURE [Staging].[Staging-to-FactPsStudentCourseTranscripts]
	@CountDate DATETIME
AS

BEGIN

	WITH BasePopulation AS (
	SELECT 
            InstitutionIpedsUnitId
           ,StudentIdentifierState
           ,FirstName
           ,LastOrSurname
           ,MiddleName
           ,Birthdate
           ,Sex
           ,HispanicOrLatinoEthnicity
           ,AcademicTermDesignator
           ,StateCourseIdentifier
           ,UniversityCourseIdentifier
           ,CipCode
           ,CipUse
           ,CipVersion
           ,EnglishLearnerStatus
           ,PerkinsEnglishLearnerStatus
           ,MigrantStatus
           ,EconomicDisadvantageStatus
           ,HomelessnessStatus
           ,PrimaryDisabilityType
           ,IDEAIndicator
           ,DisabilityStatus
           ,Section504Status
           ,DisabilityConditionType
           ,TitleIIIImmigrantStatus
           ,MilitaryConnectedStudentIndicator
           ,ActiveMilitaryStatusIndicator
           ,MilitaryBranch
           ,MilitaryVeteranStatusIndicator
           ,NumberOfCreditsAttempted
           ,NumberOfCreditsEarned
           ,StudentCourseSectionGradeEarned
           ,CourseGPAApplicability
           ,SchoolYear
           ,DataCollectionName
           ,RunDateTime
	FROM Staging.PsStudentCourseTranscript sae
	)
	INSERT INTO RDS.FactPsStudentCourseTranscripts	
		(
             SchoolYearId
            ,DataCollectionId
            ,PsInstitutionId
            ,PsStudentId
            ,AcademicTermDesignatorId
            ,CipCodeId
            ,StatePsCourseId
            ,UniversityPsCourseId
            ,EnglishLearnerStatusId
            ,PsDemographicId
            ,DisabilityStatusId
            ,EconomicallyDisadvantagedStatusId
            ,HomelessnessStatusId
            ,MigrantStatusId
            ,PrimaryDisabilityTypeId
            ,IdeaStatusId
            ,ImmigrantStatusId
            ,MilitartyStatusId
            ,CourseGradePointAverageIndicatorId
            ,NumberOfCreditsAttempted
            ,NumberOfCreditsEarned
            ,StudentCourseSectionGradeEarned           
		)
	SELECT DISTINCT
             rdsy.DimSchoolYearId SchoolYearId
            ,rddc.DimDataCollectionId DataCollectionId
            ,rdpi.DimPsInstitutionID PsInstitutionId
            ,rdp.DimPersonId PsStudentId
            ,rdatd.DimAcademicTermDesignatorId AcademicTermDesignatorId
            ,rdcc.DimCipCodeId CipCodeId
            ,rdpcState.DimPsCourseId StatePsCourseId
            ,rdpcUniversity.DimPsCourseId UniversityPsCourseId
            ,rdels.DimEnglishLearnerStatusId EnglishLearnerStatusId
            ,rdpd.DimPsDemographicId PsDemographicId
            ,rdds.DimDisabilityStatusId DisabilityStatusId
            ,rdeds.DimEconomicallyDisadvantagedStatusId EconomicallyDisadvantagedStatusId
            ,rdhs.DimHomelessnessStatusId HomelessnessStatusId
            ,rdms.DimMigrantStatusId MigrantStatusId
            ,rdidtPrimary.DimIdeaDisabilityTypeId PrimaryDisabilityTypeId
            ,rdis.DimIdeaStatusId IdeaStatusId
            ,rdis2.DimImmigrantStatusId ImmigrantStatusId
            ,rdms2.DimMilitaryStatusId MilitartyStatusId
            ,rdcgpai.DimCourseGradePointAverageIndicatorId CourseGradePointAverageIndicatorId
            , NumberOfCreditsAttempted
            , NumberOfCreditsEarned
            , StudentCourseSectionGradeEarned   
	FROM BasePopulation sae
	JOIN RDS.DimSchoolYears rdsy
		ON sae.SchoolYear = rdsy.SchoolYear
	JOIN RDS.DimPeople rdp
		ON sae.StudentIdentifierState = rdp.PsStudentStudentIdentifierState
		AND ISNULL(sae.FirstName, 'MISSING') = ISNULL(rdp.FirstName, 'MISSING')
		AND ISNULL(sae.LastOrSurname, 'MISSING') = ISNULL(rdp.LastOrSurname, 'MISSING')
		AND ISNULL(sae.MiddleName, 'MISSING') = ISNULL(rdp.MiddleName, 'MISSING')
		AND ISNULL(sae.Birthdate, '1900-01-01') = ISNULL(rdp.BirthDate, '1900-01-01')
	JOIN RDS.DimPsInstitutions rdpi
		ON sae.InstitutionIpedsUnitId = rdpi.IPEDSIdentifier
		AND rdpi.RecordEndDateTime IS NULL
	LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
		ON ISNULL(sae.EnglishLearnerStatus, 'MISSING') = ISNULL(rdels.EnglishLearnerStatusMap, 'MISSING')
		AND ISNULL(sae.PerkinsEnglishLearnerStatus, 'MISSING') = ISNULL(rdels.PerkinsEnglishLearnerStatusMap, 'MISSING')
	LEFT JOIN RDS.vwDimHomelessnessStatuses rdhs
		ON ISNULL(sae.HomelessnessStatus, 'MISSING') = ISNULL(rdhs.HomelessnessStatusMap, 'MISSING')
		AND rdhs.HomelessPrimaryNighttimeResidenceCode = 'MISSING'
		AND rdhs.HomelessUnaccompaniedYouthStatusCode = 'MISSING'
		AND rdhs.HomelessServicedIndicatorCode = 'MISSING'
	LEFT JOIN RDS.vwDimEconomicallyDisadvantagedStatuses rdeds
		ON ISNULL(sae.EconomicDisadvantageStatus, 'MISSING') = ISNULL(rdeds.EconomicDisadvantageStatusMap, 'MISSING')
		AND rdeds.EconomicDisadvantageStatusCode = 'MISSING'
		AND rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode = 'MISSING'
		AND rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode = 'MISSING'
	LEFT JOIN RDS.vwDimMigrantStatuses rdms
		ON ISNULL(sae.MigrantStatus, 'MISSING') = ISNULL(rdms.MigrantStatusMap, 'MISSING')
		AND rdms.MigrantEducationProgramEnrollmentTypeCode = 'MISSING'
		AND rdms.ContinuationOfServicesReasonCode = 'MISSING'
		AND rdms.MEPContinuationOfServicesStatusCode = 'MISSING'
		AND rdms.ConsolidatedMEPFundsStatusCode = 'MISSING'
		AND rdms.MigrantEducationProgramServicesTypeCode = 'MISSING'
		AND rdms.MigrantPrioritizedForServicesCode = 'MISSING'
	LEFT JOIN RDS.vwDimMilitaryStatuses rdms2
		ON ISNULL(sae.MilitaryBranch, 'MISSING') = ISNULL(rdms2.MilitaryBranchMap, 'MISSING')
		AND ISNULL(sae.ActiveMilitaryStatusIndicator, 'MISSING') = ISNULL(rdms2.MilitaryActiveStudentIndicatorMap, 'MISSING')
		AND ISNULL(sae.MilitaryConnectedStudentIndicator, 'MISSING') = ISNULL(rdms2.MilitaryConnectedStudentIndicatorMap, 'MISSING')
		AND ISNULL(sae.MilitaryVeteranStatusIndicator, 'MISSING') = ISNULL(rdms2.MilitaryVeteranStudentIndicatorMap, 'MISSING')
	LEFT JOIN RDS.vwDimDisabilityStatuses rdds
		ON ISNULL(sae.DisabilityStatus, '-1') = ISNULL(rdds.DisabilityStatusMap, '-1')
		AND ISNULL(sae.Section504Status, '-1') = ISNULL(rdds.Section504StatusMap, '-1')
		AND ISNULL(sae.DisabilityConditionType, 'MISSING') = ISNULL(rdds.DisabilityConditionTypeMap, 'MISSING')
		AND rdds.DisabilityDeterminationSourceTypeCode = 'MISSING'
	LEFT JOIN RDS.DimDataCollections rddc
		ON ISNULL(sae.DataCollectionName, 'MISSING') = ISNULL(rddc.DataCollectionName, 'MISSING')
	LEFT JOIN RDS.vwDimAcademicTermDesignators rdatd
		ON ISNULL(sae.AcademicTermDesignator, 'MISSING') = ISNULL(rdatd.AcademicTermDesignatorMap, 'MISSING')
	LEFT JOIN RDS.DimCipCodes rdcc	
		ON ISNULL(sae.CipCode, 'MISSING') = rdcc.CipCode
		AND ISNULL(sae.CipUse, 'MISSING') = rdcc.CipUseCode
		AND ISNULL(sae.CipVersion, 'MISSING') = rdcc.CipVersionCode
	LEFT JOIN RDS.DimPsCourses rdpcState
		ON sae.StateCourseIdentifier = rdpcState.CourseIdentifier
		AND rdpcState.CourseCodeSystemCode = 'State'
		AND rdpcState.RecordEndDateTime IS NULL
	LEFT JOIN RDS.DimPsCourses rdpcUniversity
		ON sae.StateCourseIdentifier = rdpcUniversity.CourseIdentifier
		AND rdpcUniversity.CourseCodeSystemCode = 'University'
		AND rdpcUniversity.RecordEndDateTime IS NULL
	LEFT JOIN RDS.vwDimPsDemographics rdpd
		ON ISNULL(sae.Sex, 'MISSING') = ISNULL(rdpd.SexMap, 'MISSING')
	LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidtPrimary
		ON ISNULL(sae.PrimaryDisabilityType, 'MISSING') = ISNULL(rdidtPrimary.IdeaDisabilityTypeMap, 'MISSING')
	LEFT JOIN RDS.vwDimIdeaStatuses rdis
		ON ISNULL(sae.IDEAIndicator, '-1')= ISNULL(rdis.IdeaIndicatorMap, '-1')
		AND rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode = 'MISSING'
		AND rdis.IdeaEducationalEnvironmentForSchoolAgeCode = 'MISSING'
		AND rdis.SpecialEducationExitReasonCode = 'MISSING'
	LEFT JOIN RDS.vwDimImmigrantStatuses rdis2
		ON ISNULL(sae.TitleIIIImmigrantStatus, '-1') = ISNULL(rdis2.TitleIIIImmigrantStatusCode, '-1')
		AND rdis2.TitleIIIImmigrantParticipationStatusCode = 'MISSING'
	LEFT JOIN RDS.vwDimCourseGradePointAverageIndicators rdcgpai
		ON ISNULL(sae.CourseGPAApplicability, 'MISSING') = ISNULL(rdcgpai.CourseGradePointAverageApplicabilityMap, 'MISSING')

	INSERT INTO [RDS].[BridgePsStudentCourseTranscriptRaces]
			   (
					[FactPsStudentCourseTranscriptId]
				   ,[RaceId]
			   )
	SELECT DISTINCT
			rfase.FactPsStudentCourseTranscriptId
			,rvdr.DimRaceId
	FROM RDS.FactPsStudentCourseTranscripts rfase
	JOIN RDS.DimPeople rdp
		ON rfase.PsStudentId = rdp.DimPersonId
	JOIN RDS.DimSchoolYears rdpy
		ON rfase.SchoolYearId = rdpy.DimSchoolYearId
	JOIN RDS.DimPsInstitutions rdap
		ON rfase.PsInstitutionId = rdap.DimPsInstitutionID
	LEFT JOIN Staging.PsStudentRace sasr
		ON rdp.PsStudentStudentIdentifierState = sasr.StudentIdentifierState
		AND rdpy.SchoolYear = sasr.SchoolYear
		AND rdap.IPEDSIdentifier = sasr.InstitutionIpedsUnitId
	LEFT JOIN RDS.vwDimRaces rvdr
		ON sasr.RaceType = rvdr.RaceMap
		AND sasr.SchoolYear = rvdr.SchoolYear

	INSERT INTO [RDS].[BridgePsStudentCourseTranscriptRaces]
			   (
					[FactPsStudentCourseTranscriptId]
				   ,[RaceId]
			   )
	SELECT DISTINCT
			rfase.FactPsStudentCourseTranscriptId
			,rvdr.DimRaceId
	FROM RDS.FactPsStudentCourseTranscripts rfase
	JOIN RDS.DimPeople rdp
		ON rfase.PsStudentId = rdp.DimPersonId
	JOIN RDS.DimSchoolYears rdpy
		ON rfase.SchoolYearId = rdpy.DimSchoolYearId
	JOIN RDS.DimPsInstitutions rdap
		ON rfase.PsInstitutionId = rdap.DimPsInstitutionID
	JOIN Staging.PsStudentCourseTranscript sae
		ON rdp.PsStudentStudentIdentifierState = sae.StudentIdentifierState
		AND rdpy.SchoolYear = sae.SchoolYear
		AND rdap.IPEDSIdentifier = sae.InstitutionIpedsUnitId
	JOIN RDS.vwDimRaces rvdr
		ON CASE WHEN sae.HispanicOrLatinoEthnicity = '1' THEN 'HispanicOrLatinoEthnicity' ELSE NULL END = rvdr.RaceMap
		AND sae.SchoolYear = rvdr.SchoolYear

END


