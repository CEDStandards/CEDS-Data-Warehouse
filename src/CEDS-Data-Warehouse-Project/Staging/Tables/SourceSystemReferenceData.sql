CREATE TABLE [Staging].[SourceSystemReferenceData] (
    [SourceSystemReferenceDataId] INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                  SMALLINT       NOT NULL,
    [TableName]                   VARCHAR (100)  NOT NULL,
    [TableFilter]                 VARCHAR (100)  NULL,
    [InputCode]                   NVARCHAR (200) NULL,
    [OutputCode]                  NVARCHAR (200) NULL,
    CONSTRAINT [PK_SourceSystemReferenceData] PRIMARY KEY CLUSTERED ([SourceSystemReferenceDataId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_SourceSystemReferenceData_Unique]
    ON [Staging].[SourceSystemReferenceData]([SchoolYear] DESC, [OutputCode] DESC, [TableName] ASC, [TableFilter] ASC, [InputCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

