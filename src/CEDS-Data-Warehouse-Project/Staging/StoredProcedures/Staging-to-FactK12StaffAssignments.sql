CREATE PROCEDURE [Staging].[Staging-to-FactK12StaffAssignments]
AS
BEGIN

  -- Insert data from Staging.K12StaffAssignment into RDS.FactK12StaffAssignments
  INSERT INTO RDS.FactK12StaffAssignments (
      [LeaID]
    , [SchoolYearId]
    , [K12SchoolId]
    , [K12StaffStatusId]
    , [K12StaffCategoryId]
    , [SeaId]
    , [K12StaffId]
    , [IeuId]
    , [ScedCodeId]
    , [OnetSocOccupationTypeId]
    , [K12EmploymentStatusId]
    , [K12PositionId]
    , [K12JobId]
    , [AssignmentStartDateId]
    , [AssignmentEndDateId]
    , [EmploymentStartDateId]
    , [EmploymentEndDateId]
    , [HireDateId]
    , [InstructionLanguageId]
    , [K12StaffAssignmentStatusId]
    , [K12DemographicId]
    , [EmployerId]
    , [DataCollectionId]
    , [LeaJobClassificationId]
    , [SeaJobClassificationId]
    , [FullTimeEquivalency]
    , [K12StaffAssignmentCount]
  )
  SELECT
      ISNULL(rdl.[DimLeaID], -1)
    , ISNULL(rsy.[DimSchoolYearId], -1)
    , ISNULL(rdksch.[DimK12SchoolId], -1)
    , ISNULL(rdkss.[DimK12StaffStatusId], -1)
    , ISNULL(rdksc.[DimK12StaffCategoryId], -1)
    , ISNULL(rds.[DimSeaId], -1)
    , ISNULL(rdp.[DimPersonId], -1)
    , ISNULL(rdieu.[DimIeuId], -1)
    , ISNULL(rdsc.[DimScedCodeId], -1)
    , ISNULL(rdonet.[DimOnetSocOccupationTypeId], -1)
    , ISNULL(rdkes.[DimK12EmploymentStatusId], -1)
    , ISNULL(rdkp.[DimK12PositionId], -1)
    , ISNULL(rdkj.[DimK12JobId], -1)
    , ISNULL(rda.[DimDateId], -1)
    , ISNULL(rde.[DimDateId], -1)
    , ISNULL(rdes.[DimDateId], -1)
    , ISNULL(rdee.[DimDateId], -1)
    , ISNULL(rdh.[DimDateId], -1)
    , ISNULL(rdi.[DimLanguageId], -1)
    , ISNULL(rdkas.[DimK12StaffAssignmentStatusId], -1)
    , ISNULL(rdkd.[DimK12DemographicId], -1)
    , ISNULL(rdemp.[DimEmployerId], -1)
    , ISNULL(rddc.[DimDataCollectionId],-1)
    , ISNULL(rdljc.[DimLeaJobClassificationId], -1)
    , ISNULL(rdsljc.[DimSeaJobClassificationId], -1)
    , ISNULL(ska.[FullTimeEquivalency], 0)
    , 1
  FROM Staging.K12StaffAssignment ska
  JOIN RDS.DimSchoolYears rsy
    ON ska.SchoolYear = rsy.SchoolYear
  JOIN RDS.DimSeas rds
    ON ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())		
  LEFT JOIN RDS.DimIeus rdieu
    ON ska.IeuOrganizationIdentifierSea = rdieu.IeuOrganizationIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdieu.RecordStartDateTime AND ISNULL(rdieu.RecordEndDateTime, GETDATE())		
  LEFT JOIN RDS.DimLeas rdl
    ON ska.LeaIdentifierSea = rdl.LeaIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())		
  LEFT JOIN RDS.DimK12Schools rdksch
    ON ska.SchoolIdentifierSea = rdksch.SchoolIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
  JOIN RDS.DimPeople rdp
    ON ska.StaffMemberIdentifierState = rdp.K12StaffStaffMemberIdentifierState
    AND IsActiveK12Staff = 1
    AND ISNULL(ska.FirstName, '') = ISNULL(rdp.FirstName, '')
    AND ISNULL(ska.MiddleName, '') = ISNULL(rdp.MiddleName, '')
    AND ISNULL(ska.LastOrSurname, 'MISSING') = rdp.LastOrSurname
    AND ISNULL(ska.Birthdate, '1/1/1900') = ISNULL(rdp.BirthDate, '1/1/1900')
	LEFT JOIN RDS.vwDimK12StaffCategories rdksc 
			ON rsy.SchoolYear = rdksc.SchoolYear
			AND ISNULL(ska.K12StaffClassification, 'MISSING') = ISNULL(rdksc.K12StaffClassificationMap, rdksc.K12StaffClassificationCode)
			AND ISNULL(ska.SpecialEducationStaffCategory, 'MISSING') = ISNULL(rdksc.SpecialEducationSupportServicesCategoryMap, rdksc.SpecialEducationSupportServicesCategoryCode)
			AND ISNULL(ska.TitleIProgramStaffCategory, 'MISSING') = ISNULL(rdksc.TitleIProgramStaffCategoryMap, rdksc.TitleIProgramStaffCategoryCode)
			AND ISNULL(ska.MigrantEducationProgramStaffCategory, 'MISSING') = ISNULL(rdksc.MigrantEducationProgramStaffCategoryMap, rdksc.MigrantEducationProgramStaffCategoryCode)
			AND ISNULL(ska.ProfessionalEducationalJobClassification, 'MISSING') = ISNULL(rdksc.ProfessionalEducationalJobClassificationMap, rdksc.ProfessionalEducationalJobClassificationCode)
  LEFT JOIN RDS.vwDimK12StaffStatuses rdkss
			ON rsy.SchoolYear = rdkss.SchoolYear
			AND ISNULL(ska.SpecialEducationAgeGroupTaught, 'MISSING') = ISNULL(rdkss.SpecialEducationAgeGroupTaughtMap, rdkss.SpecialEducationAgeGroupTaughtCode)
			AND ISNULL(ska.EDFactsTeacherOutOfFieldStatus, 'MISSING') = ISNULL(rdkss.EDFactsTeacherOutOfFieldStatusMap, rdkss.EDFactsTeacherOutOfFieldStatusCode)
			AND ISNULL(ska.EdFactsTeacherInexperiencedStatus, 'MISSING') = ISNULL(rdkss.EdFactsTeacherInexperiencedStatusMap, rdkss.EdFactsTeacherInexperiencedStatusCode)
			AND ISNULL(ska.TeachingCredentialType, 'MISSING') = ISNULL(rdkss.TeachingCredentialTypeMap, rdkss.TeachingCredentialTypeCode)
			AND ISNULL(ska.ParaprofessionalQualificationStatus, 'MISSING') = ISNULL(rdkss.ParaprofessionalQualificationStatusMap, rdkss.ParaprofessionalQualificationStatusCode)
			AND ISNULL(CAST(ska.HighlyQualifiedTeacherIndicator AS SMALLINT), -1) = ISNULL(rdkss.HighlyQualifiedTeacherIndicatorMap, -1)
			AND ISNULL(ska.SpecialEducationTeacherQualificationStatus, 'MISSING') = ISNULL(rdkss.SpecialEducationTeacherQualificationStatusMap, rdkss.SpecialEducationTeacherQualificationStatusCode)
			AND ISNULL(ska.EdFactsCertificationStatus, 'MISSING') = ISNULL(rdkss.EdFactsCertificationStatusMap, rdkss.EdFactsCertificationStatusCode)  
			AND ISNULL(ska.SpecialEducationRelatedServicesPersonnel, 'MISSING') = ISNULL(rdkss.SpecialEducationRelatedServicesPersonnelMap, rdkss.SpecialEducationRelatedServicesPersonnelCode)
			AND ISNULL(ska.TeachingCredentialBasis, 'MISSING') = ISNULL(rdkss.TeachingCredentialBasisMap, rdkss.TeachingCredentialBasisCode)
			AND ISNULL(ska.CTEInstructorIndustryCertification, 'MISSING') = ISNULL(rdkss.CTEInstructorIndustryCertificationMap, rdkss.CTEInstructorIndustryCertificationCode)
			AND ISNULL(ska.SpecialEducationParaprofessional, 'MISSING') = ISNULL(rdkss.SpecialEducationParaprofessionalMap, rdkss.SpecialEducationParaprofessionalCode)
			AND ISNULL(ska.SpecialEducationTeacher, 'MISSING') = ISNULL(rdkss.SpecialEducationTeacherMap, rdkss.SpecialEducationTeacherCode)
  LEFT JOIN RDS.DimScedCodes rdsc
    ON ska.ScedCourseCode = rdsc.ScedCourseCode
  LEFT JOIN RDS.DimOnetSocOccupationTypes rdonet
    ON ska.OnetSocOccupationType = rdonet.OnetSocOccupationTypeCode
  LEFT JOIN RDS.vwDimK12EmploymentStatuses rdkes
    ON rsy.SchoolYear = rdkes.SchoolYear
    AND ISNULL(ska.EmploymentStatusCode, 'MISSING') = ISNULL(rdkes.EmploymentStatusMap, rdkes.EmploymentStatusCode)
    AND ISNULL(ska.EmploymentSeparationReasonCode, 'MISSING') = ISNULL(rdkes.EmploymentSeparationReasonMap, rdkes.EmploymentSeparationReasonCode)
    AND ISNULL(ska.TitleITargetedAssistanceStaffFundedCode, 'MISSING') = ISNULL(rdkes.TitleITargetedAssistanceStaffFundedMap, rdkes.TitleITargetedAssistanceStaffFundedCode)
    AND ISNULL(ska.MEPPersonnelIndicatorCode, 'MISSING') = ISNULL(rdkes.MEPPersonnelIndicatorMap, rdkes.MEPPersonnelIndicatorCode)
  LEFT JOIN RDS.DimK12Positions rdkp
    ON ska.PositionIdentifierSea = rdkp.PositionIdentifierSea
  LEFT JOIN RDS.DimK12Jobs rdkj
    ON ska.JobTitle = rdkj.JobTitle
  LEFT JOIN RDS.DimDates rda
    ON ska.AssignmentStartDate = rda.DateValue
  LEFT JOIN RDS.DimDates rde
    ON ska.AssignmentEndDate = rde.DateValue
  LEFT JOIN RDS.DimDates rdes
    ON ska.EmploymentStartDate = rdes.DateValue
  LEFT JOIN RDS.DimDates rdee
    ON ska.EmploymentEndDate = rdee.DateValue
  LEFT JOIN RDS.DimDates rdh
    ON ska.HireDate = rdh.DateValue
  LEFT JOIN RDS.DimLanguages rdi
    ON ISNULL(ska.InstructionalLanguage, 'MISSING') = rdi.Iso6392LanguageCodeCode
  LEFT JOIN RDS.vwDimK12StaffAssignmentStatuses rdkas
    ON ska.SchoolYear = rdkas.SchoolYear
	AND ISNULL(ska.ItinerantTeacherCode, 'MISSING') = ISNULL(rdkas.ItinerantTeacherMap, rdkas.ItinerantTeacherCode)
    AND ISNULL(ska.ClassroomPositionTypeCode, 'MISSING') = ISNULL(rdkas.ClassroomPositionTypeMap, rdkas.ClassroomPositionTypeCode)
    AND ISNULL(ska.PrimaryAssignmentIndicatorCode, 'MISSING') = ISNULL(rdkas.PrimaryAssignmentIndicatorMap, rdkas.PrimaryAssignmentIndicatorCode)
  LEFT JOIN RDS.vwDimK12Demographics rdkd
    ON ska.SchoolYear = rdkd.SchoolYear
	AND ISNULL(ska.Sex, 'MISSING') = ISNULL(rdkd.SexMap, rdkd.SexCode)
  LEFT JOIN RDS.DimEmployers rdemp
    ON ska.EmployerOrganizationIdentifierSea = rdemp.EmployerOrganizationIdentifierSea
    AND ISNULL(ska.AssignmentEndDate, ska.AssignmentStartDate) BETWEEN rdemp.RecordStartDateTime AND ISNULL(rdemp.RecordEndDateTime, GETDATE())
  LEFT JOIN RDS.DimDataCollections rddc
		ON ska.DataCollectionName = rddc.DataCollectionName
  LEFT JOIN RDS.DimLeaJobClassifications rdljc
    ON ISNULL(ska.LEA_EducationJobTypeCode, 'MISSING') = ISNULL(rdljc.EducationJobTypeCode, 'MISSING')
    AND ISNULL(ska.LEA_LocalJobFunctionCode, 'MISSING') = ISNULL(rdljc.LocalJobFunctionCode, 'MISSING')
    AND ISNULL(ska.LEA_LocalJobCategoryCode, 'MISSING') = ISNULL(rdljc.LocalJobCategoryCode, 'MISSING')
  LEFT JOIN RDS.DimSeaJobClassifications rdsljc
    ON ISNULL(ska.SEA_EducationJobTypeCode, 'MISSING') = ISNULL(rdsljc.EducationJobTypeCode, 'MISSING')
    AND ISNULL(ska.SEA_LocalJobFunctionCode, 'MISSING') = ISNULL(rdsljc.LocalJobFunctionCode, 'MISSING')
    AND ISNULL(ska.SEA_LocalJobCategoryCode, 'MISSING') = ISNULL(rdsljc.LocalJobCategoryCode, 'MISSING')
END

