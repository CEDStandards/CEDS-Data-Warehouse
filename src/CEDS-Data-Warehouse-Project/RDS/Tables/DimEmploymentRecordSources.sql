CREATE TABLE [RDS].[DimEmploymentRecordSources] (
    [DimEmploymentRecordSourceId]           INT           IDENTITY (1, 1) NOT NULL,
    [EmploymentRecordAdministrativeDataSourceCode]        VARCHAR (50)  CONSTRAINT [DF_DimEmploymentRecordSources_EmploymentRecordAdministrativeDataSourceCode] DEFAULT ('MISSING') NOT NULL,
    [EmploymentRecordAdministrativeDataSourceDescription] VARCHAR (200) CONSTRAINT [DF_DimEmploymentRecordSources_EmploymentRecordAdministrativeDataSourceDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimEmploymentRecordSources] PRIMARY KEY CLUSTERED ([DimEmploymentRecordSourceId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimEmploymentRecordSources_EmploymentRecordAdministrativeDataSourceCode]
    ON [RDS].[DimEmploymentRecordSources]([EmploymentRecordAdministrativeDataSourceCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Administrative data source of information used to collect employment and earnings-related data.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Record Administrative Data Source' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000994' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000994' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Administrative data source of information used to collect employment and earnings-related data.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Record Administrative Data Source' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000994' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000994' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmploymentRecordSources', @level2type=N'COLUMN',@level2name=N'EmploymentRecordAdministrativeDataSourceDescription';
GO
