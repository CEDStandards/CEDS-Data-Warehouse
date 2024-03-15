CREATE VIEW [RDS].[vwDimRuralStatuses]
AS
SELECT
  [DimRuralStatusId],
  rsy.SchoolYear,
  [ERSRuralUrbanContinuumCodeCode],
  ssrd.OutputCode AS [ERSRuralUrbanContinuumCodeMap],
  [RuralResidencyStatusCode],
  ssrd2.OutputCode AS [RuralResidencyStatusMap]
FROM [RDS].[DimRuralStatuses] drs
CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
LEFT JOIN [Staging].[SourceSystemReferenceData] ssrd
  ON rsy.SchoolYear = ssrd.SchoolYear
  AND drs.[ERSRuralUrbanContinuumCodeCode] = ssrd.InputCode
  AND ssrd.TableName = 'RefERSRuralUrbanContinuumCode'
LEFT JOIN [Staging].[SourceSystemReferenceData] ssrd2
  ON rsy.SchoolYear = ssrd2.SchoolYear
  AND drs.[RuralResidencyStatusCode] = ssrd2.InputCode
  AND ssrd2.TableName = 'RefRuralResidencyStatus'
	