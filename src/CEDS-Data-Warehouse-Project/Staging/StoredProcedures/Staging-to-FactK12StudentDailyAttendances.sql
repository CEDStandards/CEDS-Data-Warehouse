CREATE PROCEDURE [Staging].[Staging-to-FactK12StudentDailyAttendances]
AS
BEGIN


INSERT INTO [RDS].[FactK12StudentDailyAttendances]
           ([SchoolYearId]
           ,[AttendanceEventDateId]
           ,[DataCollectionId]
           ,[SeaId]
           ,[IeuId]
           ,[LeaId]
           ,[K12SchoolId]
           ,[PersonId]
           ,[AttendanceId]
           ,[AttendanceEventDurationDay]
           ,[AttendanceEventDurationMinutes]
           ,[AttendanceEventDurationHours])
    SELECT
          ISNULL(rdsy.DimSchoolYearId, -1)
		, ISNULL(rdd.DimDateId, -1) AttendanceEventDate
        , ISNULL(rddc.DimDataCollectionId, -1)
        , ISNULL(rds.DimSeaId, -1)
        , ISNULL(rdi.DimIeuId, -1)
        , ISNULL(rdl.DimLeaId, -1)
        , ISNULL(rdksch.DimK12SchoolId, -1)
        , ISNULL(rdp.DimPersonId, -1)
        , ISNULL(rvda.DimAttendanceId, -1)
        , sksda.AttendanceEventDurationDay
        , sksda.AttendanceEventDurationMinutes
        , sksda.AttendanceEventDurationHours
    FROM Staging.K12StudentDailyAttendance sksda
    LEFT JOIN RDS.DimLeas rdl
        ON  ISNULL(sksda.LeaIdentifierSea, 'MISSING') = rdl.LeaIdentifierSea
        AND ISNULL(sksda.AttendanceEventDate, '1/1/1900') BETWEEN rdl.RecordStartDateTime AND ISNULL(rdl.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimIeus rdi
        ON  ISNULL(sksda.IeuOrganizationIdentifierSea, 'MISSING') = rdi.IeuOrganizationIdentifierSea
        AND ISNULL(sksda.AttendanceEventDate, '1/1/1900') BETWEEN rdi.RecordStartDateTime AND ISNULL(rdi.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimK12Schools rdksch
        ON  ISNULL(sksda.SchoolIdentifierSea, 'MISSING') = rdksch.SchoolIdentifierSea
        AND ISNULL(sksda.AttendanceEventDate, '1/1/1900') BETWEEN rdksch.RecordStartDateTime AND ISNULL(rdksch.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimSeas rds
        ON ISNULL(sksda.AttendanceEventDate, '1/1/1900') BETWEEN rds.RecordStartDateTime AND ISNULL(rds.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.DimDates rdd
        ON ISNULL(sksda.AttendanceEventDate, '1/1/1900') = rdd.DateValue
    LEFT JOIN RDS.DimSchoolYears rdsy
        ON ISNULL(sksda.SchoolYear, -1) = rdsy.SchoolYear
	LEFT JOIN RDS.DimPeople rdp
		ON sksda.StudentIdentifierState = rdp.K12StudentStudentIdentifierState
		AND ISNULL(sksda.AttendanceEventDate, '1/1/1900') BETWEEN rdp.RecordStartDateTime AND ISNULL(rdp.RecordEndDateTime, GETDATE())
    LEFT JOIN RDS.vwDimAttendances rvda
        ON  ISNULL(sksda.ChronicStudentAbsenteeismIndicator, 'MISSING') = rvda.ChronicStudentAbsenteeismIndicatorCodeMap
		AND ISNULL(sksda.AttendanceEventType, 'MISSING') = rvda.AttendanceEventTypeCodeMap
		AND ISNULL(sksda.AttendanceStatus, 'MISSING') = rvda.AttendanceStatusCodeMap
		AND ISNULL(sksda.PresentAttendanceCategory, 'MISSING') = rvda.PresentAttendanceCategoryCodeMap
        AND ISNULL(sksda.AbsentAttendanceCategory, 'MISSING') = rvda.AbsentAttendanceCategoryCodeMap
	LEFT JOIN RDS.DimDataCollections rddc
		ON ISNULL(sksda.DataCollectionName, 'MISSING') = rddc.DataCollectionName
END