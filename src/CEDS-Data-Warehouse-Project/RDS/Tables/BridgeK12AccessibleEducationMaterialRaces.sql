CREATE TABLE [RDS].[BridgeK12AccessibleEducationMaterialRaces]
(
	[BridgeK12AccessibleEducationMaterialRaceId] int NOT NULL IDENTITY (1, 1),
	[FactK12AccessibleEducationMaterialAssignmentId] int NULL,
	[RaceId] int NULL,
	CONSTRAINT [PK_BridgeK12AccessibleEducationMaterialRaces] PRIMARY KEY CLUSTERED ([BridgeK12AccessibleEducationMaterialRaceId] ASC),
	CONSTRAINT [FK_BridgeK12AccessibleEducationMaterialRaces_FactK12AccessibleEducationMaterialAssignments] FOREIGN KEY ([FactK12AccessibleEducationMaterialAssignmentId]) REFERENCES [RDS].[FactK12AccessibleEducationMaterialAssignments] ([FactK12AccessibleEducationMaterialAssignmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12AccessibleEducationMaterialRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action
)
GO


CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AccessibleEducationMaterialRaces_DimRaces] 
 ON [RDS].[BridgeK12AccessibleEducationMaterialRaces] ([RaceId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AccessibleEducationMaterialRaces_FactK12AccessibleEducationMaterialAssignments] 
 ON [RDS].[BridgeK12AccessibleEducationMaterialRaces] ([FactK12AccessibleEducationMaterialAssignmentId] ASC)
GO