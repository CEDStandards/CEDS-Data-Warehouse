CREATE TABLE [Staging].[K12StudentDailyAttendance] (
    [Id]                                             INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                         NVARCHAR (40)  NULL,
    [IeuOrganizationIdentifierSea]                   NVARCHAR (50)  NULL,
    [LeaIdentifierSea]                               NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                            NVARCHAR (50)  NULL,
    [AttendanceEventDate]                            DATETIME       NULL,
    [SchoolYear]                                     SMALLINT       NULL,
    [AttendanceEventDurationDay]                     DECIMAL (9,2)  NULL,
    [AttendanceEventDurationMinutes]                 DECIMAL (9,2)  NULL,
    [AttendanceEventDurationHours]                   DECIMAL (9,2)  NULL,
    [ChronicStudentAbsenteeismIndicator]             NVARCHAR (50)  NULL,
    [AttendanceEventType]                            NVARCHAR (50)  NULL,
    [AttendanceStatus]                               NVARCHAR (50)  NULL,
    [PresentAttendanceCategory]                      NVARCHAR (50)  NULL,
    [AbsentAttendanceCategory]                       NVARCHAR (50)  NULL,
    [RecordStartDateTime]                            DATETIME       NULL,
    [RecordEndDateTime]                              DATETIME       NULL,
    [DataCollectionName]                             NVARCHAR (100) NULL,
    [RunDateTime]                                    DATETIME       NULL,
    CONSTRAINT [PK_K12StudentDailyAttendance] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12StudentDailyAttendance_DataCollectionName_WithIdentifiers]
    ON [Staging].[K12StudentDailyAttendance]([DataCollectionName] ASC)
    INCLUDE([StudentIdentifierState], [LeaIdentifierSea], [SchoolIdentifierSea]) WITH (FILLFACTOR = 80);


GO


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The duration of the attendance event captured as one whole day or a portion of a day.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Duration Day' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002013' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002013' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The duration of the attendance event in minutes.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Duration Minutes' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002014' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002014' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The duration of the attendance event in hours.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Duration Hours' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002015' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002015' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a student was absent 10% or more school days during the school year with an absence being defined as a student not physically on school grounds and was not participating in instruction or instruction-related activities at an approved off-grounds location for at least half the school day.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Chronic Student Absenteeism Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002022' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002022' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of attendance event.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000601' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000601' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of a person''s attendance associated with an Attendance Event Type and Attendance Event Date in an organization-person-role context.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000076' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000076' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AttendanceStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category that describes how the student spends his or her time when attending an instructional program approved by the state and/or school.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Present Attendance Category' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000600' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000600' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category that describes how the student spends his or her time not physically present on school grounds and not participating in instruction or instruction-related activities at an approved off-grounds location.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Absent Attendance Category' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000599' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000599' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StudentDailyAttendance', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO