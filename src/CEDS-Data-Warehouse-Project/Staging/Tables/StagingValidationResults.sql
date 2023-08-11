CREATE TABLE [Staging].[StagingValidationResults] (
    [Id]                      INT           IDENTITY (1, 1) NOT NULL,
    [StagingValidationRuleId] INT           NULL,
    [SchoolYear]              INT           NULL,
    [ReportGroupOrCode]       VARCHAR (50)  NULL,
    [StagingTableName]        VARCHAR (200) NULL,
    [ColumnName]              VARCHAR (100) NULL,
    [Severity]                VARCHAR (50)  NULL,
    [ValidationMessage]       VARCHAR (500) NULL,
    [RecordCount]             INT           NULL,
    [ShowRecordsSQL]          VARCHAR (MAX) NULL,
    [InsertDate]              DATETIME      NULL,
    CONSTRAINT [PK_StagingValidationResults] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

