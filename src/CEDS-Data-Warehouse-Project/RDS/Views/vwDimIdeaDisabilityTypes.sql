CREATE VIEW RDS.vwDimIdeaDisabilityTypes 
AS
	SELECT
		DimIdeaDisabilityTypeId
		, rsy.SchoolYear
		, rdidt.IdeaDisabilityTypeCode
		, sssrd.InputCode AS IdeaDisabilityTypeMap
	FROM RDS.DimIdeaDisabilityTypes rdidt
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdidt.IdeaDisabilityTypeCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefIDEADisabilityType'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

