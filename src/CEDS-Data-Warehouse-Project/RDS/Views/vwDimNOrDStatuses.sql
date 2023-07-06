CREATE VIEW rds.vwDimNOrDStatuses 
AS
	SELECT
		  rdnods.DimNOrDStatusId
		, rsy.SchoolYear
		, rdnods.NeglectedOrDelinquentProgramTypeCode
		, sssrd.InputCode AS NeglectedOrDelinquentProgramTypeMap
	FROM rds.DimNOrDStatuses rdnods
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdnods.NeglectedOrDelinquentProgramTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefNeglectedProgramType'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

