CREATE TABLE [Staging].[StagingValidationRules] (
    [StagingValidationRuleId] INT            IDENTITY (1, 1) NOT NULL,
    [ReportGroupOrCodes]      VARCHAR (500)  NULL,
    [RuleDscr]                VARCHAR (MAX)  NULL,
    [StagingTableName]        VARCHAR (100)  NOT NULL,
    [ColumnName]              VARCHAR (100)  NULL,
    [ValidationType]          VARCHAR (20)   NOT NULL,
    [RefTableName]            VARCHAR (100)  NULL,
    [TableFilter]             VARCHAR (10)   NULL,
    [Condition]               VARCHAR (2000) NULL,
    [ValidationMessage]       VARCHAR (2000) NULL,
    [Severity]                VARCHAR (50)   NULL,
    [CreatedBy]               VARCHAR (50)   NULL,
    [CreateDateTime]          AS             (getdate()),
    CONSTRAINT [PK_StagingValidationConfig] PRIMARY KEY CLUSTERED ([StagingValidationRuleId] ASC)
);


GO

