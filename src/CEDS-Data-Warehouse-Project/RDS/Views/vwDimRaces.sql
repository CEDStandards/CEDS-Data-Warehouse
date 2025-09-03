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
	FROM RDS.DimRaces rdr
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdr.RaceCode = sssrd.OutputCode
		AND sssrd.TableName = 'refRace'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

