CREATE VIEW [RDS].[vwDimAeProgramTransitionIndicators] 
AS
SELECT rdds.DimAeProgramTransitionIndicatorId, 
sssrd1.SchoolYear,
rdds.AePostsecondaryTransitionActionCode, 
ISNULL(sssrd1.InputCode, 'MISSING') AS AePostsecondaryTransitionActionCodeMap, 
rdds.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode,
ISNULL(sssrd2.InputCode, 'MISSING')  AS AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCodeMap, 
rdds.AdultEducationCredentialAttainmentEmployedIndicatorCode, 
ISNULL(sssrd3.InputCode, 'MISSING') AS AdultEducationCredentialAttainmentEmployedIndicatorCodeMap, 
rdds.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode, 
ISNULL(sssrd4.InputCode, 'MISSING') AS AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCodeMap,
rdds.AdultEducationProgramExitReasonCode, 
ISNULL(sssrd4.InputCode, 'MISSING') AS AdultEducationProgramExitReasonCodeMap
FROM    RDS.DimAeProgramTransitionIndicators AS rdds CROSS JOIN
                (SELECT DISTINCT SchoolYear
               FROM     Staging.SourceSystemReferenceData) AS rsy LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd1 ON rdds.AePostsecondaryTransitionActionCode = sssrd1.OutputCode AND sssrd1.GlobalId = '000784' AND rsy.SchoolYear = sssrd1.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd2 ON rdds.AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode = sssrd2.OutputCode AND sssrd2.GlobalId = '001954' AND rsy.SchoolYear = sssrd2.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd3 ON rdds.AdultEducationCredentialAttainmentEmployedIndicatorCode = sssrd3.OutputCode AND sssrd3.GlobalId = '001955' AND rsy.SchoolYear = sssrd3.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd4 ON rdds.AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode = sssrd4.OutputCode AND sssrd4.GlobalId = '001956' AND rsy.SchoolYear = sssrd4.SchoolYear LEFT OUTER JOIN
            Staging.SourceSystemReferenceData AS sssrd5 ON rdds.AdultEducationProgramExitReasonCode = sssrd5.OutputCode AND sssrd5.GlobalId = '001939' AND rsy.SchoolYear = sssrd5.SchoolYear



