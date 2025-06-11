
CREATE VIEW [RDS].[vwDimK12CourseStatuses] 
AS
	Select 
	rdkd.DimK12CourseStatusId,
	rsy.SchoolYear,
	rdkd.CourseLevelCharacteristicCode,
	sssrd1.InputCode AS CourseLevelCharacteristicMap,
	sssrd1.TableName
	From RDS.DimK12CourseStatuses rdkd
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdkd.CourseLevelCharacteristicCode = sssrd1.OutputCode
		AND rsy.SchoolYear = sssrd1.SchoolYear		
		AND sssrd1.TableName = 'RefCourseLevelCharacteristic'