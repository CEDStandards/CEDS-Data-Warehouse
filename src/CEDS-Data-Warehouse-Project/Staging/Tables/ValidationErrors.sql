CREATE TABLE [Staging].[ValidationErrors] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [ProcessName] VARCHAR (100) NULL,
    [TableName]   VARCHAR (100) NULL,
    [ElementName] VARCHAR (100) NULL,
    [ErrorSimple] VARCHAR (500) NULL,
    [ErrorDetail] VARCHAR (500) NULL,
    [ErrorGroup]  INT           NULL,
    [Identifier]  VARCHAR (100) NULL,
    [CreateDate]  DATETIME      NULL,
    CONSTRAINT [PK_ValidationErrors] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

