CREATE VIEW RDS.vwDimK12StaffCategories AS 

	SELECT
		  DimK12StaffCategoryId
		, rsy.SchoolYear
		, K12StaffClassificationCode 
		, sssrd1.InputCode AS K12StaffClassificationMap
		, SpecialEducationSupportServicesCategoryCode 
		, sssrd2.InputCode AS SpecialEducationSupportServicesCategoryMap
		, TitleIProgramStaffCategoryCode 
		, sssrd3.InputCode AS TitleIProgramStaffCategoryMap
	FROM rds.DimK12StaffCategories rdksc
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdksc.K12StaffClassificationCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefK12StaffClassification'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdksc.SpecialEducationSupportServicesCategoryCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefSpecialEducationStaffCategory'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdksc.TitleIProgramStaffCategoryCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefTitleIProgramStaffCategory'
		AND rsy.SchoolYear = sssrd3.SchoolYear

GO

