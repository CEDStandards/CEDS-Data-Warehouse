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
		, sssrd4.InputCode AS PresentAttendanceCategoryCodeMap
		, AbsentAttendanceCategoryCode
		, sssrd5.InputCode AS AbsentAttendanceCategoryCodeMap
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
		ON rda.PresentAttendanceCategoryCode = sssrd4.OutputCode
		AND sssrd4.TableName = 'RefPresentAttendanceCategory'
		AND rsy.SchoolYear = sssrd4.SchoolYear
	LEFT JOIN staging.SourceSystemReferenceData sssrd5
		ON rda.AbsentAttendanceCategoryCode = sssrd5.OutputCode
		AND sssrd5.TableName = 'RefAbsentAttendanceCategory'
		AND rsy.SchoolYear = sssrd5.SchoolYear