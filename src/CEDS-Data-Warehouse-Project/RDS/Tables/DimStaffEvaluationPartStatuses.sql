CREATE TABLE [RDS].[DimStaffEvaluationPartStatuses]
(
	[DimStaffEvaluationPartStatusId] int NOT NULL IDENTITY (1, 1),
	[StaffEvaluationSystem] nvarchar(60) NULL,
	[FacultyAndAdministrationPerformanceLevelCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[FacultyAndAdministrationPerformanceLevelDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[TechnologySkillsStandardsMetCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[TechnologySkillsStandardsMetDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[StaffEvaluationPartName] nvarchar(60) NULL,
	CONSTRAINT [PK_DimStaffEvaluationPartStatuses] PRIMARY KEY CLUSTERED ([DimStaffEvaluationPartStatusId] ASC)
)
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The levels used in district evaluation systems for assigning teacher or principal performance ratings.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Faculty and Administration Performance Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000589' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000589' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The levels used in district evaluation systems for assigning teacher or principal performance ratings.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Faculty and Administration Performance Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000589' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000589' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'FacultyAndAdministrationPerformanceLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the person has achieved acceptable performance on a standards-based profile of technology user skills as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Technology Skills Standards Met' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the person has achieved acceptable performance on a standards-based profile of technology user skills as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Technology Skills Standards Met' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'TechnologySkillsStandardsMetDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationPartName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the component part that is being evaluated and scored.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationPartName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Evaluation Part Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationPartName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001985' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationPartName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001985' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationPartName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The instrument and/or set of procedures with which a person''s performance is assessed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Evaluation System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000105' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationSystem';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000105' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationPartStatuses', @level2type=N'COLUMN',@level2name=N'StaffEvaluationSystem';
GO