CREATE VIEW RDS.vwDimCalendarEventIndicators
AS
	SELECT
		  [DimCalendarEventIndicatorId]
		, rsy.SchoolYear
		, CalendarEventTypeCode
		, sssrd1.InputCode AS CalendarEventTypeCodeMap
	FROM RDS.DimCalendarEventIndicators rdi
	CROSS JOIN (SELECT DISTINCT SchoolYear FROM Staging.SourceSystemReferenceData) rsy
	LEFT JOIN Staging.SourceSystemReferenceData sssrd1
		ON rdi.CalendarEventTypeCode = sssrd1.OutputCode
		AND sssrd1.TableName = 'RefCalendarEventType'
		AND rsy.SchoolYear = sssrd1.SchoolYear