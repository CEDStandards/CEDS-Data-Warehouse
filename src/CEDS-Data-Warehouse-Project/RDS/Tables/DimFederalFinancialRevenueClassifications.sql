CREATE TABLE [RDS].[DimFederalFinancialRevenueClassifications](
	[DimFederalFinancialRevenueClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountRevenueCodeCode] [nvarchar](50) NULL,
	[FinancialAccountRevenueCodeDescription] [nvarchar](150) NULL,	
 CONSTRAINT [PK_DimFederalFinancialRevenueClassifications] PRIMARY KEY NONCLUSTERED 
(
	[DimFederalFinancialRevenueClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'These codes are for recording revenue and other receivables by source. Major revenue categories have codes ending in 00 and are further subdivided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Revenue Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001468' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22440' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'These codes are for recording revenue and other receivables by source. Major revenue categories have codes ending in 00 and are further subdivided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Revenue Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001468' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22440' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountRevenueCodeDescription'
GO

