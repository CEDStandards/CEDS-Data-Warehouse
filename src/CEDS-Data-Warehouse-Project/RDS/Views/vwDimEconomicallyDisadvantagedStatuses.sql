CREATE VIEW rds.vwDimEconomicallyDisadvantagedStatuses 
AS
	SELECT
		  DimEconomicallyDisadvantagedStatusId
		, rsy.SchoolYear
		, rdeds.EconomicDisadvantageStatusCode
		, CASE rdeds.EconomicDisadvantageStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS EconomicDisadvantageStatusMap
		, rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode
		, sssrd.InputCode AS EligibilityStatusForSchoolFoodServiceProgramsMap
		, rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode
		, CASE rdeds.NationalSchoolLunchProgramDirectCertificationIndicatorCode
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS NationalSchoolLunchProgramDirectCertificationIndicatorMap
	FROM rds.DimEconomicallyDisadvantagedStatuses rdeds
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdeds.EligibilityStatusForSchoolFoodServiceProgramsCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefFoodServiceEligibility'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

