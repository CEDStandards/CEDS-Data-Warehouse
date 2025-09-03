CREATE TABLE [Staging].[CalendarSession] (
    [Id]                            INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                    NVARCHAR (50)  NULL,
    [CalendarCode]                  NVARCHAR (30)  NULL,
    [CalendarDescription]           NVARCHAR (MAX) NULL,
    [SessionBeginDate]                     DATETIME       NULL,
    [SessionEndDate]                       DATETIME       NULL,
    [SessionCode]                   NVARCHAR (30) NULL,
    [SessionDescription]            NVARCHAR (MAX) NULL,
    [SessionSequenceNumber]         NVARCHAR (30) NULL,
    [FirstInstructionDate]          DATETIME       NULL,
    [LastInstructionDate]           DATETIME       NULL,
    [DaysInSession]                 INT            NULL,
    [SchoolYearMinutes]             INT            NULL,
    [InstructionalMinutes]          INT            NULL,
    [DataCollectionName]            NVARCHAR (50)  NULL,
    [RunDateTime]                   DATETIME       NULL,
    CONSTRAINT [PK_CalendarSession] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number assigned by a school district to a school calendar.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarCode'; 
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000494' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000494' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description or identification of the calendar.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Description' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000495' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000495' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'CalendarDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a session begins.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Begin Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000251' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000251' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code given to the session, usually for a session that represents a term within the school year such as a marking term.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001270' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001270' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A short description of the Session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Description' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001271' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001271' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a session ends.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000253' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000253' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionSequenceNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The position of this session in a sequence of sessions.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionSequenceNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Sequence Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionSequenceNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002021' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionSequenceNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002021' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SessionSequenceNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'FirstInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day of the first day of student instruction for the school year.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'FirstInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Instruction Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'FirstInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000497' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'FirstInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000497' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'FirstInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'LastInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day of the last day of student instruction (including days or times that students are present for purposes of testing and/or evaluation, but not including whole or part-days whose sole purposes is for distribution of report cards).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'LastInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last Instruction Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'LastInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000498' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'LastInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000498' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'LastInstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DaysInSession';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of days that the school was or is anticipated to be in session during the school year. Also included are days on which the education institution facility is closed and the student body as a whole is engaged in planned activities off-campus under the guidance and direction of staff members.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DaysInSession';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Days In Session' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DaysInSession';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000496' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DaysInSession';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000496' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'DaysInSession';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SchoolYearMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of minutes that all students were required to be at school and any additional learning time (e.g., before or after school, weekend school, summer school) for which all students had the opportunity to participate.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SchoolYearMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year Minutes' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SchoolYearMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000244' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SchoolYearMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000244' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'SchoolYearMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of instruction minutes in a given session, as determined by time in class, time on task (e.g., engaged in a class), or as estimated by a qualified course designer.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Instructional Minutes' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000499' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000499' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'CalendarSession', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO