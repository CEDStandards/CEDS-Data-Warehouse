CREATE TABLE [RDS].[DimDataCollections] (
    [DimDataCollectionId]                  INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemDataCollectionIdentifier] INT            NULL,
    [SourceSystemName]                     NVARCHAR (100) NULL,
    [DataCollectionName]                   NVARCHAR (100) NOT NULL,
    [DataCollectionDescription]            NVARCHAR (MAX) NULL,
    [DataCollectionOpenDate]               DATETIME       NULL,
    [DataCollectionCloseDate]              DATETIME       NULL,
    [DataCollectionAcademicSchoolYear]     NVARCHAR (7)   NULL,
    [DataCollectionSchoolYear]             NVARCHAR (7)   NULL,
    CONSTRAINT [PK_DimCollections] PRIMARY KEY CLUSTERED ([DimDataCollectionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDataCollections_DataCollectionName]
    ON [RDS].[DimDataCollections]([DataCollectionName] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimDataCollections_DataCollectionSchoolYear]
    ON [RDS].[DimDataCollections]([DataCollectionSchoolYear] ASC) WITH (FILLFACTOR = 100, DATA_COMPRESSION = PAGE);


GO

