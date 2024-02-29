CREATE VIEW RDS.vwDimCalendarEventIndicators
AS
	SELECT
		  [DimCalendarEventIndicatorId]
		, rsy.SchoolYear
		, CalendarEventTypeCode
		, sssrd1.InputCode AS CalendarEventTypeCodeMap
	FROM rds.DimCalendarEventIndicators rdi
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM staging.SourceSystemReferenceData) rsy
	LEFT JOIN staging.SourceSystemReferenceData sssrd1
		ON rdi.CalendarEventTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefCalendarEventType'
		AND rsy.SchoolYear = sssrd1.SchoolYear