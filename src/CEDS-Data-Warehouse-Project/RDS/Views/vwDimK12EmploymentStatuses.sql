CREATE VIEW [RDS].[vwDimK12EmploymentStatuses]
AS
  SELECT
    DimK12EmploymentStatusId,
    rsy.SchoolYear,
    EmploymentStatusCode,
    sssrd1.InputCode AS EmploymentStatusMap,
    EmploymentSeparationReasonCode,
    sssrd2.InputCode AS EmploymentSeparationReasonMap,
    TitleITargetedAssistanceStaffFundedCode,
    sssrd3.InputCode AS TitleITargetedAssistanceStaffFundedMap,
    MEPPersonnelIndicatorCode,
    sssrd4.InputCode AS MEPPersonnelIndicatorMap
  FROM RDS.DimK12EmploymentStatuses rdkes
  CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
  LEFT JOIN staging.SourceSystemReferenceData sssrd1
    ON rdkes.EmploymentStatusCode = sssrd1.OutputCode
    AND sssrd1.TableName = 'RefEmploymentStatus'
    AND rsy.SchoolYear = sssrd1.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd2
    ON rdkes.EmploymentSeparationReasonCode = sssrd2.OutputCode
    AND sssrd2.TableName = 'RefEmploymentSeparationReason'
    AND rsy.SchoolYear = sssrd2.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd3
    ON rdkes.TitleITargetedAssistanceStaffFundedCode = sssrd3.OutputCode
    AND sssrd3.TableName = 'RefTitleITargetedAssistanceStaffFunded'
    AND rsy.SchoolYear = sssrd3.SchoolYear
  LEFT JOIN staging.SourceSystemReferenceData sssrd4
    ON rdkes.MEPPersonnelIndicatorCode = sssrd4.OutputCode
    AND sssrd4.TableName = 'RefMEPPersonnelIndicator'
    AND rsy.SchoolYear = sssrd4.SchoolYear
