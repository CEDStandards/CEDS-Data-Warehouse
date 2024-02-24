CREATE TABLE [RDS].[BridgeK12StaffAssignmentGradeLevels]
(
	[BridgeK12StaffAssignmentGradeLevelId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffAssignmentId] int NULL,
	[GradeLevelId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffAssignmentGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12StaffAssignmentGradeLevelId] ASC),
	CONSTRAINT [FK_BridgeK12StaffAssignmentGradeLevels_FactK12StaffAssignmentId] FOREIGN KEY ([FactK12StaffAssignmentId]) REFERENCES [RDS].[FactK12StaffAssignments] ([FactK12StaffAssignmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffAssignmentGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentGradeLevels_DimGradeLevels] 
 ON [RDS].[BridgeK12StaffAssignmentGradeLevels] ([GradeLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentGradeLevels_FactK12StaffAssignments] 
 ON [RDS].[BridgeK12StaffAssignmentGradeLevels] ([FactK12StaffAssignmentId] ASC)
GO

