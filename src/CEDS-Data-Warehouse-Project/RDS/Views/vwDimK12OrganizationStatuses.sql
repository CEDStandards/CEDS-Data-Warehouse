create VIEW RDS.vwDimK12OrganizationStatuses
AS
-- 9/23/2022 --
	SELECT
		  DimK12OrganizationStatusId
		, rsy.SchoolYear
		, rdkos.ReapAlternativeFundingStatusCode
		, sssrd1.InputCode AS ReapAlternativeFundingStatusMap
		, GunFreeSchoolsActReportingStatusCode
		, sssrd2.InputCode AS GunFreeSchoolsActReportingStatusMap
		, HighSchoolGraduationRateIndicatorStatusCode
		, sssrd3.InputCode AS HighSchoolGraduationRateIndicatorStatusMap
		, McKinneyVentoSubgrantRecipientCode
		, CASE McKinneyVentoSubgrantRecipientCode
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS McKinneyVentoSubgrantRecipientMap
	FROM rds.DimK12OrganizationStatuses rdkos
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkos.ReapAlternativeFundingStatusCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'refReapAlternativeFundingStatus'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdkos.GunFreeSchoolsActReportingStatusCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'refGunFreeSchoolsActReportingStatus'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdkos.HighSchoolGraduationRateIndicatorStatusCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefHighSchoolGraduationRateIndicator'
		AND rsy.SchoolYear = sssrd3.SchoolYear

GO

