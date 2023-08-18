CREATE VIEW rds.vwDimFosterCareStatuses 
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
	FROM rds.DimFosterCareStatuses rdfcs
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy

GO

