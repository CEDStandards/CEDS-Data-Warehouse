CREATE TABLE [Staging].[SchoolPerformanceIndicatorStateDefinedStatus] (
    [Id]                                                      INT            IDENTITY (1, 1) NOT NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusCode]        NVARCHAR (50)  NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusDescription] NVARCHAR (100) NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusDefinition]  NVARCHAR (MAX) NULL,
    [RefSchoolPerformanceIndicatorStateDefinedStatusId]       INT            NULL,
    [RunDateTime]                                             DATETIME       NULL,
    CONSTRAINT [PK_SchoolPerformanceIndicatorStateDefinedStatus] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

