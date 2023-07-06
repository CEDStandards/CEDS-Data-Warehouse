CREATE VIEW [RDS].[vwDimTitleIIIStatuses] AS
	SELECT
		  rdt3s.DimTitleIIIStatusId
		, rsy.SchoolYear
		, rdt3s.ProgramParticipationTitleIIILiepCode
		, CASE rdt3s.ProgramParticipationTitleIIILiepCode
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS ProgramParticipationTitleIIILiepMap
		, rdt3s.ProficiencyStatusCode
		, sssrd1.OutputCode AS ProficiencyStatusMap
		, rdt3s.TitleIIIAccountabilityProgressStatusCode
		, sssrd2.OutputCode AS TitleIIIAccountabilityProgressStatusMap
		, rdt3s.TitleIIILanguageInstructionProgramTypeCode
		, sssrd3.OutputCode AS TitleIIILanguageInstructionProgramTypeMap
	FROM rds.DimTitleIIIStatuses rdt3s
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdt3s.ProficiencyStatusCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefTitleIIIProfessionalDevelopmentType'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rdt3s.TitleIIIAccountabilityProgressStatusCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefTitleIIIAccountability'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rdt3s.TitleIIILanguageInstructionProgramTypeCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefTitleIIILanguageInstructionProgramType'
		AND rsy.SchoolYear = sssrd3.SchoolYear

GO

