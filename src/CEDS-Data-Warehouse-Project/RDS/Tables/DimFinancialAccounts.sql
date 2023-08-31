CREATE TABLE [RDS].[DimFinancialAccounts](
	[DimFinancialAccountId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountNumber] 						[nvarchar](30)  CONSTRAINT [DF_DimFinancialAccounts_FinancialAccountNumber] DEFAULT ('MISSING') NOT NULL,
	[FinancialAccountName] 							[nvarchar](100) CONSTRAINT [DF_DimFinancialAccounts_FinancialAccountName] DEFAULT ('MISSING') NOT NULL,	
	[FinancialAccountDescription] 					[nvarchar](300) CONSTRAINT [DF_DimFinancialAccounts_FinancialAccountDescription] DEFAULT ('MISSING') NOT NULL,
 CONSTRAINT [PK_DimFinancialAccounts] PRIMARY KEY NONCLUSTERED 
(
	[DimFinancialAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number given to a financial account within a local source accounting system. The number may be a concatenation of a standard prefix for the type of account with digits added that have specific meaning within the local system.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001554' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name given to the financial account in an organization''s accounting system.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001348' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21315' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description for the financial account in an organization''s accounting system.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22313' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFinancialAccounts', @level2type=N'COLUMN',@level2name=N'FinancialAccountDescription'
GO


