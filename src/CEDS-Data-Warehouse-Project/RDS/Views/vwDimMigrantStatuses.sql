CREATE VIEW rds.vwDimMigrantStatuses 
AS
	SELECT
		DimMigrantStatusId
		, rsy.SchoolYear
		, rdms.MigrantStatusCode
		, CASE rdms.MigrantStatusCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS MigrantStatusMap
		, rdms.MigrantEducationProgramEnrollmentTypeCode
		, sssrd1.OutputCode AS MigrantEducationProgramEnrollmentTypeMap
		, rdms.ContinuationOfServicesReasonCode
		, sssrd2.OutputCode AS ContinuationOfServicesReasonMap
		, rdms.MigrantEducationProgramServicesTypeCode
		, sssrd3.OutputCode AS MigrantEducationProgramServicesTypeMap
		, rdms.MigrantPrioritizedForServicesCode
		, CASE rdms.MigrantPrioritizedForServicesCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS MigrantPrioritizedForServicesMap
		, rdms.MEPContinuationOfServicesStatusCode
		, CASE rdms.MEPContinuationOfServicesStatusCode
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS MEPContinuationOfServicesStatusMap
		, rdms.ConsolidatedMEPFundsStatusCode
		, CASE rdms.ConsolidatedMEPFundsStatusCode
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS ConsolidatedMEPFundsStatusMap

	FROM rds.DimMigrantStatuses rdms
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdms.MigrantEducationProgramEnrollmentTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefMepEnrollmentType'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdms.ContinuationOfServicesReasonCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefContinuationOfServices'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdms.MigrantEducationProgramServicesTypeCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefMepServiceType'
		AND rsy.SchoolYear = sssrd3.SchoolYear