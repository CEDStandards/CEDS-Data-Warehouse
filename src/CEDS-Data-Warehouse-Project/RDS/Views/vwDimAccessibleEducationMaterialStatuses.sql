CREATE VIEW RDS.vwDimAccessibleEducationMaterialStatuses AS
SELECT
    [DimAccessibleEducationMaterialStatusId]
  , rsy.[SchoolYear]
  , [AccessibleFormatIssuedIndicatorCode]
  , sssrd1.InputCode AS AccessibleFormatIssuedIndicatorMap
  , [AccessibleFormatRequiredIndicatorCode]
  , sssrd2.InputCode AS AccessibleFormatRequiredIndicatorMap
  , [AccessibleFormatTypeCode]
  , sssrd3.InputCode AS AccessibleFormatTypeMap
FROM RDS.DimAccessibleEducationMaterialStatuses daems
CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
LEFT JOIN Staging.SourceSystemReferenceData sssrd1
  ON sssrd1.SchoolYear = rsy.SchoolYear
  AND daems.AccessibleFormatIssuedIndicatorCode = sssrd1.OutputCode
  AND sssrd1.TableName = 'RefAccessibleFormatIssuedIndicator'
LEFT JOIN Staging.SourceSystemReferenceData sssrd2
  ON sssrd2.SchoolYear = rsy.SchoolYear
  AND daems.AccessibleFormatRequiredIndicatorCode = sssrd2.OutputCode
  AND sssrd2.TableName = 'RefAccessibleFormatRequiredIndicator'
LEFT JOIN Staging.SourceSystemReferenceData sssrd3
  ON sssrd3.SchoolYear = rsy.SchoolYear
  AND daems.AccessibleFormatTypeCode = sssrd3.OutputCode
  AND sssrd3.TableName = 'RefAccessibleFormatType'
