CREATE TABLE [RDS].[BridgeK12StaffCourseSectionGradeLevels]
(
	[BridgeK12StaffCourseSectionGradeLevelId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffCourseSectionId] BIGINT NULL,
	[GradeLevelId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffCourseSectionGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12StaffCourseSectionGradeLevelId] ASC),
	CONSTRAINT [FK_BridgeK12StaffCourseSectionGradeLevels_FactK12StaffCourseSectionId] FOREIGN KEY ([FactK12StaffCourseSectionId]) REFERENCES [RDS].[FactK12StaffCourseSections] ([FactK12StaffCourseSectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffCourseSectionGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCourseSectionGradeLevels_DimGradeLevels] 
 ON [RDS].[BridgeK12StaffCourseSectionGradeLevels] ([GradeLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCourseSectionGradeLevels_FactK12StaffCourseSections] 
 ON [RDS].[BridgeK12StaffCourseSectionGradeLevels] ([FactK12StaffCourseSectionId] ASC)
GO

