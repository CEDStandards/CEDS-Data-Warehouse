CREATE VIEW rds.vwDimK12ProgramTypes
AS
	SELECT
		  DimK12ProgramTypeId
		, rsy.SchoolYear
		, ProgramTypeCode
		, ISNULL(sssrd.InputCode, 'MISSING') AS ProgramTypeMap
	FROM rds.DimK12ProgramTypes rdkpt
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdkpt.ProgramTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefProgramType'
		AND rsy.SchoolYear = sssrd.SchoolYear

		