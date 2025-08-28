CREATE VIEW RDS.vwDimTeachingCredentialStatuses AS
	SELECT
		DimTeachingCredentialStatusId
		, rsy.SchoolYear
		, rdkss.TeachingCredentialTypeCode 
		, sssrd1.InputCode AS TeachingCredentialTypeMap
		, rdkss.TeachingCredentialBasisCode 
		, sssrd2.InputCode AS TeachingCredentialBasisMap
	FROM RDS.DimTeachingCredentialStatuses rdkss
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdkss.TeachingCredentialBasisCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefTeachingCredentialType'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
		ON rdkss.TeachingCredentialBasisCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefTeachingCredentialBasis'
		AND rsy.SchoolYear = sssrd2.SchoolYear





