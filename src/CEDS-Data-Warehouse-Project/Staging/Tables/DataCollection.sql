CREATE TABLE [Staging].[DataCollection] (
    [Id]                                   INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemDataCollectionIdentifier] NVARCHAR (36)  NULL,
    [SourceSystemName]                     NVARCHAR (100) NULL,
    [DataCollectionName]                   NVARCHAR (100) NULL,
    [DataCollectionDescription]            NVARCHAR (MAX) NULL,
    [DataCollectionOpenDate]               DATETIME       NULL,
    [DataCollectionCloseDate]              DATETIME       NULL,
    [DataCollectionAcademicSchoolYear]     NVARCHAR (50)  NULL,
    [DataCollectionSchoolYear]             NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DataCollection] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

