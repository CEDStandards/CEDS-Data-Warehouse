SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [RDS].[vwDimAeProgramTypes] 
AS
SELECT rdds.DimAeProgramTypeId, 
sssrd1.SchoolYear,
rdds.AeInstructionalProgramTypeCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS AeInstructionalProgramTypeCodeMap, 
rdds.AeSpecialProgramTypeCode,
ISNULL(sssrd2.InputCode, 'MISSING')  AS AeSpecialProgramTypeCodeMap, 
rdds.WioaCareerServicesCode, 
ISNULL(sssrd3.InputCode, 'MISSING') AS WioaCareerServicesCodeMap, 
rdds.WioaTrainingServicesCode, 
ISNULL(sssrd4.InputCode, 'MISSING') AS WioaTrainingServicesCodeMap
FROM    RDS.DimAeProgramTypes AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.AeInstructionalProgramTypeCode = sssrd1.OutputCode AND sssrd1.TableName = 'AdultEducationInstructionalProgramType' AND rsy.SchoolYear = sssrd1.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd2 ON rdds.AeSpecialProgramTypeCode = sssrd2.OutputCode AND sssrd2.TableName = 'AdultEducationSpecialProgramType' AND rsy.SchoolYear = sssrd2.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd3 ON rdds.WioaCareerServicesCode = sssrd3.OutputCode AND sssrd3.TableName = 'WioaCareerServicesCode' AND rsy.SchoolYear = sssrd3.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd4 ON rdds.WioaTrainingServicesCode = sssrd4.OutputCode AND sssrd4.TableName = 'WioaTrainingServicesCode' AND rsy.SchoolYear = sssrd4.SchoolYear







GO


