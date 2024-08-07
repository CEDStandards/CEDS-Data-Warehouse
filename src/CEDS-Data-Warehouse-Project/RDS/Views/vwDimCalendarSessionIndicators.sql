CREATE VIEW RDS.vwDimCalendarSessionIndicators
AS
	SELECT
		  [DimCalendarSessionIndicatorId]
		, rsy.SchoolYear
		, SessionTypeCode
		, sssrd1.InputCode AS SessionTypeCodeMap
		, SessionMarkingTermIndicatorCode
        , CASE rdcsi.SessionMarkingTermIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE -1
            END AS SessionMarkingTermIndicatorCodeMap
		, SessionSchedulingTermIndicatorCode
        , CASE rdcsi.SessionSchedulingTermIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE -1
            END AS SessionSchedulingTermIndicatorCodeMap
		, SessionAttendanceTermIndicatorCode
        , CASE rdcsi.SessionAttendanceTermIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE -1
            END AS SessionAttendanceTermIndicatorCodeMap
	FROM rds.DimCalendarSessionIndicators rdcsi
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdcsi.SessionTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefSessionType'
		AND rsy.SchoolYear = sssrd1.SchoolYear

GO