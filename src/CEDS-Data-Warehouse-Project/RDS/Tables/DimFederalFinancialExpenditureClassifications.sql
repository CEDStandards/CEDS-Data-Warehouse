CREATE TABLE [RDS].[DimFederalFinancialExpenditureClassifications](
	[DimFederalFinancialExpenditureClassificationId] 					[int] IDENTITY(1,1) NOT NULL,
	[FinancialExpenditureFunctionCodeCode] 								[nvarchar](50) 		CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureFunctionCodeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureFunctionCodeDescription] 						[nvarchar](150) 	CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureFunctionCodeDescription] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureObjectCodeCode] 								[nvarchar](50) 		CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureObjectCodeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureObjectCodeDescription] 						[nvarchar](150) 	CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureObjectCodeDescription] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureLevelOfInstructionCodeCode] 					[nvarchar](50) 		CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureLevelOfInstructionCodeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureLevelOfInstructionCodeDescription] 			[nvarchar](150) 	CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureLevelOfInstructionCodeDescription] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureProjectReportingCodeCode] 						[nvarchar](50) 		CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureProjectReportingCodeCode] DEFAULT ('MISSING') NOT NULL,
	[FinancialExpenditureProjectReportingCodeDescription] 				[nvarchar](150) 	CONSTRAINT [DF_DimFederalFinancialExpenditureClassifications_FinancialExpenditureProjectReportingCodeDescription] DEFAULT ('MISSING') NOT NULL,
 CONSTRAINT [PK_DimFederalFinancialExpenditureClassifications] PRIMARY KEY NONCLUSTERED 
(
	[DimFederalFinancialExpenditureClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The function describes the activity for which a service or material object is acquired. The functions of an organization are classified into five broad areas: instruction, support services, operation of non-instructional services, facilities acquisition and construction, and debt service. Functions are further classified into sub functions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Function Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001354' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22321' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The function describes the activity for which a service or material object is acquired. The functions of an organization are classified into five broad areas: instruction, support services, operation of non-instructional services, facilities acquisition and construction, and debt service. Functions are further classified into sub functions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Function Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001354' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22321' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureFunctionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'This classification is used to describe the service or commodity obtained as the result of a specific expenditure. Nine major object categories have codes ending in 00 and are further subdivided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Object Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001355' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22322' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'This classification is used to describe the service or commodity obtained as the result of a specific expenditure. Nine major object categories have codes ending in 00 and are further subdivided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Object Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001355' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22322' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureObjectCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'This classification permits expenditures to be segregated by instructional level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Level of Instruction Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22531' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'This classification permits expenditures to be segregated by instructional level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Level of Instruction Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22531' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureLevelOfInstructionCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The project/reporting code permits organizations to accumulate expenditures to meet a variety of specialized reporting requirements at the local, state, and federal levels. It is a three-digit code with the format 00X. The first two digits identify the particular funding source, authority, or expenditure purpose for which a special record or report is required. The third digit is available to identify particular projects and the fiscal year of the appropriation within that funding source. Each classification is presented by a code range followed by a description.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Project Reporting Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The project/reporting code permits organizations to accumulate expenditures to meet a variety of specialized reporting requirements at the local, state, and federal levels. It is a three-digit code with the format 00X. The first two digits identify the particular funding source, authority, or expenditure purpose for which a special record or report is required. The third digit is available to identify particular projects and the fiscal year of the appropriation within that funding source. Each classification is presented by a code range followed by a description.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Expenditure Project Reporting Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFederalFinancialExpenditureClassifications', @level2type=N'COLUMN',@level2name=N'FinancialExpenditureProjectReportingCodeDescription'
GO