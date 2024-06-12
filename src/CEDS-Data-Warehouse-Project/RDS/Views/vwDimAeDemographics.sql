CREATE VIEW [RDS].[vwDimAeDemographics] 
AS
SELECT rdds.DimAeDemographicId, 
sssrd1.SchoolYear,
rdds.SexCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS SexCodeMap
FROM    RDS.DimAeDemographics AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.SexCode = sssrd1.OutputCode AND sssrd1.GlobalId = '000255' AND rsy.SchoolYear = sssrd1.SchoolYear



