CREATE TABLE [RDS].[DimCohorts] (
    [DimCohortId]       INT           IDENTITY (1, 1) NOT NULL,
    [CohortDescription]        VARCHAR (50)  CONSTRAINT [DF_DimCohorts_CohortDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCohorts] PRIMARY KEY CLUSTERED ([DimCohortId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohorts', @level2type=N'COLUMN',@level2name=N'CohortDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the student cohort.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohorts', @level2type=N'COLUMN',@level2name=N'CohortDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Cohort Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohorts', @level2type=N'COLUMN',@level2name=N'CohortDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000711' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohorts', @level2type=N'COLUMN',@level2name=N'CohortDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'ttps://ceds.ed.gov/element/000711' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCohorts', @level2type=N'COLUMN',@level2name=N'CohortDescription';
GO
