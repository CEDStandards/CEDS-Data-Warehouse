CREATE TABLE [RDS].[DimAeProgramYears] (
    [DimAeProgramYearId] INT      IDENTITY (1, 1) NOT NULL,
    [AeProgramYear]      SMALLINT NOT NULL,
    [SessionBeginDate]   DATETIME NOT NULL,
    [SessionEndDate]     DATETIME NOT NULL,
    CONSTRAINT [PK_DimAeProgramYears] PRIMARY KEY CLUSTERED ([DimAeProgramYearId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a session begins.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Begin Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000251' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21251' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionBeginDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a session ends.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000253' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21253' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramYears', @level2type=N'COLUMN',@level2name=N'SessionEndDate';
GO