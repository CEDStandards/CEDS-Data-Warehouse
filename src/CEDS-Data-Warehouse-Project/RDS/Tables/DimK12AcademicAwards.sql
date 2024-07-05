CREATE TABLE [RDS].[DimK12AcademicAwards] (
    [DimK12AcademicAwardId] INT            IDENTITY (1, 1) NOT NULL,
    [AcademicAwardTitle]        NVARCHAR (160) NOT NULL,
    CONSTRAINT [PK_DimK12AcademicAwards] PRIMARY KEY CLUSTERED ([DimK12AcademicAwardId] ASC) WITH (FILLFACTOR = 80)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive title for the academic award.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Award Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000003' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'ttps://ceds.ed.gov/element/000003' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO