CREATE VIEW RDS.vwDimEnglishLearnerStatuses 
AS
	SELECT
		DimEnglishLearnerStatusId
		, rsy.SchoolYear
		, rdels.EnglishLearnerStatusCode
		, CASE rdels.EnglishLearnerStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		END AS EnglishLearnerStatusMap
		, rdels.PerkinsEnglishLearnerStatusCode
		, CASE rdels.PerkinsEnglishLearnerStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		END AS PerkinsEnglishLearnerStatusMap
	FROM RDS.DimEnglishLearnerStatuses rdels
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy

GO

