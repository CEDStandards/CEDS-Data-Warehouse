CREATE VIEW RDS.vwDimK12AcademicAwardStatuses
AS
	SELECT
		  DimK12AcademicAwardStatusId
		, rsy.SchoolYear
		, HighSchoolDiplomaTypeCode
		, ISNULL(sssrd1.InputCode, 'MISSING') AS HighSchoolDiplomaTypeMap
	FROM rds.DimK12AcademicAwardStatuses rdkaas
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkaas.HighSchoolDiplomaTypeCode = sssrd1.OutputCode
		AND rsy.SchoolYear = sssrd1.SchoolYear
		AND sssrd1.TableName = 'RefHighSchoolDiplomaType'
