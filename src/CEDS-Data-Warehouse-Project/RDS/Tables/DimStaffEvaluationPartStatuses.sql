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