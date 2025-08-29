CREATE VIEW [RDS].[vwDimAeProgramParticipantIndicators] 
AS
SELECT rdds.DimAeProgramParticipantIndicatorId, 
sssrd1.SchoolYear,
rdds.CorrectionalEducationReentryServicesParticipationIndicatorCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS CorrectionalEducationReentryServicesParticipationIndicatorCodeMap
FROM    RDS.DimAeProgramParticipantIndicators AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.CorrectionalEducationReentryServicesParticipationIndicatorCode = sssrd1.OutputCode AND sssrd1.GlobalId = '001297' AND rsy.SchoolYear = sssrd1.SchoolYear



