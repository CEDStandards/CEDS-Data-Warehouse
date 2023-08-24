CREATE VIEW [RDS].[vwDimFirearms] 
AS
	SELECT
		DimFirearmId
		, rsy.SchoolYear
		, rdf.FirearmTypeCode
		, sssrd.InputCode AS FirearmTypeMap
	FROM rds.DimFirearms rdf
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdf.FirearmTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefFirearmType'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

