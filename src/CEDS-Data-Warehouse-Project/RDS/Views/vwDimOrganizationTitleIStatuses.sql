CREATE VIEW RDS.vwDimOrganizationTitleIStatuses
AS
	SELECT
		  rdt1s.DimOrganizationTitleIStatusId
		, rsy.SchoolYear
		, rdt1s.TitleIInstructionalServicesCode
		, sssrd1.InputCode AS TitleIInstructionalServicesMap
		, rdt1s.TitleIProgramTypeCode
		, sssrd2.InputCode AS TitleIProgramTypeMap
		, rdt1s.TitleISchoolStatusCode
		, sssrd3.InputCode AS TitleISchoolStatusMap
		, rdt1s.TitleISupportServicesCode
		, sssrd4.InputCode AS TitleISupportServicesMap
	FROM RDS.DimOrganizationTitleIStatuses rdt1s
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdt1s.TitleISupportServicesCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefTitleIInstructionServices'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
		ON rdt1s.TitleIProgramTypeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefTitleIProgramType'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd3
		ON rdt1s.TitleISchoolStatusCode = sssrd2.OutputCode
		AND sssrd3.TableName = 'RefTitleISchoolStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd4
		ON rdt1s.TitleISupportServicesCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefK12LeaTitleISupportService'
		AND rsy.SchoolYear = sssrd4.SchoolYear

GO

