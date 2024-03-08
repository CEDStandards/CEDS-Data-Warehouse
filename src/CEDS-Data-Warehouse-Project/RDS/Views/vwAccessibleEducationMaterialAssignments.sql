CREATE VIEW [RDS].[vwAccessibleEducationMaterialAssignments]
  AS 
  
    SELECT 
	  rdsy.SchoolYear
	, rdi.IeuOrganizationIdentifierSea
	, rdi.IeuOrganizationName
	, rdl.LeaIdentifierSea
	, rdl.LeaOrganizationName
	, rdl.LeaTypeCode
	, rdl.LeaTypeDescription
	, rdk12s.SchoolIdentifierSea
	, rdk12s.NameOfInstitution
	, rdk12s.SchoolTypeCode
	, rdk12s.SchoolTypeDescription
	, rdp.BirthDate
	, rdp.FirstName
	, rdp.MiddleName
	, rdp.LastOrSurname
	, rdp.K12StudentStudentIdentifierState
	, rdaemp.AccessibleEducationMaterialProviderName
	, rdaemp.AccessibleEducationMaterialProviderOrganizationIdentifierSea
	, rdaems.AccessibleFormatIssuedIndicatorCode
	, rdaems.AccessibleFormatIssuedIndicatorDescription
	, rdaems.AccessibleFormatRequiredIndicatorCode
	, rdaems.AccessibleFormatRequiredIndicatorDescription
	, rdaems.AccessibleFormatTypeCode
	, rdaems.AccessibleFormatTypeDescription
	, rdds.DisabilityConditionTypeCode
	, rdds.DisabilityConditionTypeDescription
	, rdds.DisabilityStatusCode
	, rdds.DisabilityStatusDescription
	, rded.EconomicDisadvantageStatusCode	
	, rded.EconomicDisadvantageStatusDescription
	, rdels.EnglishLearnerStatusCode
	, rdels.EnglishLearnerStatusDescription
	, rdgl.GradeLevelCode
	, rdis.IdeaIndicatorCode
	, rdis.IdeaEducationalEnvironmentForSchoolAgeCode
	, rdis.IdeaEducationalEnvironmentForSchoolAgeDescription
	, rdkd.SexCode
	, rdiadtPrimary.IdeaDisabilityTypeCode AS PrimaryIdeaDisabilityTypeCode
	, rdiadtPrimary.IdeaDisabilityTypeDescription AS PrimaryIdeaDisabilityTypeDescription
	, rdiadtSecondary.IdeaDisabilityTypeCode AS SecondaryIdeaDisabilityTypeCode
	, rdiadtSecondary.IdeaDisabilityTypeDescription AS SecondaryIdeaDisabilityTypeDescription
	, rdsced.ScedCourseCode
	, rdsced.ScedCourseTitle
	, rddEnrollmentEntryDate.DateValue AS EnrollmentEntryDate
	, rddEnrollmentExitDate.DateValue AS EnrollmentExitDate
	, rddIssuedDate.DateValue AS LearningResourceIssuedDate
	, rddOrderedDate.DateValue AS LearningResourceOrderedDate
	, rddReceivedDate.DateValue AS LearningResourceReceivedDate
	, rddCourseEntryDate.DateValue AS CourseSectionEntryDate
	, rddCourseExitDate.DateValue AS CourseSectionExitDate
	--, rfaema.AssignmentCount
    FROM [RDS].FactK12AccessibleEducationMaterialAssignments rfaema
    JOIN RDS.DimSchoolYears rdsy
      ON rfaema.SchoolYearId = rdsy.DimSchoolYearId
    JOIN RdS.DimSeas rds
      ON rfaema.SeaId = rds.DimSeaId
    JOIN RDS.DimIeus rdi
      ON rfaema.IeuId = rdi.DimIeuId
    JOIN RDS.DimLeas rdl
      ON rfaema.LeaId = rdl.DimLeaId
    JOIN RDS.DimK12Schools rdk12s
      ON rfaema.K12SchoolId = rdk12s.DimK12SchoolId
    JOIN RDS.DimPeople rdp
      ON rfaema.K12StudentId = rdp.DimPersonId
    LEFT JOIN [RDS].[DimAccessibleEducationMaterialProviders] rdaemp
      ON rfaema.AccessibleEducationMaterialProviderId = rdaemp.DimAccessibleEducationMaterialProviderId
    LEFT JOIN [RDS].[DimAccessibleEducationMaterialStatuses] rdaems
      ON rfaema.AccessibleEducationMaterialStatusId = rdaems.DimAccessibleEducationMaterialStatusId
    LEFT JOIN RDS.DimDisabilityStatuses rdds
      ON rfaema.DisabilityStatusId = rdds.DimDisabilityStatusId
    LEFT JOIN RDS.DimEconomicallyDisadvantagedStatuses rded
      ON rfaema.EconomicallyDisadvantagedStatusId = rded.DimEconomicallyDisadvantagedStatusId
    LEFT JOIN RDS.DimEnglishLearnerStatuses rdels
      ON rfaema.EnglishLearnerStatusId = rdels.DimEnglishLearnerStatusId
    LEFT JOIN RDS.DimGradeLevels rdgl
      ON rfaema.EntryGradeLevelId = rdgl.DimGradeLevelId
    LEFT JOIN RDS.DimIdeaStatuses rdis
      ON rfaema.IdeaStatusId = rdis.DimIdeaStatusId
    LEFT JOIN RDS.DimK12Demographics rdkd
      ON rfaema.K12DemographicId = rdkd.DimK12DemographicId
    LEFT JOIN RDS.DimIdeaDisabilityTypes rdiadtPrimary
      ON rfaema.PrimaryIdeaDisabilityTypeId = rdiadtPrimary.DimIdeaDisabilityTypeId
    LEFT JOIN RDS.DimIdeaDisabilityTypes rdiadtSecondary
      ON rfaema.SecondaryIdeaDisabilityTypeId = rdiadtSecondary.DimIdeaDisabilityTypeId    
    LEFT JOIN RDS.DimScedCodes rdsced
      ON rfaema.ScedCodeId = rdsced.DimScedCodeId
    LEFT JOIN RDS.DimDates rddEnrollmentEntryDate
      ON rfaema.EnrollmentEntryDateId = rddEnrollmentEntryDate.DimDateId
    LEFT JOIN RDS.DimDates rddEnrollmentExitDate
      ON rfaema.EnrollmentExitDateId = rddEnrollmentExitDate.DimDateId
    LEFT JOIN RDS.DimDates rddIssuedDate
      ON rfaema.LearningResourceIssuedDateId = rddIssuedDate.DimDateId
    LEFT JOIN RDS.DimDates rddOrderedDate
      ON rfaema.LearningResourceOrderedDateId = rddOrderedDate.DimDateId
    LEFT JOIN RDS.DimDates rddReceivedDate
      ON rfaema.LearningResourceReceivedDateId = rddReceivedDate.DimDateId
    LEFT JOIN RDS.DimDates rddCourseEntryDate
      ON rfaema.CourseSectionStartDateId = rddCourseEntryDate.DimDateId
    LEFT JOIN RDS.DimDates rddCourseExitDate
      ON rfaema.CourseSectionEndDateId = rddCourseExitDate.DimDateId
      
