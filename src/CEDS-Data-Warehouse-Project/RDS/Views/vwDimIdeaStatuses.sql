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
		, IdeaIndicatorCode AS IdeaIndicatorMap
	FROM rds.DimIdeaStatuses rdis
	CROSS JOIN RDS.DimSchoolYears rdsy

GO

