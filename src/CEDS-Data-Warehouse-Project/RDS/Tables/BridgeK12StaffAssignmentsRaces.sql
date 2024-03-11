CREATE TABLE [RDS].[BridgeK12StaffAssignmentsRaces]
(
	[BridgeK12StaffAssignmentRaceId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffAssignmentId] int NULL,
	[RaceId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffAssignmentsRaces] PRIMARY KEY CLUSTERED ([BridgeK12StaffAssignmentRaceId] ASC),
	CONSTRAINT [FK_BridgeK12StaffAssignmentsRaces_FactK12StaffAssignmentId] FOREIGN KEY ([FactK12StaffAssignmentId]) REFERENCES [RDS].[FactK12StaffAssignments] ([FactK12StaffAssignmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffAssignmentsRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentsRaces_DimRaces] 
 ON [RDS].[BridgeK12StaffAssignmentsRaces] ([RaceId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentsRaces_FactK12StaffAssignments] 
 ON [RDS].[BridgeK12StaffAssignmentsRaces] ([FactK12StaffAssignmentId] ASC)
GO

