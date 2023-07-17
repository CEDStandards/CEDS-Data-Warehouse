CREATE TABLE [RDS].[DimFederalFinancialAccountBalances](
	[DimFederalFinancialAccountBalanceId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountBalanceSheetCodeCode] [nvarchar](50) NULL,
	[FinancialAccountBalanceSheetCodeDescription] [nvarchar](150) NULL,
 CONSTRAINT [PK_DimFederalFinancialAccountBalances] PRIMARY KEY NONCLUSTERED 
(
	[DimFederalFinancialAccountBalanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Balance sheet accounts and statement of net position accounts are used to track financial transactions for each fund. Such financial statements only report assets, deferred outflows of resources, liabilities, deferred inflows of resources, and equity accounts and are considered "snapshots" of how these accounts stand as of a certain point in time.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Balance Sheet Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001353' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Balance sheet accounts and statement of net position accounts are used to track financial transactions for each fund. Such financial statements only report assets, deferred outflows of resources, liabilities, deferred inflows of resources, and equity accounts and are considered "snapshots" of how these accounts stand as of a certain point in time.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Balance Sheet Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001353' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22320' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountBalanceSheetCodeDescription'
GO













