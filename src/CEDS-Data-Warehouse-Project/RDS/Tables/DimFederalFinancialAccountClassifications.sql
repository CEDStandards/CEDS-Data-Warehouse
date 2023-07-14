CREATE TABLE [RDS].[DimFederalFinancialAccountClassifications](
	[DimFederalFinancialAccountClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountCategoryCode] [nvarchar](50) NULL,
	[FinancialAccountCategoryDescription] [nvarchar](150) NULL,
	[FinancialAccountProgramCodeCode] [nvarchar](50) NULL,
	[FinancialAccountProgramCodeDescription] [nvarchar](150) NULL,
	[FinancialAccountFundClassificationCode] [nvarchar](50) NULL,
	[FinancialAccountFundClassificationDescription] [nvarchar](150) NULL,
 CONSTRAINT [PK_DimFederalFinancialAccountClassifications] PRIMARY KEY NONCLUSTERED 
(
	[DimFederalFinancialAccountClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A label for a grouping of financial accounts, based on type and purpose.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001345' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22312' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A label for a grouping of financial accounts, based on type and purpose.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001345' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22312' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCategoryDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A program is a plan of activities and procedures designed to accomplish a predetermined objective or set of objectives. The program classification provides the organization with a framework to classify instructional and other expenditures by program to determine cost.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001349' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22316' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A program is a plan of activities and procedures designed to accomplish a predetermined objective or set of objectives. The program classification provides the organization with a framework to classify instructional and other expenditures by program to determine cost.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001349' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22316' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountProgramCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A fund is a separate fiscal and accounting entity with a self-balancing set of accounts recording cash and other financial resources, together with all related liabilities and residual equities or balances or changes therein.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Fund Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001347' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22314' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A fund is a separate fiscal and accounting entity with a self-balancing set of accounts recording cash and other financial resources, together with all related liabilities and residual equities or balances or changes therein.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Fund Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001347' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22314' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountFundClassificationDescription'
GO
