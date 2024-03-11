CREATE TABLE [RDS].[DimSeaFinancialExpenditureClassifications](
	[DimSeaFinancialExpenditureClassificationId] 						[int] IDENTITY(1,1) NOT NULL,
	[FinancialAccountCodingSystemOrganizationTypeCode] 					[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialAccountCodingSystemOrganizationTypeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialAccountCodingSystemOrganizationTypeDescription] 			[nvarchar](150) CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialAccountCodingSystemOrganizationTypeDescription] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalFunctionCodeCode] 						[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalFunctionCodeCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalFunctionCodeFederalCode] 					[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalFunctionCodeFederalCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalFunctionCodeDescription] 					[nvarchar](150) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalFunctionCodeDescription] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalObjectCodeCode] 							[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalObjectCodeCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalObjectCodeFederalCode] 					[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalObjectCodeFederalCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalObjectCodeDescription] 					[nvarchar](150) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalObjectCodeDescription] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalLevelOfInstructionCodeCode] 				[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalLevelOfInstructionCodeCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalLevelOfInstructionCodeFederalCode] 		[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalLevelOfInstructionCodeFederalCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureLocalLevelOfInstructionCodeDescription] 		[nvarchar](150) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureLocalLevelOfInstructionCodeDescription] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureProjectReportingCodeCode] 						[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureProjectReportingCodeCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureProjectReportingCodeFederalCode] 				[nvarchar](50) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureProjectReportingCodeFederalCode] DEFAULT ('MISSING') NOT NULL,	
	[FinancialExpenditureProjectReportingCodeDescription] 				[nvarchar](150) 	CONSTRAINT [DF_DimSeaFinancialExpenditureClassifications_FinancialExpenditureProjectReportingCodeDescription] DEFAULT ('MISSING') NOT NULL,	
 CONSTRAINT [PK_DimSeaFinancialExpenditureClassifications] PRIMARY KEY NONCLUSTERED 
(
	[DimSeaFinancialExpenditureClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of organization that created the coding system for the financial account information.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Account Coding System Organization Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002011' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22981' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialAccountCodingSystemOrganizationTypeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe the activity for which a service or material object is acquired.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Local Function Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002004' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22986' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe the activity for which a service or material object is acquired.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Local Function Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002004' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22986' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe the service or commodity obtained as the result of a specific expenditure.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Local Object Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002005' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to describe the service or commodity obtained as the result of a specific expenditure.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Local Object Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002005' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to classify the segregation of expenditures by instructional level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Local Level of Instruction Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A local code used to classify the segregation of expenditures by instructional level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Local Level of Instruction Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLocalLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The project/reporting code permits organizations to accumulate expenditures to meet a variety of specialized reporting requirements at the local, state, and federal levels. It is a three-digit code with the format 00X. The first two digits identify the particular funding source, authority, or expenditure purpose for which a special record or report is required. The third digit is available to identify particular projects and the fiscal year of the appropriation within that funding source. Each classification is presented by a code range followed by a description.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Project Reporting Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The project/reporting code permits organizations to accumulate expenditures to meet a variety of specialized reporting requirements at the local, state, and federal levels. It is a three-digit code with the format 00X. The first two digits identify the particular funding source, authority, or expenditure purpose for which a special record or report is required. The third digit is available to identify particular projects and the fiscal year of the appropriation within that funding source. Each classification is presented by a code range followed by a description.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Project Reporting Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSeaFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO














