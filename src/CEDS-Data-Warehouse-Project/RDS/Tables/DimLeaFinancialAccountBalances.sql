CREATE TABLE [RDS].[DimLeaFinancialAccountBalances](
	[DimLeaFinancialAccountBalanceId] 								[int] IDENTITY(1,1) 	NOT NULL,
	[FinancialAccountCodingSystemOrganizationTypeCode] 				[nvarchar](50) 			CONSTRAINT [DF_DimLeaFinancialAccountBalances_FinancialAccountCodingSystemOrganizationTypeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialAccountCodingSystemOrganizationTypeDescription] 		[nvarchar](150) 		CONSTRAINT [DF_DimLeaFinancialAccountBalances_FinancialAccountCodingSystemOrganizationTypeDescription] DEFAULT ('MISSING') NOT NULL,
	[FinancialAccountLocalBalanceSheetCodeCode] 					[nvarchar](50) 			CONSTRAINT [DF_DimLeaFinancialAccountBalances_FinancialAccountLocalBalanceSheetCodeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialAccountLocalBalanceSheetCodeSeaCode] 					[nvarchar](50) 			CONSTRAINT [DF_DimLeaFinancialAccountBalances_FinancialAccountLocalBalanceSheetCodeSeaCod] DEFAULT ('MISSING') NOT NULL,
	[FinancialAccountLocalBalanceSheetCodeDescription] 				[nvarchar](150)			CONSTRAINT [DF_DimLeaFinancialAccountBalances_FinancialAccountLocalBalanceSheetCodeDescription] DEFAULT ('MISSING') NOT NULL,
 CONSTRAINT [PK_DimLeaFinancialAccountBalances] PRIMARY KEY NONCLUSTERED 
(
	[DimLeaFinancialAccountBalanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe balance sheet accounts and statement of net position accounts which are used to track financial transactions for each fund. Such financial statements only report assets, deferred outflows of resources, liabilities, deferred inflows of resources, and equity accounts and are considered "snapshots" of how these accounts stand as of a certain point in time.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Local Balance Sheet Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002007' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22982' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe balance sheet accounts and statement of net position accounts which are used to track financial transactions for each fund. Such financial statements only report assets, deferred outflows of resources, liabilities, deferred inflows of resources, and equity accounts and are considered "snapshots" of how these accounts stand as of a certain point in time.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Local Balance Sheet Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002007' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22982' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalBalanceSheetCodeDescription'
GO
















