CREATE VIEW RDS.vwDimK12SchoolStatuses
AS
	SELECT
		DimK12SchoolStatusId
		, rsy.SchoolYear
		, rdkss.MagnetOrSpecialProgramEmphasisSchoolCode
		, sssrd1.InputCode AS MagnetOrSpecialProgramEmphasisSchoolMap
		, NslpStatusCode
		, sssrd2.InputCode AS NslpStatusMap
		, SharedTimeIndicatorCode
		, CASE SharedTimeIndicatorCode
			WHEN 'Yes' THEN 'Yes' 
			WHEN 'No' THEN 'No'
			-- CIID-5783 JW -------------
			-- ELSE NULL 
			ELSE 'MISSING'
			----------------------------

		END AS SharedTimeIndicatorMap
		, VirtualSchoolStatusCode
		, sssrd3.InputCode AS VirtualSchoolStatusMap
		, SchoolImprovementStatusCode
		, sssrd4.InputCode AS SchoolImprovementStatusMap
		, PersistentlyDangerousStatusCode
		, sssrd5.InputCode PersistentlyDangerousStatusMap
		, sssrd5.InputCode AS PersistentlyDangerousStatusMap_InputCode
		, ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode
		, sssrd6.InputCode AS ProgressAchievingEnglishLanguageProficiencyIndicatorTypeMap
		, StatePovertyDesignationCode
		, sssrd7.InputCode as StatePovertyDesignationMap

	FROM rds.DimK12SchoolStatuses rdkss
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdkss.MagnetOrSpecialProgramEmphasisSchoolCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefMagnetSpecialProgram'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdkss.NslpStatusCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefNSLPStatus'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdkss.VirtualSchoolStatusCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefVirtualSchoolStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdkss.SchoolImprovementStatusCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefSchoolImprovementStatus'
		AND rsy.SchoolYear = sssrd4.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON rdkss.PersistentlyDangerousStatusCode = sssrd5.OutputCode
		AND sssrd5.TableName = 'RefSchoolDangerousStatus'
		AND rsy.SchoolYear = sssrd5.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd6
		ON rdkss.ProgressAchievingEnglishLanguageProficiencyIndicatorTypeCode = sssrd6.OutputCode
		AND sssrd6.TableName = 'RefProgressAchievingEnglishLanguageProficiencyIndicatorStatus'
		AND rsy.SchoolYear = sssrd6.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd7
		ON rdkss.StatePovertyDesignationCode = sssrd7.OutputCode
		AND sssrd7.TableName = 'RefStatePovertyDesignation'
		AND rsy.SchoolYear = sssrd7.SchoolYear

GO

