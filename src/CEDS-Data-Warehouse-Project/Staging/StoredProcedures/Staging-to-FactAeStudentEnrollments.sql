CREATE PROCEDURE [Staging].[Staging-to-FactAeStudentEnrollments]
	@CountDate DATETIME
AS

BEGIN

	WITH BasePopulation AS (
	SELECT 
            StudentIdentifierState
           ,AdultEducationServiceProviderIdentifierSea
           ,FirstName
           ,LastOrSurname
           ,MiddleName
           ,Birthdate
           ,Sex
           ,HispanicLatinoEthnicity
           ,EnrollmentEntryDate
           ,EnrollmentExitDate
           ,HighSchoolDiplomaDiplomaOrCredentialAwardDate
           ,HighSchoolDiplomaType
           ,ProjectedHighSchoolDiplomaType
           ,EconomicDisadvantageStatus
           ,HomelessnessStatus
           ,HomelessPrimaryNighttimeResidence
           ,HomelessUnaccompaniedYouthStatus
           ,EnglishLearnerStatus
           ,PerkinsEnglishLearnerStatus
           ,MigrantStatus
           ,MilitaryConnectedStudentIndicator
           ,ActiveMilitaryStatusIndicator
           ,MilitaryBranch
           ,MilitaryVeteranStatusIndicator
           ,DisabilityStatus
           ,DisabilityConditionType
           ,DisabilityDeterminationSourceType
           ,AeInstructionalProgramType
           ,AeSpecialProgramType
           ,WioaCareerServices
           ,WioaTrainingServices
           ,AePostsecondaryTransitionAction
           ,AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator
           ,AdultEducationCredentialAttainmentEmployedIndicator
           ,AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator
           ,AdultEducationProgramExitReason
           ,EmployedAfterExit
           ,EmployedWhileEnrolled
           ,AeFunctioningLevelAtIntake
           ,AeFunctioningLevelAtPosttest
           ,CorrectionalEducationReentryServicesParticipationIndicator
           ,QuarterlyEarningsAfterExitQ1
           ,QuarterlyEarningsAfterExitQ2
           ,QuarterlyEarningsAfterExitQ3
           ,QuarterlyEarningsAfterExitQ4
           ,QuarterlyEarningsAfterExitQ5
           ,QuarterlyEarningsAfterExitQ6
           ,QuarterlyEarningsAfterExitQ7
           ,QuarterlyEarningsAfterExitQ8
           ,QuarterlyEarningsAfterExitQ9
           ,QuarterlyEarningsAfterExitQ10
           ,QuarterlyEarningsAfterExitQ11
           ,QuarterlyEarningsAfterExitQ12
           ,QuarterlyEarningsAfterExitQ13
           ,InstructionalActivityHoursCompleted
           ,ProgramYear
           ,RecordStartDateTime
           ,RecordEndDateTime
           ,DataCollectionName
	FROM Staging.AeEnrollment sae
	)
INSERT INTO [RDS].[FactAeStudentEnrollments](
            [ProgramYearId]
           ,[DataCollectionId]
           ,[AeStudentId]
           ,[AeProviderId]
           ,[AeProgramTypeId]
           ,[AeProgramTransitionIndicatorId]
           ,[AeProgramEmploymentIndicatorId]
           ,[AeProgramParticipantAssessmentIndicatorId]
           ,[AeProgramParticipantIndicatorId]
           ,[ApplicationDateId]
           ,[EnrollmentEntryDateId]
           ,[EnrollmentExitDateId]
           ,[AePostsecondaryTransitionDateId]
           ,[AeDemographicId]
           ,[EnglishLearnerStatusId]
           ,[HomelessnessStatusId]
           ,[EconomicallyDisadvantagedStatusId]
           ,[MigrantStatusId]
           ,[MilitaryStatusId]
           ,[DisabilityStatusId]
           ,[HighSchoolDiplomaDiplomaOrCredentialAwardDateId]
           ,[K12AcademicAwardStatusId]
           ,[QuarterlyEarningsAfterExitQ1]
           ,[QuarterlyEarningsAfterExitQ2]
           ,[QuarterlyEarningsAfterExitQ3]
           ,[QuarterlyEarningsAfterExitQ4]
           ,[QuarterlyEarningsAfterExitQ5]
           ,[QuarterlyEarningsAfterExitQ6]
           ,[QuarterlyEarningsAfterExitQ7]
           ,[QuarterlyEarningsAfterExitQ8]
           ,[QuarterlyEarningsAfterExitQ9]
           ,[QuarterlyEarningsAfterExitQ10]
           ,[QuarterlyEarningsAfterExitQ11]
           ,[QuarterlyEarningsAfterExitQ12]
           ,[QuarterlyEarningsAfterExitQ13]
           ,[InstructionalActivityHoursCompleted]
           ,[StudentCount]
	)
	SELECT DISTINCT
            rdpy.DimProgramYearId ProgramYearId
           ,ISNULL(rddc.DimDataCollectionId, '-1') DataCollectionId
           ,rdp.DimPersonId AeStudentId
           ,rap.DimAeProviderId AeProviderId
           ,rdapt.DimAeProgramTypeId AeProgramTypeId
           ,rdapti.DimAeProgramTransitionIndicatorId AeProgramTransitionIndicatorId
           ,rdapei.DimAeProgramEmploymentIndicatorId AeProgramEmploymentIndicatorId
           ,rdappai.DimAeProgramParticipantAssessmentIndicatorId AeProgramParticipantAssessmentIndicatorId
           ,rdappi.DimAeProgramParticipantIndicatorId AeProgramParticipantIndicatorId
           ,rddApplicationDate.DimDateId ApplicationDateId
           ,rddEnrollmentEntryDate.DimDateId EnrollmentEntryDateId
           ,rddEnrollmentExitDate.DimDateId EnrollmentExitDateId
           ,rddAdultEducationPostsecondaryTransitionDate.DimDateId AePostsecondaryTransitionDateId
           ,rdad.DimAeDemographicId AeDemographicId
           ,rdels.DimEnglishLearnerStatusId EnglishLearnerStatusId
           ,rdhs.DimHomelessnessStatusId HomelessnessStatusId
           ,rdeds.DimEconomicallyDisadvantagedStatusId EconomicallyDisadvantagedStatusId
           ,rdms.DimMigrantStatusId MigrantStatusId
           ,rdms2.DimMilitaryStatusId MilitaryStatusId
           ,rdds.DimDisabilityStatusId DisabilityStatusId
           ,rddHighSchoolDiplomaDiplomaOrCredentialAwardDate.DimDateId HighSchoolDiplomaDiplomaOrCredentialAwardDateId
           ,rdkaas.DimK12AcademicAwardStatusId K12AcademicAwardStatusId
           ,[QuarterlyEarningsAfterExitQ1]
           ,[QuarterlyEarningsAfterExitQ2]
           ,[QuarterlyEarningsAfterExitQ3]
           ,[QuarterlyEarningsAfterExitQ4]
           ,[QuarterlyEarningsAfterExitQ5]
           ,[QuarterlyEarningsAfterExitQ6]
           ,[QuarterlyEarningsAfterExitQ7]
           ,[QuarterlyEarningsAfterExitQ8]
           ,[QuarterlyEarningsAfterExitQ9]
           ,[QuarterlyEarningsAfterExitQ10]
           ,[QuarterlyEarningsAfterExitQ11]
           ,[QuarterlyEarningsAfterExitQ12]
           ,[QuarterlyEarningsAfterExitQ13]
           ,[InstructionalActivityHoursCompleted]
           ,'1' [StudentCount]
	FROM BasePopulation sae
	JOIN RDS.DimProgramYears rdpy
		ON sae.ProgramYear = rdpy.ProgramYear
	JOIN RDS.DimPeople rdp
		ON sae.StudentIdentifierState = rdp.AeStudentStudentIdentifierState
		AND IsActiveAeStudent = 1
		AND ISNULL(sae.EnrollmentEntryDate, @CountDate) BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
	JOIN RDS.DimAeProviders rap
		ON sae.AdultEducationServiceProviderIdentifierSea = rap.AdultEducationServiceProviderIdentifierSea
		AND rap.RecordEndDateTime IS NULL
	LEFT JOIN RDS.vwDimAeProgramTypes rdapt
		ON ISNULL(sae.AeInstructionalProgramType, 'MISSING') = ISNULL(rdapt.AeInstructionalProgramTypeCodeMap, 'MISSING')
		AND ISNULL(sae.AeSpecialProgramType, 'MISSING')= ISNULL(rdapt.AeSpecialProgramTypeCodeMap, 'MISSING')
		AND ISNULL(sae.WioaCareerServices, 'MISSING') = ISNULL(rdapt.WioaCareerServicesCodeMap, 'MISSING')
		AND ISNULL(sae.WioaTrainingServices, 'MISSING') = ISNULL(rdapt.WioaTrainingServicesCodeMap, 'MISSING')
	LEFT JOIN RDS.vwDimAeProgramTransitionIndicators rdapti
		ON ISNULL(sae.AePostsecondaryTransitionAction, 'MISSING') = ISNULL(rdapti.AePostsecondaryTransitionActionCodeMap, 'MISSING')
            AND ISNULL(sae.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator, 'MISSING') = ISNULL(rdapti.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCodeMap, 'MISSING')
            AND ISNULL(sae.AdultEducationCredentialAttainmentEmployedIndicator, 'MISSING') = ISNULL(rdapti.AdultEducationCredentialAttainmentEmployedIndicatorCodeMap, 'MISSING')
            AND ISNULL(sae.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator, 'MISSING') = ISNULL(rdapti.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCodeMap, 'MISSING')
            AND ISNULL(sae.AdultEducationProgramExitReason, 'MISSING') = ISNULL(rdapti.AdultEducationProgramExitReasonCodeMap, 'MISSING')
	LEFT JOIN RDS.vwDimAeProgramEmploymentIndicators rdapei
		ON ISNULL(sae.EmployedAfterExit, 'MISSING') = ISNULL(rdapei.EmployedAfterExitCodeMap, 'MISSING')
			AND ISNULL(sae.EmployedWhileEnrolled, 'MISSING') = ISNULL(rdapei.EmployedWhileEnrolledCodeMap, 'MISSING')
	LEFT JOIN RDS.vwDimAeProgramParticipantAssessmentIndicators rdappai
		ON ISNULL(sae.AeFunctioningLevelAtIntake, 'MISSING') = ISNULL(rdappai.AeFunctioningLevelAtIntakeCodeMap, 'MISSING')
		AND ISNULL(sae.AeFunctioningLevelAtPosttest, 'MISSING') = ISNULL(rdappai.AeFunctioningLevelAtPosttestCodeMap, 'MISSING')
	LEFT JOIN RDS.vwDimAeProgramParticipantIndicators rdappi
		ON ISNULL(sae.CorrectionalEducationReentryServicesParticipationIndicator, 'MISSING') = ISNULL(rdappi.CorrectionalEducationReentryServicesParticipationIndicatorCodeMap, 'MISSING')
	LEFT JOIN RDS.DimDates rddApplicationDate
		ON ISNULL(sae.ApplicationDate, '1900-01-01') = ISNULL(rddApplicationDate.DateValue, '1900-01-01')
	LEFT JOIN RDS.DimDates rddEnrollmentEntryDate
		ON ISNULL(sae.EnrollmentEntryDate, '1900-01-01') = ISNULL(rddEnrollmentEntryDate.DateValue, '1900-01-01')
	LEFT JOIN RDS.DimDates rddEnrollmentExitDate
		ON ISNULL(sae.EnrollmentExitDate, '1900-01-01') = ISNULL(rddEnrollmentExitDate.DateValue, '1900-01-01')
	LEFT JOIN RDS.DimDates rddAdultEducationPostsecondaryTransitionDate
		ON ISNULL(sae.AdultEducationPostsecondaryTransitionDate, '1900-01-01') = ISNULL(rddAdultEducationPostsecondaryTransitionDate.DateValue, '1900-01-01')
	LEFT JOIN RDS.vwDimAeDemographics rdad
		ON ISNULL(sae.Sex, 'MISSING') = ISNULL(rdad.SexCodeMap, 'MISSING')
	LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
		ON ISNULL(sae.EnglishLearnerStatus, 'MISSING') = ISNULL(rdels.EnglishLearnerStatusMap, 'MISSING')
		AND ISNULL(sae.PerkinsEnglishLearnerStatus, 'MISSING') = ISNULL(rdels.PerkinsEnglishLearnerStatusMap, 'MISSING')
	LEFT JOIN RDS.vwDimHomelessnessStatuses rdhs
		ON ISNULL(sae.HomelessnessStatus, 'MISSING') = ISNULL(rdhs.HomelessnessStatusMap, 'MISSING')
		AND sae.HomelessPrimaryNighttimeResidence = rdhs.HomelessPrimaryNighttimeResidenceMap
		AND sae.HomelessUnaccompaniedYouthStatus = rdhs.HomelessUnaccompaniedYouthStatusMap
		AND rdhs.HomelessServicedIndicatorMap = 'MISSING'
	LEFT JOIN RDS.vwDimEconomicallyDisadvantagedStatuses rdeds
		ON ISNULL(sae.EconomicDisadvantageStatus, 'MISSING') = ISNULL(rdeds.EconomicDisadvantageStatusMap, 'MISSING')
		AND rdeds.EconomicDisadvantageStatusMap = 'MISSING'
		AND rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap = 'MISSING'
	LEFT JOIN RDS.vwDimMigrantStatuses rdms
		ON ISNULL(sae.MigrantStatus, 'MISSING') = ISNULL(rdms.MigrantStatusMap, 'MISSING')
		AND rdms.MigrantEducationProgramEnrollmentTypeMap = 'MISSING'
		AND rdms.ContinuationOfServicesReasonMap = 'MISSING'
		AND rdms.MEPContinuationOfServicesStatusMap = 'MISSING'
		AND rdms.ConsolidatedMEPFundsStatusMap = 'MISSING'
		AND rdms.MigrantEducationProgramServicesTypeMap = 'MISSING'
		AND rdms.MigrantPrioritizedForServicesMap = 'MISSING'
	LEFT JOIN RDS.vwDimMilitaryStatuses rdms2
		ON ISNULL(sae.MilitaryBranch, 'MISSING') = ISNULL(rdms2.MilitaryBranchMap, 'MISSING')
		AND ISNULL(sae.ActiveMilitaryStatusIndicator, 'MISSING') = ISNULL(rdms2.MilitaryActiveStudentIndicatorMap, 'MISSING')
		AND ISNULL(sae.MilitaryConnectedStudentIndicator, 'MISSING') = ISNULL(rdms2.MilitaryConnectedStudentIndicatorMap, 'MISSING')
		AND ISNULL(sae.MilitaryVeteranStatusIndicator, 'MISSING') = ISNULL(rdms2.MilitaryVeteranStudentIndicatorMap, 'MISSING')
	LEFT JOIN RDS.vwDimDisabilityStatuses rdds
		ON ISNULL(sae.DisabilityStatus, 'MISSING') = ISNULL(rdds.DisabilityStatusMap, 'MISSING')
		AND ISNULL(sae.DisabilityConditionType, 'MISSING') = ISNULL(rdds.DisabilityConditionTypeMap, 'MISSING')
		AND ISNULL(sae.DisabilityDeterminationSourceType, 'MISSING') = ISNULL(rdds.DisabilityDeterminationSourceTypeMap, 'MISSING')
		AND rdds.Section504StatusMap = 'MISSING'
	LEFT JOIN RDS.DimDates rddHighSchoolDiplomaDiplomaOrCredentialAwardDate
		ON ISNULL(sae.HighSchoolDiplomaDiplomaOrCredentialAwardDate, '1900-01-01') = ISNULL(rddHighSchoolDiplomaDiplomaOrCredentialAwardDate.DateValue, '1900-01-01')
	LEFT JOIN RDS.vwDimK12AcademicAwardStatuses rdkaas
		ON ISNULL(sae.HighSchoolDiplomaType, 'MISSING') = ISNULL(rdkaas.HighSchoolDiplomaTypeCode, 'MISSING')
		AND ISNULL(sae.ProjectedHighSchoolDiplomaType, 'MISSING') = ISNULL(rdkaas.ProjectedHighSchoolDiplomaType, 'MISSING')
	LEFT JOIN RDS.DimDataCollections rddc
		ON sae.DataCollectionName = rddc.DataCollectionName

	INSERT INTO [RDS].[BridgeAeStudentEnrollmentAeEmploymentBarriers]
				(
					 [FactAeStudentEnrollmentId]
					,[AeEmploymentBarrierId]
				)
	SELECT DISTINCT
				rfase.FactAeStudentEnrollmentId,
				ISNULL(rvdaeb.DimAeEmploymentBarrierId, '-1')
	FROM RDS.FactAeStudentEnrollments rfase
	JOIN RDS.DimPeople rdp
		ON rfase.AeStudentId = rdp.DimPersonId
	JOIN RDS.DimProgramYears rdpy
		ON rfase.ProgramYearId = rdpy.DimProgramYearId
	JOIN RDS.DimAeProviders rdap
		ON rfase.AeProviderId = rdap.DimAeProviderId
	LEFT JOIN Staging.AeEmploymentBarrier saeb
		ON rdp.AeStudentStudentIdentifierState = saeb.StudentIdentifierState
		AND rdpy.ProgramYear = saeb.ProgramYear
		AND rdap.AdultEducationServiceProviderIdentifierSea = saeb.AdultEducationServiceProviderIdentifierSea
	LEFT JOIN RDS.vwDimAeEmploymentBarriers rvdaeb
		ON saeb.WIOABarriersToEmployment = rvdaeb.WIOABarriersToEmploymentCodeMap
		AND saeb.ProgramYear = rvdaeb.SchoolYear


	INSERT INTO [RDS].[BridgeAeStudentEnrollmentAeProgramParticipantGoals]
			   (
					[FactAeStudentEnrollmentId]
				   ,[AeProgramParticipantGoalId]
			   )
	SELECT DISTINCT
			rfase.FactAeStudentEnrollmentId
			,ISNULL(rvdappg.DimAeProgramParticipantGoalId, '-1')
	FROM RDS.FactAeStudentEnrollments rfase
	JOIN RDS.DimPeople rdp
		ON rfase.AeStudentId = rdp.DimPersonId
	JOIN RDS.DimProgramYears rdpy
		ON rfase.ProgramYearId = rdpy.DimProgramYearId
	JOIN RDS.DimAeProviders rdap
		ON rfase.AeProviderId = rdap.DimAeProviderId
	LEFT JOIN Staging.AeProgramParticipantGoal sappg
		ON rdp.AeStudentStudentIdentifierState = sappg.StudentIdentifierState
		AND rdpy.ProgramYear = sappg.ProgramYear
		AND rdap.AdultEducationServiceProviderIdentifierSea = sappg.AdultEducationServiceProviderIdentifierSea
	LEFT JOIN RDS.vwDimAeProgramParticipantGoals rvdappg
		ON sappg.GoalsForAttendingAdultEducation = rvdappg.GoalsForAttendingAdultEducationCodeMap
		AND sappg.ProgramYear = rvdappg.SchoolYear


	INSERT INTO [RDS].[BridgeAeStudentEnrollmentRaces]
			   (
					[FactAeStudentEnrollmentId]
				   ,[RaceId]
			   )
	SELECT DISTINCT
			rfase.FactAeStudentEnrollmentId
			,rvdr.DimRaceId
	FROM RDS.FactAeStudentEnrollments rfase
	JOIN RDS.DimPeople rdp
		ON rfase.AeStudentId = rdp.DimPersonId
	JOIN RDS.DimProgramYears rdpy
		ON rfase.ProgramYearId = rdpy.DimProgramYearId
	JOIN RDS.DimAeProviders rdap
		ON rfase.AeProviderId = rdap.DimAeProviderId
	LEFT JOIN Staging.AeStudentRace sasr
		ON rdp.AeStudentStudentIdentifierState = sasr.StudentIdentifierState
		AND rdpy.ProgramYear = sasr.ProgramYear
		AND rdap.AdultEducationServiceProviderIdentifierSea = sasr.AdultEducationServiceProviderIdentifierSea
	LEFT JOIN RDS.vwDimRaces rvdr
		ON sasr.RaceType = rvdr.RaceMap
		AND sasr.ProgramYear = rvdr.SchoolYear

	INSERT INTO [RDS].[BridgeAeStudentEnrollmentRaces]
			   (
					[FactAeStudentEnrollmentId]
				   ,[RaceId]
			   )
	SELECT DISTINCT
			rfase.FactAeStudentEnrollmentId
			,rvdr.DimRaceId
	FROM RDS.FactAeStudentEnrollments rfase
	JOIN RDS.DimPeople rdp
		ON rfase.AeStudentId = rdp.DimPersonId
	JOIN RDS.DimProgramYears rdpy
		ON rfase.ProgramYearId = rdpy.DimProgramYearId
	JOIN RDS.DimAeProviders rdap
		ON rfase.AeProviderId = rdap.DimAeProviderId
	JOIN RDS.DimDates rddEnrollmentEntryDate
		ON rfase.EnrollmentEntryDateId = rddEnrollmentEntryDate.DimDateId
	JOIN RDS.DimDates rddEnrollmentExitDate
		ON rfase.EnrollmentExitDateId = rddEnrollmentExitDate.DimDateId
	JOIN Staging.AeEnrollment sae
		ON rdp.AeStudentStudentIdentifierState = sae.StudentIdentifierState
		AND rdpy.ProgramYear = sae.ProgramYear
		AND rdap.AdultEducationServiceProviderIdentifierSea = sae.AdultEducationServiceProviderIdentifierSea
		AND rddEnrollmentEntryDate.DateValue = ISNULL(sae.EnrollmentEntryDate, '1900-01-01')
		AND rddEnrollmentExitDate.DateValue = ISNULL(sae.EnrollmentExitDate, '1900-01-01')
	JOIN RDS.vwDimRaces rvdr
		ON CASE WHEN sae.HispanicLatinoEthnicity = '1' THEN 'HispanicOrLatinoEthnicity' ELSE NULL END = rvdr.RaceMap
		AND sae.ProgramYear = rvdr.SchoolYear




END


