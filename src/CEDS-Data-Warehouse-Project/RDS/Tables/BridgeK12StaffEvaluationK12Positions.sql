CREATE TABLE [RDS].[BridgeK12StaffEvaluationK12Positions]
(
	[BridgeK12StaffEvaluationK12PositionId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffEvaluationId] int NULL,
	[K12PositionId] int NULL,
	CONSTRAINT [PK_BridgeFactK12StaffEvaluationK12Positions] PRIMARY KEY CLUSTERED ([BridgeK12StaffEvaluationK12PositionId] ASC),
	CONSTRAINT [FK_BridgeFactK12StaffEvaluationK12Positions_FactK12StaffEvaluations] FOREIGN KEY ([FactK12StaffEvaluationId]) REFERENCES [RDS].[FactK12StaffEvaluationParts] ([FactK12StaffEvaluationPartId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeFactK12StaffEvaluationK12Positions_K12PositionId] FOREIGN KEY ([K12PositionId]) REFERENCES [RDS].[DimK12Positions] ([DimK12PositionId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeFactK12StaffEvaluationK12Positions_DimK12Positions] 
 ON [RDS].[BridgeK12StaffEvaluationK12Positions] ([K12PositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeFactK12StaffEvaluationK12Positions_FactK12StaffEvaluations] 
 ON [RDS].[BridgeK12StaffEvaluationK12Positions] ([FactK12StaffEvaluationId] ASC)
GO
