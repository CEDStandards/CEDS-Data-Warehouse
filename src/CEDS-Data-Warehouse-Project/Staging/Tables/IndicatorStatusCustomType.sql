CREATE TABLE [Staging].[IndicatorStatusCustomType] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [Description]        NVARCHAR (100) NULL,
    [Code]               NVARCHAR (50)  NULL,
    [Definition]         NVARCHAR (MAX) NULL,
    [DataCollectionName] NVARCHAR (100) NULL,
    CONSTRAINT [PK_IndicatorStatusCustomType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

