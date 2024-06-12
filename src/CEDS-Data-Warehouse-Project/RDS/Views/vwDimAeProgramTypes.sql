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
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.AeInstructionalProgramTypeCode = sssrd1.OutputCode AND sssrd1.GlobalId = '001077' AND rsy.SchoolYear = sssrd1.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd2 ON rdds.AeSpecialProgramTypeCode = sssrd2.OutputCode AND sssrd2.GlobalId = '000782' AND rsy.SchoolYear = sssrd2.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd3 ON rdds.WioaCareerServicesCode = sssrd3.OutputCode AND sssrd3.GlobalId = '001941' AND rsy.SchoolYear = sssrd3.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd4 ON rdds.WioaTrainingServicesCode = sssrd4.OutputCode AND sssrd4.GlobalId = '001942' AND rsy.SchoolYear = sssrd4.SchoolYear


