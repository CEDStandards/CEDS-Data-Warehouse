CREATE VIEW [RDS].[vwDimTitleIIIStatuses] AS
	SELECT
		  rdt3s.DimTitleIIIStatusId
		, rsy.SchoolYear

		,rdt3s.TitleIIIImmigrantParticipationStatusCode
		,CASE rdt3s.TitleIIIImmigrantParticipationStatusCode
			WHEN 'Yes' then 1
			WHEN 'No' then 0
			ELSE -1
		END	as TitleIIIImmigrantParticipationStatusMap

		, rdt3s.ProgramParticipationTitleIIILiepCode
		, CASE rdt3s.ProgramParticipationTitleIIILiepCode
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS TitleIIIProgramParticipationLiepMap

		, rdt3s.ProficiencyStatusCode
		, sssrd3.OutputCode AS ProficiencyStatusMap

		, rdt3s.TitleIIIAccountabilityProgressStatusCode
		, sssrd4.OutputCode as TitleIIIAccountabilityProgressStatusMap

		, rdt3s.TitleIIILanguageInstructionProgramTypeCode
		, sssrd5.OutputCode as TitleIIILanguageInstructionProgramTypeMap

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
		ON rdt3s.ProficiencyStatusCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'refProficiencyStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear

	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rdt3s.TitleIIIAccountabilityProgressStatusCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefTitleIIIAccountability'
		AND rsy.SchoolYear = sssrd4.SchoolYear

	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON rdt3s.TitleIIILanguageInstructionProgramTypeCode = sssrd5.OutputCode
		AND sssrd5.TableName = 'RefTitleIIILanguageInstructionProgramType'
		AND rsy.SchoolYear = sssrd5.SchoolYear
		
