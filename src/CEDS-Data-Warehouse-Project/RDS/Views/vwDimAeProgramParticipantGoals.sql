CREATE VIEW [RDS].[vwDimAeProgramParticipantGoals] 
AS
SELECT rdds.DimAeProgramParticipantGoalId, 
sssrd1.SchoolYear,
rdds.GoalsForAttendingAdultEducationCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS GoalsForAttendingAdultEducationCodeMap
FROM    RDS.DimAeProgramParticipantGoals AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.GoalsForAttendingAdultEducationCode = sssrd1.OutputCode AND sssrd1.GlobalId = '001940' AND rsy.SchoolYear = sssrd1.SchoolYear



