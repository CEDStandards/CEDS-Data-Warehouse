CREATE VIEW RDS.vwDimAttendances
AS
	SELECT
		  [DimAttendanceId]
		, rsy.SchoolYear
		, ChronicStudentAbsenteeismIndicatorCode
		, sssrd1.InputCode AS ChronicStudentAbsenteeismIndicatorCodeMap
		, AttendanceEventTypeCode
		, sssrd2.InputCode AS AttendanceEventTypeCodeMap
		, AttendanceStatusCode
		, sssrd3.InputCode AS AttendanceStatusCodeMap
		, PresentAttendanceCategoryCode
		, sssrd3.InputCode AS PresentAttendanceCategoryCodeMap
		, AbsentAttendanceCategoryCode
		, sssrd3.InputCode AS AbsentAttendanceCategoryCodeMap
	FROM rds.DimAttendances rda
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rda.ChronicStudentAbsenteeismIndicatorCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefChronicStudentAbsenteeismIndicator'
		AND rsy.SchoolYear = sssrd1.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd2
		ON rda.AttendanceEventTypeCode = sssrd2.OutputCode
		AND sssrd2.TableName = 'RefAttendanceEventType'
		AND rsy.SchoolYear = sssrd2.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd3
		ON rda.AttendanceStatusCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefAttendanceStatus'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd4
		ON rda.PresentAttendanceCategoryCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefPresentAttendanceCategory'
		AND rsy.SchoolYear = sssrd3.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON rda.AbsentAttendanceCategoryCode = sssrd3.OutputCode
		AND sssrd3.TableName = 'RefAbsentAttendanceCategory'
		AND rsy.SchoolYear = sssrd3.SchoolYear