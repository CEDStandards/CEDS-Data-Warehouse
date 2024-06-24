CREATE VIEW RDS.vwDimK12AcademicAwardStatuses
AS
	SELECT
		  DimK12AcademicAwardStatusId
		, rsy.SchoolYear
		, HighSchoolDiplomaTypeCode
		, ISNULL(sssrd1.InputCode, 'MISSING') AS HighSchoolDiplomaTypeMap
		, ProjectedHighSchoolDiplomaTypeCode
		, ISNULL(sssrd2.InputCode, 'MISSING') AS ProjectedHighSchoolDiplomaTypeMap
	FROM rds.DimK12AcademicAwardStatuses rdkaas
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkaas.HighSchoolDiplomaTypeCode = sssrd1.OutputCode
		AND rsy.SchoolYear = sssrd1.SchoolYear
		AND sssrd1.TableName = 'RefHighSchoolDiplomaType'
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdkaas.ProjectedHighSchoolDiplomaTypeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefProjectedHighSchoolDiplomaType'
		AND rsy.SchoolYear = sssrd2.SchoolYear
