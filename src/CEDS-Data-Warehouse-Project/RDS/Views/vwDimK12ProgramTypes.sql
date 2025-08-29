CREATE VIEW RDS.vwDimK12ProgramTypes
AS
	SELECT
		  DimK12ProgramTypeId
		, rsy.SchoolYear
		, ProgramTypeCode
		, ISNULL(sssrd.InputCode, 'MISSING') AS ProgramTypeMap
	FROM RDS.DimK12ProgramTypes rdkpt
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdkpt.ProgramTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefProgramType'
		AND rsy.SchoolYear = sssrd.SchoolYear

		