CREATE TABLE [RDS].[DimSalaryScheduleCriteria](
	[DimSalaryScheduleCriteriaId] 				[int] IDENTITY(1,1) NOT NULL,
	[SalaryScheduleCriterionName] 				[nvarchar](100) 	CONSTRAINT [DF_DimSalaryScheduleCriteria_SalaryScheduleCriterionName] DEFAULT ('MISSING') NOT NULL,
	[SalaryScheduleCriterionDescription] 		[nvarchar](4000)	CONSTRAINT [DF_DimSalaryScheduleCriteria_SalaryScheduleCriterionDescription] DEFAULT ('MISSING') NOT NULL,	
	[SalaryScheduleCriterionValue] 				[nvarchar](100) 	CONSTRAINT [DF_DimSalaryScheduleCriteria_SalaryScheduleCriterionValue] DEFAULT ('MISSING') NOT NULL,
 CONSTRAINT [PK_DimSalaryScheduleCriteria] PRIMARY KEY NONCLUSTERED 
(
	[DimSalaryScheduleCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A name given to a specific criterion used to determine a salary provided or offered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Salary Schedule Criterion Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/428' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description given to a specific criterion used to determine a salary provided or offered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Salary Schedule Criterion Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/428' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique value or code assigned to a salary schedule criterion used to differentiate between the achievable levels of the criterion.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Salary Schedule Criterion Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/428' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimSalaryScheduleCriteria', @level2type=N'COLUMN',@level2name=N'SalaryScheduleCriterionValue'
GO


