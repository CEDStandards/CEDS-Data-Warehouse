CREATE VIEW [RDS].[vwDimFirearms] 
AS
	SELECT
		DimFirearmId
		, rsy.SchoolYear
		, rdf.FirearmTypeCode
		, sssrd.InputCode AS FirearmTypeMap
	FROM RDS.DimFirearms rdf
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdf.FirearmTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefFirearmType'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

