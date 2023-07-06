CREATE VIEW [RDS].[vwDimFirearmDisciplineStatuses] 
AS
	SELECT
		DimFirearmDisciplineStatusId
		, rsy.SchoolYear
		, rdfds.DisciplineMethodForFirearmsIncidentsCode
		, sssrd.InputCode AS DisciplineMethodForFirearmsIncidentsMap
		, rdfds.IdeaDisciplineMethodForFirearmsIncidentsCode
		, sssrd2.InputCode AS IdeaDisciplineMethodForFirearmsIncidentsMap
	FROM rds.DimFirearmDisciplineStatuses rdfds
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdfds.DisciplineMethodForFirearmsIncidentsCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefDisciplineMethodFirearms'
		AND rsy.SchoolYear = sssrd.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdfds.DisciplineMethodForFirearmsIncidentsCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefIdeaDisciplineMethodFirearm'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

