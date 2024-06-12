CREATE VIEW [RDS].[vwDimAeEmploymentBarriers] 
AS
SELECT rdds.DimAeEmploymentBarrierId, 
sssrd1.SchoolYear,
rdds.WIOABarriersToEmploymentCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS WIOABarriersToEmploymentCodeMap
FROM    RDS.DimAeEmploymentBarriers AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.WIOABarriersToEmploymentCode = sssrd1.OutputCode AND sssrd1.GlobalId = '001940' AND rsy.SchoolYear = sssrd1.SchoolYear



