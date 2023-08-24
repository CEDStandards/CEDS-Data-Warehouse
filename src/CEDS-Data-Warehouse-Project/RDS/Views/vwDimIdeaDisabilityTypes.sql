CREATE VIEW rds.vwDimIdeaDisabilityTypes 
AS
	SELECT
		DimIdeaDisabilityTypeId
		, rsy.SchoolYear
		, rdidt.IdeaDisabilityTypeCode
		, sssrd.InputCode AS IdeaDisabilityTypeMap
	FROM rds.DimIdeaDisabilityTypes rdidt
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdidt.IdeaDisabilityTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefIDEADisabilityType'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

