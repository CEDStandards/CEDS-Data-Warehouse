CREATE TABLE [RDS].[BridgeK12StaffEvaluationRaces]
(
	[BridgeK12StaffEvaluationRaceId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffEvaluationId] int NULL,
	[RaceId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffEvaluationRaces] PRIMARY KEY CLUSTERED ([BridgeK12StaffEvaluationRaceId] ASC),
	CONSTRAINT [FK_BridgeK12StaffEvaluationRaces_FactK12StaffEvaluations] FOREIGN KEY ([FactK12StaffEvaluationId]) REFERENCES [RDS].[FactK12StaffEvaluationParts] ([FactK12StaffEvaluationPartId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffEvaluationRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffEvaluationRaces_DimRaces] 
 ON [RDS].[BridgeK12StaffEvaluationRaces] ([RaceId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffEvaluationRaces_FactK12StaffEvaluations] 
 ON [RDS].[BridgeK12StaffEvaluationRaces] ([FactK12StaffEvaluationId] ASC)
GO

