CREATE TABLE [RDS].[DimWorkBasedLearningStatuses]
(
	[DimWorkBasedLearningStatusId] int NOT NULL IDENTITY (1, 1),
	[WorkBasedLearningOpportunityTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[WorkBasedLearningOpportunityTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimWorkBasedLearningStatuses] PRIMARY KEY CLUSTERED ([DimWorkBasedLearningStatusId] ASC)
)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of work-based learning opportunity a student participated in.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Work-based Learning Opportunity Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001499' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001499' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of work-based learning opportunity a student participated in.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Work-based Learning Opportunity Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001499' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001499' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimWorkBasedLearningStatuses', @level2type=N'COLUMN',@level2name=N'WorkBasedLearningOpportunityTypeDescription';
GO