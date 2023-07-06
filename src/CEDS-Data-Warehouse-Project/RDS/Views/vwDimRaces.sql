CREATE VIEW [RDS].[vwDimRaces]
AS
	SELECT
		  DimRaceId
		, rsy.SchoolYear
		, RaceCode
		, case 
			when RaceCode = 'HispanicorLatinoEthnicity' then 'HispanicorLatinoEthnicity' 
			else sssrd.InputCode end
		  as RaceMap
	FROM rds.DimRaces rdr
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdr.RaceCode = sssrd.OutputCode
		AND sssrd.TableName = 'refRace'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

