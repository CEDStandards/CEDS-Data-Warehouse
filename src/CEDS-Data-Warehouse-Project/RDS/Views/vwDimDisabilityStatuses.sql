CREATE VIEW rds.vwDimDisabilityStatuses 
AS
	SELECT
		  DimDisabilityStatusId
		, rsy.SchoolYear
		, rdds.DisabilityStatusCode
		, CASE rdds.DisabilityStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS DisabilityStatusMap
		, rdds.Section504StatusCode
		, CASE rdds.Section504StatusCode 
			WHEN 'Yes' THEN 1
			WHEN 'No' THEN 0
			ELSE -1
		  END AS Section504StatusMap
		, rdds.DisabilityConditionTypeCode
		, sssrd1.OutputCode AS DisabilityConditionTypeMap
		, rdds.DisabilityDeterminationSourceTypeCode
		, sssrd2.OutputCode AS DisabilityDeterminationSourceTypeMap
	FROM rds.DimDisabilityStatuses rdds
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdds.DisabilityConditionTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefDisabilityConditionType'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdds.DisabilityDeterminationSourceTypeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefDisabilityDeterminationSourceType'
		AND rsy.SchoolYear = sssrd2.SchoolYear

GO

