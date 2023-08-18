CREATE VIEW rds.vwDimHomelessnessStatuses 
AS
	SELECT
		  DimHomelessnessStatusId
		, sssrd.SchoolYear
		, rdhs.HomelessnessStatusCode
		, CASE rdhs.HomelessnessStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS HomelessnessStatusMap
		, rdhs.HomelessPrimaryNighttimeResidenceCode
		, sssrd.InputCode AS HomelessPrimaryNighttimeResidenceMap
		, rdhs.HomelessServicedIndicatorCode
		, CASE rdhs.HomelessServicedIndicatorCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS HomelessServicedIndicatorMap
		, rdhs.HomelessUnaccompaniedYouthStatusCode
		, CASE rdhs.HomelessUnaccompaniedYouthStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS HomelessUnaccompaniedYouthStatusMap
	FROM rds.DimHomelessnessStatuses rdhs
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdhs.HomelessPrimaryNighttimeResidenceCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefHomelessNighttimeResidence'

GO

