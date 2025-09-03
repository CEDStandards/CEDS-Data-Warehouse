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
			WHEN 'YES' THEN 1
			WHEN 'NO' THEN 0
			WHEN 'MISSING' THEN -1
			END AS EducationalServicesAfterRemovalMap
		, IdeaInterimRemovalCode
		, ISNULL(sssrd3.InputCode, 'MISSING') AS IdeaInterimRemovalMap
		, IdeaInterimRemovalReasonCode
		, ISNULL(sssrd4.InputCode, 'MISSING') AS IdeaInterimRemovalReasonMap
	FROM RDS.DimDisciplineStatuses rdds
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdds.DisciplinaryActionTakenCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefDisciplinaryActionTaken'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd2
		ON rdds.DisciplineMethodOfChildrenWithDisabilitiesCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefDisciplineMethodOfCwd'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd3
		ON rdds.IdeaInterimRemovalCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefIdeaInterimRemoval'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN Staging.SourceSystemReferenceData sssrd4
		ON rdds.IdeaInterimRemovalReasonCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefIdeaInterimRemovalReason'
		AND rsy.SchoolYear = sssrd4.SchoolYear
