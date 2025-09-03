CREATE VIEW [RDS].[vwDimCourseGradePointAverageIndicators] 
AS
	SELECT
		DimCourseGradePointAverageIndicatorId
		, rsy.SchoolYear
		, rdcg.CourseGradePointAverageApplicabilityCode
		, sssrd.InputCode AS CourseGradePointAverageApplicabilityMap
	FROM RDS.DimCourseGradePointAverageIndicators rdcg
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd
		ON rdcg.CourseGradePointAverageApplicabilityCode = sssrd.OutputCode
		AND sssrd.GlobalId = '000060'
		AND rsy.SchoolYear = sssrd.SchoolYear

GO

