CREATE TABLE [RDS].[DimActivities]
(
	[DimActivityId] int NOT NULL IDENTITY (1, 1),
	[ActivityIdentifier] nvarchar(40) NULL,
	[ActivityTitle] nvarchar(60) NULL,
	[ActivityDescription] nvarchar(300) NULL,
	[RecordStartDateTime] datetime NULL,
	[RecordEndDateTime] datetime NULL,
	CONSTRAINT [PK_DimActivities] PRIMARY KEY CLUSTERED ([DimActivityId] ASC)
)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An organized activity, such as a co-curricular or extra-curricular activity that is offered at an education institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An identifier assigned to the activity by the organization that offers it.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title for a particular activity, such as a co-curricular or extra-curricular activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Activity Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000009' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000009' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the events and procedures that take place under the purview of an organized activity, such as a co-curricular or extra-curricular activity that is offered at an education institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Activity Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimActivities', @level2type=N'COLUMN',@level2name=N'ActivityDescription';
GO
