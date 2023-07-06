CREATE VIEW rds.vwDimPsInstitutionStatuses
AS
	SELECT
          [DimPsInstitutionStatusId]                   
		, rsy.SchoolYear
        , LevelOfInstitutionCode                   
        , ISNULL(sssrd1.InputCode, 'MISSING') AS [LevelOfInstitututionMap]           
        , [ControlOfInstitutionCode]                   
        , ISNULL(sssrd2.InputCode, 'MISSING') AS [ControlOfInstitutionMap]            
        , VirtualIndicatorCode                           
        , case VirtualIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE NULL
          END AS [VirtualIndicatorMap]                           
        , [CarnegieBasicClassificationCode]            
        , ISNULL(sssrd3.InputCode, 'MISSING') AS [CarnegieBasicClassificationMap]     
        , [MostPrevalentLevelOfInstitutionCode]        
        , ISNULL(sssrd4.InputCode, 'MISSING') AS [MostPrevalentLevelOfInstitutionMap] 
        , PredominantCalendarSystemCode              
        , ISNULL(sssrd5.InputCode, 'MISSING') AS [PredominentCalendarSystemMap]  
    FROM rds.[DimPsInstitutionStatuses] rdpis
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdpis.LevelOfInstitutionCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefLevelOfInstitutution'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdpis.[ControlOfInstitutionCode] = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefControlOfInstitution'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdpis.[ControlOfInstitutionCode] = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefCarnegieBasicClassification'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdpis.[MostPrevalentLevelOfInstitutionCode] = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefMostPrevalentLevelOfInstitution'
		AND rsy.SchoolYear = sssrd4.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON rdpis.PredominantCalendarSystemCode = sssrd5.OutputCode
		AND sssrd5.TableName = 'RefPerdominantCalendarSystem'
		AND rsy.SchoolYear = sssrd5.SchoolYear
