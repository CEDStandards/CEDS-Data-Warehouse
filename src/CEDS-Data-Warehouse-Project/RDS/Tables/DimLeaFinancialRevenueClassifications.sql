CREATE TABLE [RDS].[DimLeaFinancialRevenueClassifications](
	[DimLeaFinancialRevenueClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountCodingSystemOrganizationTypeCode] [nvarchar](50) NULL,
	[FinancialAccountCodingSystemOrganizationTypeDescription] [nvarchar](150) NULL,	
	[FinancialAccountLocalRevenueCodeCode] [nvarchar](50) NULL,
	[FinancialAccountLocalRevenueCodeDescription] [nvarchar](150) NULL,	
 CONSTRAINT [PK_DimLeaFinancialRevenueClassifications] PRIMARY KEY NONCLUSTERED 
(
	[DimLeaFinancialRevenueClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to record revenue and other receivables by source.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Local Revenue Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002003' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22985' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to record revenue and other receivables by source.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Local Revenue Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002003' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22985' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLeaFinancialRevenueClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountLocalRevenueCodeDescription'
GO

