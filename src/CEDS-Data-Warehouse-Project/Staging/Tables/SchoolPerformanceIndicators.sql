CREATE TABLE [Staging].[SchoolPerformanceIndicators] (
    [Id]                                           INT            IDENTITY (1, 1) NOT NULL,
    [SchoolIdentifierSea]                          NVARCHAR (50)  NOT NULL,
    [SchoolYear]                                   SMALLINT       NULL,
    [SchoolPerformanceIndicatorCategory]           VARCHAR (100)  NULL,
    [SchoolPerformanceIndicatorStateDefinedStatus] VARCHAR (100)  NULL,
    [SubgroupElementName]                          VARCHAR (100)  NULL,
    [SubgroupCode]                                 VARCHAR (100)  NULL,
    [SchoolPerformanceIndicatorType]               VARCHAR (100)  NULL,
    [SchoolQualityOrStudentSuccessIndicatorType]   VARCHAR (100)  NULL,
    [RecordStartDateTime]                          DATETIME       NULL,
    [RecordEndDateTime]                            DATETIME       NULL,
    [DataCollectionName]                           NVARCHAR (100) NULL,
    CONSTRAINT [PK_SchoolPerformanceIndicators] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

