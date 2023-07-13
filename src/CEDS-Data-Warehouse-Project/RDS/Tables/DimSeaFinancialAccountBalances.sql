CREATE TABLE [RDS].[DimSeaFinancialAccountBalances](
	[DimSeaFinancialAccountBalanceId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountCodingSystemOrganizationTypeCode] [nvarchar](50) NULL,
	[FinancialAccountCodingSystemOrganizationTypeDescription] [nvarchar](150) NULL,
	[FinancialAccountLocalBalanceSheetCode] [nvarchar](50) NULL,
	[FinancialAccountLocalBalanceSheetDescription] [nvarchar](150) NULL,
 CONSTRAINT [PK_DimSeaFinancialAccountBalances] PRIMARY KEY NONCLUSTERED 
(
	[DimSeaFinancialAccountBalanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe balance sheet accounts and statement of net position accounts which are used to track financial transactions for each fund. Such financial statements only report assets, deferred outflows of resources, liabilities, deferred inflows of resources, and equity accounts and are considered "snapshots" of how these accounts stand as of a certain point in time.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Local Balance Sheet Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002007' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22982' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe balance sheet accounts and statement of net position accounts which are used to track financial transactions for each fund. Such financial statements only report assets, deferred outflows of resources, liabilities, deferred inflows of resources, and equity accounts and are considered "snapshots" of how these accounts stand as of a certain point in time.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Local Balance Sheet Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002007' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22982' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetDescription'
GO
















