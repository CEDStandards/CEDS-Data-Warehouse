CREATE VIEW RDS.vwDimPsEnrollmentStatuses
AS
	SELECT
		  rdpes.[DimPsEnrollmentStatusId]
		, rsy.SchoolYear
		, rdpes.[PostsecondaryExitOrWithdrawalTypeCode]                
		, ISNULL(sssrd1.InputCode, 'MISSING') AS [PostsecondaryExitOrWithdrawalTypeMap]
		, rdpes.[PostsecondaryEnrollmentStatusCode]
		, ISNULL(sssrd2.InputCode, 'MISSING') AS [PostsecondaryEnrollmentStatusMap]       
	FROM RDS.DimPsEnrollmentStatuses rdpes
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdpes.[PostsecondaryExitOrWithdrawalTypeCode] = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefPSExitOrWithdrawalType'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
		ON rdpes.[PostsecondaryEnrollmentStatusCode] = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefPSEnrollmentStatus'
		AND rsy.SchoolYear = sssrd2.SchoolYear

GO


