CREATE VIEW rds.vwDimMilitaryStatuses 
AS
	SELECT
		  rdms.DimMilitaryStatusId
		, rsy.SchoolYear
		, rdms.MilitaryConnectedStudentIndicatorCode
		, sssrd1.OutputCode AS MilitaryConnectedStudentIndicatorMap
		, rdms.ActiveMilitaryStatusndicatorCode
		, sssrd2.OutputCode AS ActiveMilitaryStatusndicatorMap
		, rdms.MilitaryBranchCode
		, sssrd3.OutputCode AS MilitaryBranchMap
		, rdms.MilitaryVeteranStatusIndicatorCode
		, sssrd4.OutputCode AS MilitaryVeteranStatusIndicatorMap
	FROM rds.DimMilitaryStatuses rdms
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdms.MilitaryConnectedStudentIndicatorCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefMilitaryConnectedStudentIndicator'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdms.ActiveMilitaryStatusndicatorCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefActiveMilitaryStatusndicator'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdms.MilitaryBranchCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefMilitaryBranch'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdms.MilitaryVeteranStatusIndicatorCode = sssrd4.OutputCode
		AND sssrd3.TableName = 'RefMilitaryVeteranStatusIndicator'
		AND rsy.SchoolYear = sssrd4.SchoolYear

GO

