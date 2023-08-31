CREATE TABLE [RDS].[DimFiscalYears](
	[DimFiscalYearId] [int] IDENTITY(1,1) NOT NULL,
	[FiscalPeriodBeginDate] [nvarchar](30) 	NOT NULL,
	[FiscalPeriodEndDate] [nvarchar](100) 	NOT NULL,	
	[FiscalYear] [nvarchar](300) 			NOT NULL,
 CONSTRAINT [PK_DimFiscalYears] PRIMARY KEY NONCLUSTERED 
(
	[DimFiscalYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which an accounting period begins.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodBeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Fiscal Period Begin Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodBeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001642' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodBeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22623' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodBeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodBeginDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which an accounting period ends.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Fiscal Period End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001643' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21624' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalPeriodEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year an organization uses for budgeting, accounting, and reporting financials.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Fiscal Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001639' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22620' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFiscalYears', @level2type=N'COLUMN',@level2name=N'FiscalYear'
GO

