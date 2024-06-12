CREATE VIEW [RDS].[vwDimAeProgramEmploymentIndicators] 
AS
SELECT rdds.DimAeProgramEmploymentIndicatorId, 
sssrd1.SchoolYear,
rdds.EmployedAfterExitCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS EmployedAfterExitCodeMap, 
rdds.EmployedWhileEnrolledCode,
ISNULL(sssrd2.InputCode, 'MISSING') AS EmployedWhileEnrolledCodeMap
FROM    RDS.DimAeProgramEmploymentIndicators AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.EmployedAfterExitCode = sssrd1.OutputCode AND sssrd1.GlobalId = '000988' AND rsy.SchoolYear = sssrd1.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd2 ON rdds.EmployedWhileEnrolledCode = sssrd2.OutputCode AND sssrd2.GlobalId = '000987' AND rsy.SchoolYear = sssrd2.SchoolYear



