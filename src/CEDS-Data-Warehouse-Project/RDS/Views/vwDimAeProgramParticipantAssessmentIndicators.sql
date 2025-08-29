CREATE VIEW [RDS].[vwDimAeProgramParticipantAssessmentIndicators] 
AS
SELECT rdds.DimAeProgramParticipantAssessmentIndicatorId, 
sssrd1.SchoolYear,
rdds.AeFunctioningLevelAtIntakeCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS AeFunctioningLevelAtIntakeCodeMap, 
rdds.AeFunctioningLevelAtPosttestCode,
ISNULL(sssrd2.InputCode, 'MISSING') AS AeFunctioningLevelAtPosttestCodeMap
FROM    RDS.DimAeProgramParticipantAssessmentIndicators AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.AeFunctioningLevelAtIntakeCode = sssrd1.OutputCode AND sssrd1.GlobalId = '000779' AND rsy.SchoolYear = sssrd1.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd2 ON rdds.AeFunctioningLevelAtPosttestCode = sssrd2.OutputCode AND sssrd2.GlobalId = '000780' AND rsy.SchoolYear = sssrd2.SchoolYear



