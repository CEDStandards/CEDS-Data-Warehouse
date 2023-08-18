CREATE VIEW [RDS].[vwDimIdeaStatuses] 
AS
	SELECT
		  DimIdeaStatusId
		, rdsy.SchoolYear
		, SpecialEducationExitReasonCode
		, SpecialEducationExitReasonCode AS SpecialEducationExitReasonMap
		, IdeaEducationalEnvironmentForEarlyChildhoodCode
		, IdeaEducationalEnvironmentForEarlyChildhoodCode AS IdeaEducationalEnvironmentForEarlyChildhoodMap
		, IdeaEducationalEnvironmentForSchoolAgeCode
		, IdeaEducationalEnvironmentForSchoolAgeCode AS IdeaEducationalEnvironmentForSchoolAgeMap
		, IdeaIndicatorCode
		, CASE IdeaIndicatorCode
			WHEN 'Yes' THEN 1
			WHEN 'No' THEN 0
			ELSE 0
		END AS IdeaIndicatorMap
	FROM rds.DimIdeaStatuses rdis
	CROSS JOIN RDS.DimSchoolYears rdsy

