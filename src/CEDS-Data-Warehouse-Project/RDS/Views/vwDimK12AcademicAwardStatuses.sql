CREATE VIEW RDS.vwDimK12AcademicAwardStatuses
AS
	SELECT
		  DimK12AcademicAwardStatusId
		, rsy.SchoolYear
		, HighSchoolDiplomaTypeCode
		, ISNULL(sssrd1.InputCode, 'MISSING') AS HighSchoolDiplomaTypeMap
		, HighSchoolDiplomaDistinctionTypeCode
		, ISNULL(sssrd2.InputCode, 'MISSING') AS HighSchoolDiplomaDistinctionTypeMap
		, ProjectedHighSchoolDiplomaTypeCode
		, ISNULL(sssrd3.InputCode, 'MISSING') AS ProjectedHighSchoolDiplomaTypeMap
	FROM rds.DimK12AcademicAwardStatuses rdkaas
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkaas.HighSchoolDiplomaTypeCode = sssrd1.OutputCode
		AND rsy.SchoolYear = sssrd1.SchoolYear
		AND sssrd1.GlobalId = '000138'
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdkaas.HighSchoolDiplomaDistinctionTypeCode = sssrd2.OutputCode
		AND rsy.SchoolYear = sssrd2.SchoolYear
		AND sssrd2.GlobalId = '000713'
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdkaas.ProjectedHighSchoolDiplomaTypeCode = sssrd3.OutputCode
		AND rsy.SchoolYear = sssrd3.SchoolYear
		AND sssrd3.GlobalId = '002026'
