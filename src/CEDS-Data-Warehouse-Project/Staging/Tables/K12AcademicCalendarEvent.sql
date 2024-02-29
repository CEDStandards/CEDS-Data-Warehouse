CREATE TABLE [Staging].[K12AcademicCalendarEvent] (
    [Id]                            INT            IDENTITY (1, 1) NOT NULL,
    [IeuIdentifierSea]              NVARCHAR (50)  NULL,
    [LeaIdentifierSea]              NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]           NVARCHAR (50)  NULL,
    [SchoolYear]                    NVARCHAR (50)  NULL,
    [CalendarEventDate]             DATETIME       NULL,
    [StartTime]                     TIME  NULL,
    [EndTime]                       TIME  NULL,
    [CalendarEventType]             NVARCHAR (50)  NULL,
    [SessionType]                   NVARCHAR (50)  NULL,
    [SessionMarkingTermIndicator]        BIT  NULL,
    [SessionSchedulingTermIndicator]        BIT  NULL,
    [SessionAttendanceTermIndicator]        BIT  NULL,
    [CalendarCode]                  NVARCHAR (30)  NULL, 
    [SessionCode]                   NVARCHAR (30) NULL,
    [MinutesPerDay]                 [int] NOT NULL,
    [InstructionalMinutesPerDay]    [int] NOT NULL,
    [LunchMinutesPerDay]            [int] NOT NULL,
    [RecessMinutesPerDay]           [int] NOT NULL,
    [AcademicTermDesignator]    NVARCHAR (50)  NULL,
    [CalendarEventDayName]          NVARCHAR (200)  NULL,
    [CrisisCode]                    NVARCHAR (200)  NULL,
    [RecordStartDateTime]                                 DATETIME       NULL,
    [RecordEndDateTime]                                   DATETIME       NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_K12AcademicCalendarEvent] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'IeuIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'IeuIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'IeuIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'IeuIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'IeuIdentifierSea';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date of the scheduled or unscheduled calendar event.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Event Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001275' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001275' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDate';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'StartTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The starting hour, minute and second.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'StartTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Start Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'StartTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001919' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'StartTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001919' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'StartTime';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'EndTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The ending hour, minute and second.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'EndTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'End Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'EndTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001920' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'EndTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001920' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'EndTime';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A type of scheduled or unscheduled calendar event.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Event Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000603' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000603' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventType';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A prescribed span of time when an education institution is open, instruction is provided, and students are under the direction and guidance of teachers and/or education institution administration. A session may be interrupted by one or more vacations.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000254' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000254' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionType';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is a marking term.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Marking Term Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001272' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001272' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicator';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is a scheduling term.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Scheduling Term Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001273' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001273' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicator';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is an attendance term.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Attendance Term Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001274' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001274' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicator';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number assigned by a school district to a school calendar.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarCode'; 
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000494' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000494' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code given to the session, usually for a session that represents a term within the school year such as a marking term.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001270' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001270' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000500' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000500' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of instructional minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Instructional Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002099' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002099' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of lunch minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Lunch Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002100' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002100' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of recess minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Recess Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002101' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002101' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000727' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDayName'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A name used for the day of the calendar event.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDayName'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Event Day Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDayName'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001276' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDayName'
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001276' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CalendarEventDayName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CrisisCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code used to identify a crisis. This code should be able to accommodate numerous crises within a single school year. It is associated with the displaced student identifier in order to link a crisis to a student who was displaced or otherwise affected by the event. If the same code values are to be used over multiple years, it is important to have enough crisis-specific items (e.g., school year, date/time) to keep the events unique over time.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CrisisCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Crisis Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CrisisCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000611' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CrisisCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000611' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'CrisisCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12AcademicCalendarEvent', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO