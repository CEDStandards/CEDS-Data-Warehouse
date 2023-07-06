CREATE VIEW rds.vwDimPsEnrollmentStatuses
AS
	SELECT
		  [DimPsEnrollmentStatusId]
		, sssrd.SchoolYear
		, [PostsecondaryExitOrWithdrawalTypeCode]                
		, ISNULL(sssrd.InputCode, 'MISSING') AS [PostsecondaryExitOrWithdrawalTypeMap]         
	FROM rds.DimPsEnrollmentStatuses rdpes
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdpes.[PostsecondaryExitOrWithdrawalTypeCode] = sssrd.OutputCode
		AND sssrd.TableName = 'RefPSExitOrWithdrawalType'
		AND rsy.SchoolYear = sssrd.SchoolYear
