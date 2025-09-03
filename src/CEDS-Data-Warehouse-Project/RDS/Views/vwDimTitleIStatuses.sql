	CREATE VIEW [RDS].[vwDimTitleIStatuses]
	AS
		SELECT
			rdt1s.DimTitleIStatusId
			, rsy.SchoolYear
			, rdt1s.TitleIIndicatorCode
			, sssrd1.InputCode AS TitleIIndicatorMap
			, rdt1s.SchoolChoiceAppliedforTransferStatusCode
			, CASE rdt1s.SchoolChoiceAppliedforTransferStatusCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS SchoolChoiceAppliedforTransferStatusMap
			, rdt1s.SchoolChoiceEligibleforTransferStatusCode
			, CASE rdt1s.SchoolChoiceEligibleforTransferStatusCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS SchoolChoiceEligibleforTransferStatusMap
			, rdt1s.SchoolChoiceTransferStatusCode
			, CASE rdt1s.SchoolChoiceTransferStatusCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS SchoolChoiceTransferStatusMap
			, rdt1s.TitleISchoolSupplementalServicesAppliedStatusCode
			, CASE rdt1s.TitleISchoolSupplementalServicesAppliedStatusCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS TitleISchoolSupplementalServicesAppliedStatusMap
			, rdt1s.TitleISchoolSupplementalServicesEligibleStatusCode
			, CASE rdt1s.TitleISchoolSupplementalServicesEligibleStatusCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS TitleISchoolSupplementalServicesEligibleStatusMap
			, rdt1s.TitleISchoolSupplementalServicesReceivedStatusCode
			, CASE rdt1s.TitleISchoolSupplementalServicesReceivedStatusCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS TitleISchoolSupplementalServicesReceivedStatusMap
			, rdt1s.TitleISchoolwideProgramParticipationCode
			, CASE rdt1s.TitleISchoolwideProgramParticipationCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS TitleISchoolwideProgramParticipationMap
			, rdt1s.TitleITargetedAssistanceParticipationCode
			, CASE rdt1s.TitleITargetedAssistanceParticipationCode 
				WHEN 'Yes' THEN 1 
				WHEN 'No' THEN 0
				ELSE -1
			  END AS TitleITargetedAssistanceParticipationMap

		FROM RDS.DimTitleIStatuses rdt1s
		CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
		LEFT JOIN Staging.SourceSystemReferenceData sssrd1
			ON rdt1s.TitleIIndicatorCode = sssrd1.OutputCode
			AND sssrd1.TableName = 'RefTitleIIndicator'
			AND rsy.SchoolYear = sssrd1.SchoolYear
GO


