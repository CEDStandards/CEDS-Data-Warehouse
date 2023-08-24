CREATE VIEW rds.vwDimPsAcademicAwardStatuses
AS
	SELECT
		  DimPsAcademicAwardStatusId
		, rsy.SchoolYear
		, PescAwardLevelTypeCode                
		, sssrd1.InputCode AS PescAwardLevelTypeMap         
		, ProfessionalOrTechnicalCredentialConferredCode                
		, sssrd2.InputCode AS ProfessionalOrTechnicalCredentialConferredMap         
	FROM rds.DimPsAcademicAwardStatuses rdpes
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdpes.PescAwardLevelTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefPescAwardLevelType'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdpes.ProfessionalOrTechnicalCredentialConferredCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefProfessionalTechnicalCredentialType'
		AND rsy.SchoolYear = sssrd2.SchoolYear
