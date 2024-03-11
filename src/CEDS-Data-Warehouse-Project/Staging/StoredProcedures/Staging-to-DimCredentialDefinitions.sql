/***********************************************************************
Author: AEM Corp
Date:	2/6/2024
Description: Migrates Credential Definitions from Staging to RDS.DimCredentialDefinitions

NOTE: This Stored Procedure processes files: 002, 089
************************************************************************/
CREATE PROCEDURE [Staging].[Staging-to-DimCredentialDefinitions]
	@SchoolYear SMALLINT
AS


  INSERT INTO [RDS].[DimCredentialDefinitions]
  (
    [CredentialDefinitionIdentifierCtid],
    [CredentialDefinitionTitle],
    [CredentialDefinitionDescription],
    [CredentialTypeCode],
    [CredentialTypeDescription],
    [CredentialDefinitionCategorySystem],
    [CredentialDefinitionCategoryType],
    [CredentialDefinitionStatusTypeCode],
    [CredentialDefinitionStatusTypeDescription],
    [CredentialDefinitionIntendedPurposeTypeCode],
    [CredentialDefinitionIntendedPurposeTypeDescription],
    [CredentialDefinitionAssessmentMethodTypeCode],
    [CredentialDefinitionAssessmentMethodTypeDescription],
    [CredentialDefinitionCriteria],
    [CredentialDefinitionCriteriaURL],
    [CredentialDefinitionKeywords],
    [CredentialDefinitionValidationMethodDescription],
    [CredentialImageURL],
    [CredentialDefinitionDateEffective],
    [CTDLAudienceLevelTypeCode],
    [CTDLAudienceLevelTypeDescription],
    [CredentialDefinitionTerminalDegreeIndicatorCode],
    [CredentialDefinitionTerminalDegreeIndicatorDescription],
    [CredentialDefinitionScedCode],
    [CredentialDefinitionLowGradeLevelCode],
    [CredentialDefinitionHighGradeLevelCode]
  )
  SELECT
    cd.[CredentialDefinitionIdentifierCtid],
    cd.[CredentialDefinitionTitle],
    cd.[CredentialDefinitionDescription],
    sssrd1.OutputCode AS [CredentialTypeCode],
    sssrd1.OutputCode AS [CredentialTypeDescription],
    cd.[CredentialDefinitionCategorySystem],
    cd.[CredentialDefinitionCategoryType],
    sssrd2.OutputCode AS [CredentialDefinitionStatusTypeCode],
    sssrd2.OutputCode AS [CredentialDefinitionStatusTypeDescription],
    sssrd3.OutputCode AS [CredentialDefinitionIntendedPurposeTypeCode],
    CASE sssrd3.OutputCode
      WHEN 'GeneralEducation' THEN 'General Education'
      WHEN 'JobOrCareerPreparation' THEN 'Job/Career Preparation'
      WHEN 'MidCareer' THEN 'Mid-Career Level'
      WHEN 'PriorExperience' THEN 'Prior Learning Experience'
      ELSE NULL
    END AS [CredentialDefinitionIntendedPurposeTypeDescription],
    sssrd4.OutputCode AS [CredentialDefinitionAssessmentMethodTypeCode],
    sssrd4.OutputCode AS [CredentialDefinitionAssessmentMethodTypeDescription],
    cd.[CredentialDefinitionCriteria],
    cd.[CredentialDefinitionCriteriaURL],
    cd.[CredentialDefinitionKeywords],
    cd.[CredentialDefinitionValidationMethodDescription],
    cd.[CredentialImageURL],
    cd.[CredentialDefinitionDateEffective],
    sssrd5.OutputCode AS [CTDLAudienceLevelTypeCode],
    CASE sssrd5.OutputCode
      WHEN 'ApprenticeshipCertificate' THEN 'Apprenticeship Certificate'
      WHEN 'AssociateDegree' THEN 'Associate Degree'
      WHEN 'BachelorDegree' THEN 'Bachelor Degree'
      WHEN 'Badge' THEN 'Badge'
      WHEN 'Certificate' THEN 'Certificate'
      WHEN 'Certification' THEN 'Certification'
      WHEN 'ConditionProfile' THEN 'Condition Profile'
      WHEN 'Credential' THEN 'Credential'
      WHEN 'Degree' THEN 'Degree'
      WHEN 'DigitalBadge' THEN 'Digital Badge'
      WHEN 'Diploma' THEN 'Diploma'
      WHEN 'DoctoralDegree' THEN 'Doctoral Degree'
      WHEN 'GeneralEducationDevelopment' THEN 'General Education Development'
      WHEN 'JourneymanCertificate' THEN 'Journeyman Certificate'
      WHEN 'License' THEN 'License'
      WHEN 'MasterCertificate' THEN 'Master Certificate'
      WHEN 'MasterDegree' THEN 'Master Degree'
      WHEN 'MicroCredential' THEN 'Micro Credential'
      WHEN 'OpenBadge' THEN 'Open Badge'
      WHEN 'ProfessionalDoctorate' THEN 'Professional Doctorate'
      WHEN 'QualityAssuranceCredential' THEN 'Quality Assurance Credential'
      WHEN 'ResearchDoctorate' THEN 'Research Doctorate'
      WHEN 'SecondarySchoolDiploma' THEN 'Secondary School Diploma'
    END AS [CTDLAudienceLevelTypeDescription],
    sssrd6.OutputCode AS [CredentialDefinitionTerminalDegreeIndicatorCode],
    sssrd6.OutputCode AS [CredentialDefinitionTerminalDegreeIndicatorDescription],
    cd.[CredentialDefinitionScedCode],
    sssrd8.OutputCode AS [CredentialDefinitionLowGradeLevelCode],
    sssrd9.OutputCode AS [CredentialDefinitionHighGradeLevelCode]
  FROM [Staging].[CredentialDefinition] cd
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd1
    ON cd.CredentialTypeCode = sssrd1.InputCode
    AND sssrd1.TableName = 'RefCredentialType'
    AND @SchoolYear = sssrd1.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd2
    ON cd.CredentialDefinitionStatusTypeCode = sssrd2.InputCode
    AND sssrd2.TableName = 'RefCredentialDefinitionStatusType'
    AND @SchoolYear = sssrd2.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd3
    ON cd.CredentialDefinitionIntendedPurposeTypeCode = sssrd3.InputCode
    AND sssrd3.TableName = 'RefCredentialDefinitionIntendedPurposeType'
    AND @SchoolYear = sssrd3.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd4
    ON cd.CredentialDefinitionAssessmentMethodTypeCode = sssrd4.InputCode
    AND sssrd4.TableName = 'RefCredentialDefinitionAssessmentMethodType'
    AND @SchoolYear = sssrd4.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd5
    ON cd.CTDLAudienceLevelTypeCode = sssrd5.InputCode
    AND sssrd5.TableName = 'RefCTDLAudienceLevelType'
    AND @SchoolYear = sssrd5.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd6
    ON cd.CredentialDefinitionTerminalDegreeIndicatorCode = sssrd6.InputCode
    AND sssrd6.TableName = 'RefCredentialDefinitionTerminalDegreeIndicator'
    AND @SchoolYear = sssrd6.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd8
    ON cd.CredentialDefinitionLowGradeLevelCode = sssrd8.InputCode
    AND sssrd8.TableName = 'RefGradeLevel'
    AND sssrd8.TableFilter = '000100'
    AND @SchoolYear = sssrd8.SchoolYear
  LEFT JOIN [Staging].[SourceSystemReferenceData] sssrd9
    ON cd.CredentialDefinitionHighGradeLevelCode = sssrd9.InputCode
    AND sssrd9.TableName = 'RefGradeLevel'
    AND sssrd9.TableFilter = '000100'
    AND @SchoolYear = sssrd9.SchoolYear
    AND @SchoolYear = sssrd9.SchoolYear