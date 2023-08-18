CREATE TABLE [Staging].[OrganizationCalendarSession] (
    [Id]                            INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifier]        NVARCHAR (50)  NULL,
    [OrganizationType]              NVARCHAR (50)  NULL,
    [CalendarYear]                  NVARCHAR (50)  NULL,
    [BeginDate]                     DATETIME       NULL,
    [EndDate]                       DATETIME       NULL,
    [SessionType]                   NVARCHAR (100) NULL,
    [AcademicTermDesignator]        NVARCHAR (100) NULL,
    [DataCollectionName]            NVARCHAR (50)  NULL,
    [DataCollectionId]              INT            NULL,
    [OrganizationId]                INT            NULL,
    [OrganizationCalendarId]        INT            NULL,
    [OrganizationCalendarSessionId] INT            NULL,
    CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21703' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of educational organization or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001156' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22165' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'OrganizationType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A prescribed span of time when an education institution is open, instruction is provided, and students are under the direction and guidance of teachers and/or education institution administration. A session may be interrupted by one or more vacations.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000254' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'SessionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21254' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'OrganizationCalendarSession', @level2type=N'COLUMN',@level2name=N'SessionType';
GO