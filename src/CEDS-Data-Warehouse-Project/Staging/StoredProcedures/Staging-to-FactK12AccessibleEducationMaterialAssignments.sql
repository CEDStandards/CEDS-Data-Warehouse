CREATE PROCEDURE [Staging].[Staging-to-FactK12AccessibleEducationMaterialAssignments]
	@CountDate DATETIME
AS

BEGIN

	INSERT INTO RDS.FactK12AccessibleEducationMaterialAssignments (
		 [SchoolYearId]
		,[CountDateId]
		,[K12StudentId]
		,[SeaId]
		,[IeuId]
		,[LeaId]
		,[K12SchoolId]
		,[AccessibleEducationMaterialProviderId]
		,[AccessibleEducationMaterialStatusId]
		,[DataCollectionId]
		,[AgeId]
		,[DisabilityStatusId]
		,[EconomicallyDisadvantagedStatusId]
		,[EnglishLearnerStatusId]
		,[EntryGradeLevelId]
		,[FosterCareStatusId]
		,[HomelessnessStatusId]
		,[IdeaStatusId]
		,[ImmigrantStatusId]
		,[K12CourseId]
		,[K12DemographicId]
		,[K12EnrollmentStatusId]
		,[MigrantStatusId]
		,[MilitaryStatusId]
		,[RaceId]
		,[PrimaryIdeaDisabilityTypeId]
		,[SecondaryIdeaDisabilityTypeId]
		,[ScedCodeId]
		,[EnrollmentEntryDateId]
		,[EnrollmentExitDateId]
		,[StatusStartDateEconomicallyDisadvantagedId]
		,[StatusEndDateEconomicallyDisadvantagedId]
		,[StatusStartDateEnglishLearnerId]
		,[StatusEndDateEnglishLearnerId]
		,[StatusStartDateHomelessnessId]
		,[StatusEndDateHomelessnessId]
		,[StatusStartDateIdeaId]
		,[StatusEndDateIdeaId]
		,[StatusStartDateMigrantId]
		,[StatusEndDateMigrantId]
		,[StatusStartDateMilitaryId]
		,[StatusEndDateMilitaryId]
		,[StatusStartDatePerkinsEnglishLearnerId]
		,[StatusEndDatePerkinsEnglishLearnerId]
		,[LearningResourceIssuedDateId]
		,[LearningResourceOrderedDateId]
		,[LearningResourceReceivedDateId]
		,[CourseSectionStartDateId]
		,[CourseSectionEndDateId]
	)
	SELECT DISTINCT
		  ISNULL(rsy.DimSchoolYearId, -1)									SchoolYearId
		, ISNULL(rddCountDate.DimDateId, -1)								CountDateId
		, ISNULL(rdp.DimPersonId, -1)										K12StudentId
		, ISNULL(rds.DimSeaId, -1)											SeaId
		, -1																IeuId
		, ISNULL(rdl.DimLeaId, -1)											LeaId
		, ISNULL(rdksch.DimK12SchoolId, -1)									K12SchoolId
		, ISNULL(rdaemp.DimAccessibleEducationMaterialProviderId, -1)		AccessibleEducationMaterialProviderId
		, ISNULL(rdaems.DimAccessibleEducationMaterialStatusId, -1)			AccessibleEducationMaterialStatusId
		, -1																DataCollectionId
		, ISNULL(rda.DimAgeId, -1)											AgeId
		, ISNULL(rdds.DimDisabilityStatusId, -1)							DisabilityStatusId
		, ISNULL(rdeds.DimEconomicallyDisadvantagedStatusId, -1)			EconomicallyDisadvantagedStatusId
		, ISNULL(rdels.DimEnglishLearnerStatusId, -1)						EnglishLearnerStatusId
		, ISNULL(rgls.DimGradeLevelId, -1)									EntryGradeLevelId
		, -1																FosterCareStatusId
		, -1																HomelessnessStatusId
		, ISNULL(rdis.DimIdeaStatusId, -1)									IdeaStatusId
		, -1																ImmigrantStatusId	
		, ISNULL(rdkc.DimK12CourseId, -1)									K12CourseId
		, ISNULL(rdkd.DimK12DemographicId, -1)								K12DemographicId
		, -1																K12EnrollmentStatusId
		, -1																MigrantStatusId
		, -1																MilitaryStatusId
		, ISNULL(rdr.DimRaceId, -1)											RaceId
		, ISNULL(rdidtPrimary.DimIdeaDisabilityTypeId, -1)					PrimaryIdeaDisabilityTypeId
		, ISNULL(rdidtSecondary.DimIdeaDisabilityTypeId, -1)				SecondaryIdeaDisabilityTypeId
		, ISNULL(rdsc.DimScedCodeId, -1)									ScedCodeId
		, ISNULL(rddEnrollmentEntryDate.DimDateId, -1)						EnrollmentEntryDateId
		, ISNULL(rddEnrollmentExitDate.DimDateId, -1)						EnrollmentExitDateId
		, ISNULL(rddEconolicallyDisadvantagedStatusStartDateTime.DimDateId, -1)			StatusStartDateEconomicallyDisadvantagedId
		, ISNULL(rddEconolicallyDisadvantagedStatusEndDateTime.DimDateId, -1)			StatusEndDateEconomicallyDisadvantagedId
		, -1																StatusStartDateEnglishLearnerId
		, -1																StatusEndDateEnglishLearnerId
		, -1																StatusStartDateHomelessnessId
		, -1																StatusEndDateHomelessnessId
		, -1																StatusStartDateIdeaId
		, -1																StatusEndDateIdeaId
		, -1																StatusStartDateMigrantId
		, -1																StatusEndDateMigrantId
		, -1																StatusStartDateMilitaryId
		, -1																StatusEndDateMilitaryId
		, -1																StatusStartDatePerkinsEnglishLearnerId
		, -1																StatusEndDatePerkinsEnglishLearnerId
		, ISNULL(rddIssuedDate.DimDateId, -1)								LearningResourceIssuedDateId
		, ISNULL(rddOrderedDate.DimDateId, -1)								LearningResourceOrderedDateId
		, ISNULL(rddReceivedDate.DimDateId, -1)								LearningResourceReceivedDateId
		, ISNULL(rddCourseEntryDate.DimDateId, -1)							CourseSectionStartDateId
		, ISNULL(rddCourseExitDate.DimDateId, -1)							CourseSectionEndDateId
	FROM Staging.K12Enrollment ske
	LEFT JOIN Staging.AccessibleEducationMaterialAssignment saema
		ON saema.K12StudentStudentIdentifierState = ske.StudentIdentifierState
		AND ISNULL(saema.LeaIdentifierSea,'') = ISNULL(ske.LEAIdentifierSeaAccountability,'')
		AND ISNULL(saema.SchoolIdentifierSea,'') = ISNULL(ske.SchoolIdentifierSea,'')
		AND ske.SchoolYear = saema.SchoolYear
	JOIN RDS.DimSchoolYears rsy
		ON ske.SchoolYear = rsy.SchoolYear
	JOIN RDS.vwDimK12Demographics rdkd
		ON rsy.SchoolYear = rdkd.SchoolYear
		AND ISNULL(ske.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
	LEFT JOIN RDS.DimLeas rdl
		ON ske.LeaIdentifierSeaAccountability = rdl.LeaIdentifierSea
		and rdl.RecordEndDateTime IS NULL
	LEFT JOIN RDS.DimSeas rds
		ON rds.RecordEndDateTime IS NULL
		AND rds.DimSeaId > -1
	LEFT JOIN RDS.DimAccessibleEducationMaterialProviders rdaemp
		ON saema.AccessibleEducationMaterialProviderOrganizationIdentifierSea = rdaemp.AccessibleEducationMaterialProviderOrganizationIdentifierSea
		AND saema.LearningResourceIssuedDate BETWEEN rdaemp.RecordStartDateTime AND ISNULL(rdaemp.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.vwDimAccessibleEducationMaterialStatuses rdaems
		ON ISNULL(saema.AccessibleFormatIssuedIndicatorCode, 'MISSING') = ISNULL(rdaems.AccessibleFormatIssuedIndicatorMap, rdaems.AccessibleFormatIssuedIndicatorCode)
		AND ISNULL(saema.AccessibleFormatRequiredIndicatorCode, 'No') = ISNULL(rdaems.AccessibleFormatRequiredIndicatorMap, rdaems.AccessibleFormatRequiredIndicatorCode)
		and ISNULL(saema.AccessibleFormatTypeCode, 'MISSING') = ISNULL(rdaems.AccessibleFormatTypeMap, rdaems.AccessibleFormatTypeCode)
	LEFT JOIN RDS.DimAges rda
		ON RDS.Get_Age(ske.Birthdate, @CountDate) = rda.AgeValue
	LEFT JOIN RDS.vwDimGradeLevels rgls
		ON ske.GradeLevel = ISNULL(rgls.GradeLevelMap, rgls.GradeLevelCode)
		AND rgls.GradeLevelTypeDescription = 'Entry Grade Level'
	LEFT JOIN Staging.Disability sd 
		ON ske.StudentIdentifierState = sd.StudentIdentifierState
		AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(sd.LeaIdentifierSeaAccountability,'')
		AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(sd.SchoolIdentifierSea,'')
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN sd.Disability_StatusStartDate AND ISNULL(sd.Disability_StatusEndDate, GETDATE())
	LEFT JOIN RDS.vwDimDisabilityStatuses rdds
		ON ISNULL(CAST(sd.DisabilityStatus AS INT), -1) = ISNULL(rdds.DisabilityStatusMap, rdds.DisabilityStatusCode)
		AND ISNULL(CAST(sd.Section504Status AS INT), -1) = ISNULL(rdds.Section504StatusMap, rdds.Section504StatusCode)
		AND ISNULL(sd.DisabilityConditionType, 'MISSING') = ISNULL(rdds.DisabilityConditionTypeMap, rdds.DisabilityConditionTypeCode)
		AND ISNULL(sd.DisabilityDeterminationSourceType, 'MISSING') = ISNULL(rdds.DisabilityDeterminationSourceTypeMap, rdds.DisabilityDeterminationSourceTypeCode)
	LEFT JOIN Staging.ProgramParticipationSpecialEducation sppse
		ON ske.StudentIdentifierState = sppse.StudentIdentifierState
		AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(sppse.LeaIdentifierSeaAccountability,'')
		AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(sppse.SchoolIdentifierSea,'')
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN sppse.ProgramParticipationBeginDate AND ISNULL(sppse.ProgramParticipationEndDate, GETDATE())
	LEFT JOIN Staging.IdeaDisabilityType sidt	
		ON ske.SchoolYear = sidt.SchoolYear
		AND sidt.StudentIdentifierState = sppse.StudentIdentifierState
		AND ISNULL(sidt.LeaIdentifierSeaAccountability, '') = ISNULL(sppse.LeaIdentifierSeaAccountability, '')
		AND ISNULL(sidt.SchoolIdentifierSea, '') = ISNULL(sppse.SchoolIdentifierSea, '')
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN sidt.RecordStartDateTime AND ISNULL(sidt.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.DimDates rddCountDate
		ON saema.CountDate = rddCountDate.DateValue
	LEFT JOIN RDS.DimDates rddEnrollmentEntryDate
		ON ske.EnrollmentEntryDate = rddEnrollmentEntryDate.DateValue
	LEFT JOIN RDS.DimDates rddEnrollmentExitDate
		ON ske.EnrollmentExitDate = rddEnrollmentExitDate.DateValue
	LEFT JOIN RDS.DimDates rddIssuedDate
		ON saema.LearningResourceIssuedDate = rddIssuedDate.DateValue
	LEFT JOIN RDS.DimDates rddOrderedDate
		ON saema.LearningResourceOrderedDate = rddOrderedDate.DateValue
	LEFT JOIN RDS.DimDates rddReceivedDate
		ON saema.LearningResourceReceivedDate = rddReceivedDate.DateValue
	LEFT JOIN Staging.K12StudentCourseSection skscs
		ON ske.StudentIdentifierState = skscs.StudentIdentifierState
		AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(skscs.LeaIdentifierSeaAccountability,'')
		AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(skscs.SchoolIdentifierSea,'')
		AND ISNULL(saema.ScedCourseCode, '') = ISNULL(skscs.ScedCourseCode, '')
		AND ISNULL(saema.CourseIdentifier, '') = ISNULL(skscs.CourseIdentifier, '')
		AND ISNULL(saema.CourseCodeSystemCode, '') = ISNULL(skscs.CourseCodeSystemCode, '')
	LEFT JOIN RDS.DimDates rddCourseEntryDate
		ON skscs.EntryDate = rddCourseEntryDate.DateValue
	LEFT JOIN RDS.DimDates rddCourseExitDate
		ON skscs.ExitDate = rddCourseExitDate.DateValue
	LEFT JOIN RDS.DimScedCodes rdsc
		ON saema.ScedCourseCode = rdsc.ScedCourseCode
	LEFT JOIN RDS.DimK12Courses rdkc
		ON saema.CourseIdentifier = rdkc.CourseIdentifier
		AND saema.CourseCodeSystemCode = rdkc.CourseCodeSystemCode
	LEFT JOIN RDS.DimK12Schools rdksch
		ON ske.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
	LEFT JOIN Staging.PersonStatus el 
		ON ske.StudentIdentifierState = el.StudentIdentifierState
		AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(el.LeaIdentifierSeaAccountability,'')
		AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(el.SchoolIdentifierSea,'')
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN el.EnglishLearner_StatusStartDate AND ISNULL(el.EnglishLearner_StatusEndDate, GETDATE())
	LEFT JOIN Staging.PersonStatus ed 
		ON ske.StudentIdentifierState = ed.StudentIdentifierState
		AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(ed.LeaIdentifierSeaAccountability,'')
		AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(ed.SchoolIdentifierSea,'')
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN ed.EconomicDisadvantage_StatusStartDate AND ISNULL(ed.EconomicDisadvantage_StatusEndDate, GETDATE())
	LEFT JOIN RDS.DimDates rddEconolicallyDisadvantagedStatusStartDateTime
		ON ed.EconomicDisadvantage_StatusStartDate = rddEconolicallyDisadvantagedStatusStartDateTime.DateValue
	LEFT JOIN RDS.DimDates rddEconolicallyDisadvantagedStatusEndDateTime
		ON ed.EconomicDisadvantage_StatusEndDate = rddEconolicallyDisadvantagedStatusEndDateTime.DateValue
	LEFT JOIN RDS.vwDimEnglishLearnerStatuses rdels
		ON rsy.SchoolYear = rdels.SchoolYear
		AND ISNULL(CAST(el.PerkinsEnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.PerkinsEnglishLearnerStatusMap, rdels.PerkinsEnglishLearnerStatusCode)
		AND ISNULL(CAST(el.EnglishLearnerStatus AS SMALLINT), -1) = ISNULL(rdels.EnglishLearnerStatusMap, rdels.EnglishLearnerStatusCode)
	LEFT JOIN RDS.vwDimEconomicallyDisadvantagedStatuses rdeds
		ON rsy.SchoolYear = rdeds.SchoolYear
		AND ISNULL(CAST(ed.EconomicDisadvantageStatus AS SMALLINT), -1) = ISNULL(rdeds.EconomicDisadvantageStatusMap, rdeds.EconomicDisadvantageStatusCode)
		AND ISNULL(ed.EligibilityStatusForSchoolFoodServicePrograms, 'MISSING') = ISNULL(rdeds.EligibilityStatusForSchoolFoodServiceProgramsMap, rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode)
		AND ISNULL(CAST(ed.NationalSchoolLunchProgramDirectCertificationIndicator AS SMALLINT), -1) = ISNULL(rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorMap, rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode)
	JOIN RDS.DimPeople rdp
		ON ske.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
		AND IsActiveK12Student = 1
		AND ISNULL(ske.FirstName, '') = ISNULL(rdp.FirstName, '')
		AND ISNULL(ske.MiddleName, '') = ISNULL(rdp.MiddleName, '')
		AND ISNULL(ske.LastOrSurname, 'MISSING') = rdp.LastOrSurname
		AND ISNULL(ske.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
		AND ISNULL(saema.LearningResourceIssuedDate, @CountDate) BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
	LEFT JOIN RDS.vwDimIdeaStatuses rdis
		ON rdis.IdeaIndicatorCode = 'Yes'
		AND rdis.SpecialEducationExitReasonCode = 'MISSING'
		AND ISNULL(sppse.IDEAEducationalEnvironmentForEarlyChildhood,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForEarlyChildhoodMap, rdis.IdeaEducationalEnvironmentForEarlyChildhoodCode)
		AND ISNULL(sppse.IDEAEducationalEnvironmentForSchoolAge,'MISSING') = ISNULL(rdis.IdeaEducationalEnvironmentForSchoolAgeMap, rdis.IdeaEducationalEnvironmentForSchoolAgeCode)
	LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidtPrimary
		ON sidt.SchoolYear = rdidtPrimary.SchoolYear
		AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidtPrimary.IdeaDisabilityTypeMap, rdidtPrimary.IdeaDisabilityTypeCode)
		AND sidt.IsPrimaryDisability = 1
	LEFT JOIN RDS.vwDimIdeaDisabilityTypes rdidtSecondary
		ON sidt.SchoolYear = rdidtSecondary.SchoolYear
		AND ISNULL(sidt.IdeaDisabilityTypeCode, 'MISSING') = ISNULL(rdidtSecondary.IdeaDisabilityTypeMap, rdidtSecondary.IdeaDisabilityTypeCode)
		AND sidt.IsSecondaryDisability = 1
	LEFT JOIN rds.vwUnduplicatedRaceMap spr
		ON ske.StudentIdentifierState = spr.StudentIdentifierState
		AND ISNULL(ske.LEAIdentifierSeaAccountability,'') = ISNULL(spr.LeaIdentifierSeaAccountability,'')
		AND ISNULL(ske.SchoolIdentifierSea,'') = ISNULL(spr.SchoolIdentifierSea,'')
		AND ske.SchoolYear = spr.SchoolYear
	LEFT JOIN rds.vwDimRaces rdr
		ON ISNULL(rdr.RaceMap, rdr.RaceCode) =
			CASE
				when ske.HispanicLatinoEthnicity = 1 then 'HispanicorLatinoEthnicity'
				WHEN spr.RaceMap IS NOT NULL THEN spr.RaceMap
				ELSE 'Missing'
			END
	LEFT JOIN rds.vwDimRuralStatuses rrs
		ON ske.SchoolYear = rrs.SchoolYear
		AND ISNULL(ske.ERSRuralUrbanContinuumCode, 'MISSING') = ISNULL(rrs.ERSRuralUrbanContinuumCodeMap, rrs.ERSRuralUrbanContinuumCodeCode)
		AND ISNULL(ske.RuralResidencyStatus, 'MISSING') = ISNULL(rrs.RuralResidencyStatusMap, rrs.RuralResidencyStatusCode)
	WHERE sd.Section504Status = 1 
		OR sppse.IdeaIndicator = 1 
END