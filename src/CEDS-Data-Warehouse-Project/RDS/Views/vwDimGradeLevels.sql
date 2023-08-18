create VIEW RDS.vwDimGradeLevels
AS
	SELECT
		  DimGradeLevelId
		, sssrd.SchoolYear
		, GradeLevelCode 
		, sssrd.InputCode AS GradeLevelMap
		, sssrd.TableFilter AS GradeLevelTypeCode
		, CASE sssrd.TableFilter
			WHEN '000100' THEN 'Entry Grade Level'
			WHEN '000125' THEN 'Grade Level When Course Taken'
			WHEN '000126' THEN 'Grade Level When Assessed'
			WHEN '000131' THEN 'Grades Offered'
			WHEN '000177' THEN 'Assessment Level for Which Designed'
			WHEN '001057' THEN 'Assessment Registration Grade Level to Be Assessed'
			WHEN '001210' THEN 'Exit Grade Level'
		  END as GradeLevelTypeDescription
	FROM rds.DimGradeLevels rdgl
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd
		ON rdgl.GradeLevelCode = sssrd.OutputCode
		AND sssrd.TableName = 'RefGradeLevel'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

