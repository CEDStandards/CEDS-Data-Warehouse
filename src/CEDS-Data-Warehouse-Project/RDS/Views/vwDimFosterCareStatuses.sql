CREATE VIEW RDS.vwDimFosterCareStatuses 
AS
	SELECT
		  DimFosterCareStatusId
		, rsy.SchoolYear
		, rdfcs.ProgramParticipationFosterCareCode
		, CASE rdfcs.ProgramParticipationFosterCareCode 
			WHEN 'Yes' THEN 1 
			WHEN 'No' THEN 0
			ELSE -1
		  END AS ProgramParticipationFosterCareMap
	FROM RDS.DimFosterCareStatuses rdfcs
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy

GO

