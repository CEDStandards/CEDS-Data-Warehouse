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

