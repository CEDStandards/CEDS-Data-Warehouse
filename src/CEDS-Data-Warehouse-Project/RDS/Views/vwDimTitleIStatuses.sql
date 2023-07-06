create VIEW RDS.vwDimTitleIStatuses
AS
	SELECT
		  rdt1s.DimTitleIStatusId
		, rsy.SchoolYear
		, rdt1s.TitleIInstructionalServicesCode
		, sssrd1.InputCode AS TitleIInstructionalServicesMap
		, rdt1s.TitleIProgramTypeCode
		, sssrd2.InputCode AS TitleIProgramTypeMap
		, rdt1s.TitleISchoolStatusCode
		, sssrd3.InputCode AS TitleISchoolStatusMap
		, rdt1s.TitleISupportServicesCode
		, sssrd4.InputCode AS TitleISupportServicesMap
	FROM rds.DimTitleIStatuses rdt1s
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdt1s.TitleISupportServicesCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefTitleIInstructionServices'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdt1s.TitleIProgramTypeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefTitleIProgramType'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdt1s.TitleISchoolStatusCode = sssrd2.OutputCode
		AND sssrd3.TableName = 'RefTitleISchoolStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdt1s.TitleISupportServicesCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefK12LeaTitleISupportService'
		AND rsy.SchoolYear = sssrd4.SchoolYear

GO

