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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'StagingValidationResults', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'StagingValidationResults', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'StagingValidationResults', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'StagingValidationResults', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'StagingValidationResults', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO