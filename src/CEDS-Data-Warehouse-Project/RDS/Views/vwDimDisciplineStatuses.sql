CREATE VIEW RDS.vwDimDisciplineStatuses 
AS
	SELECT
		  DimDisciplineStatusId
		, sssrd1.SchoolYear
		, rdds.DisciplinaryActionTakenCode
		, ISNULL(sssrd1.InputCode, 'MISSING') AS DisciplinaryActionTakenMap
		, DisciplineMethodOfChildrenWithDisabilitiesCode
		, ISNULL(sssrd2.InputCode, 'MISSING') AS DisciplineMethodOfChildrenWithDisabilitiesMap
		, EducationalServicesAfterRemovalCode
		, CASE EducationalServicesAfterRemovalCode
			WHEN 'SERVPROV' THEN 1
			WHEN 'SERVNOTPROV' THEN 0
			WHEN 'MISSING' THEN -1
		  END AS EducationalServicesAfterRemovalMap
		, IdeaInterimRemovalReasonCode
		, ISNULL(sssrd3.InputCode, 'MISSING') AS IdeaInterimRemovalReasonMap
		, IdeaInterimRemovalCode
		, ISNULL(sssrd4.InputCode, 'MISSING') AS IdeaInterimRemovalMap
	FROM rds.DimDisciplineStatuses rdds
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdds.DisciplinaryActionTakenCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefDisciplinaryActionTaken'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdds.DisciplineMethodOfChildrenWithDisabilitiesCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefDisciplineMethodOfCwd'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON CASE rdds.IdeaInterimRemovalReasonCode 
			  WHEN 'D' THEN 'Drugs'
			  WHEN 'W' THEN 'Weapons'
			  WHEN 'SBI' THEN 'SeriousBodilyInjury' 
			END = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefIdeaInterimRemovalReason'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdds.IdeaInterimRemovalCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefIdeaInterimRemoval'
		AND rsy.SchoolYear = sssrd4.SchoolYear

GO

