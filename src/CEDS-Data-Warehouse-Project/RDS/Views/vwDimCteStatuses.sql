CREATE VIEW [RDS].[vwDimCteStatuses] 
AS
	SELECT
		  DimCteStatusId
		, rsy.SchoolYear
		, rdcs.CteAeDisplacedHomemakerIndicatorCode
		, CASE rdcs.CteAeDisplacedHomemakerIndicatorCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS CteAeDisplacedHomemakerIndicatorMap
		, rdcs.CteNontraditionalGenderStatusCode
		, sssrd1.OutputCode AS CteNontraditionalGenderStatusMap
		, rdcs.CteNontraditionalCompletionCode
		, CASE rdcs.CteNontraditionalCompletionCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS CteNontraditionalCompletionMap
		, rdcs.SingleParentOrSinglePregnantWomanStatusCode
		, CASE rdcs.SingleParentOrSinglePregnantWomanStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS SingleParentOrSinglePregnantWomanStatusMap
		, rdcs.CteParticipantCode
		, CASE rdcs.CteParticipantCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS CteParticipantMap
		, rdcs.CteConcentratorCode
		, CASE rdcs.CteConcentratorCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		 END AS CteConcentratorMap
	FROM rds.DimCteStatuses rdcs
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdcs.CteNontraditionalGenderStatusCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefCteNonTraditionalGenderStatus'
		AND rsy.SchoolYear = sssrd1.SchoolYear

GO

