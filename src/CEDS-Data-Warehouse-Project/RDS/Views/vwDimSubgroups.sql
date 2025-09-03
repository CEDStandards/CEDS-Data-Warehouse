CREATE VIEW RDS.vwDimSubgroups
AS
	SELECT ds.DimSubgroupId
		,rsy.SchoolYear
		,ds.SubgroupCode
		,[SubgroupMap] = ISNULL(ssrd.InputCode,'MISSING')
	FROM RDS.DimSubgroups ds
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData ssrd
		ON ds.SubgroupCode = ssrd.OutputCode
		AND ssrd.TableName = 'RefSubgroup'
		AND rsy.SchoolYear = ssrd.SchoolYear

GO

