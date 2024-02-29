CREATE VIEW RDS.vwDimCalendarSessionIndicators
AS
	SELECT
		  [DimCalendarSessionIndicatorId]
		, rsy.SchoolYear
		, SessionTypeCode
		, sssrd1.InputCode AS SessionTypeCodeMap
		, SessionMarkingTermIndicatorCode
        , CASE rdcs.SessionMarkingTermIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE -1
            END AS SessionMarkingTermIndicatorCodeMap
		, SessionSchedulingTermIndicatorCode
        , CASE rdcs.SessionSchedulingTermIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE -1
            END AS SessionSchedulingTermIndicatorCodeMap
		, SessionAttendanceTermIndicatorCode
        , CASE rdcs.SessionAttendanceTermIndicatorCode
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 0
            ELSE -1
            END AS SessionAttendanceTermIndicatorCodeMap
	FROM rds.DimCalendarSessions rdcs
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdcs.SessionTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefSessionType'
		AND rsy.SchoolYear = sssrd1.SchoolYear

GO