CREATE TABLE [RDS].[BridgeK12StudentCourseSectionGradeLevels]
(
	[BridgeK12StudentCourseSectionGradeLevelId] int NOT NULL IDENTITY (1, 1),
	[FactK12StudentCourseSectionId] BIGINT NULL,
	[GradeLevelId] int NULL,
	CONSTRAINT [PK_BridgeK12StudentCourseSectionGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12StudentCourseSectionGradeLevelId] ASC),
	CONSTRAINT [FK_BridgeK12StudentCourseSectionGradeLevels_FactK12StudentCourseSectionId] FOREIGN KEY ([FactK12StudentCourseSectionId]) REFERENCES [RDS].[FactK12StudentCourseSections] ([FactK12StudentCourseSectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StudentCourseSectionGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionGradeLevels_DimGradeLevels] 
 ON [RDS].[BridgeK12StudentCourseSectionGradeLevels] ([GradeLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionGradeLevels_FactK12StudentCourseSections] 
 ON [RDS].[BridgeK12StudentCourseSectionGradeLevels] ([FactK12StudentCourseSectionId] ASC)
GO

