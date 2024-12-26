CREATE TABLE [RDS].[BridgeK12StaffCompensationSeaFinancialAccountClassifications]
(
	[BridgeK12StaffCompensationSeaFinancialAccountClassificationId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffCompensationId] INT NULL,
	[SeaFinancialAccountClassificationId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffCompensationSeaFinancialAccountClassifications] PRIMARY KEY CLUSTERED ([BridgeK12StaffCompensationSeaFinancialAccountClassificationId] ASC),
	CONSTRAINT [FK_BridgeK12StaffCompensationSeaFinancialAccountClassifications_FactK12StaffCompensationId] FOREIGN KEY ([FactK12StaffCompensationId]) REFERENCES [RDS].[FactK12StaffCompensations] ([FactK12StaffCompensationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffCompensationSeaFinancialAccountClassifications_SeaFinancialAccountClassificationId] FOREIGN KEY ([SeaFinancialAccountClassificationId]) REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCompensationSeaFinancialAccountClassifications_DimSeaFinancialAccountClassifications] 
 ON [RDS].[BridgeK12StaffCompensationSeaFinancialAccountClassifications] ([SeaFinancialAccountClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCompensationSeaFinancialAccountClassifications_FactK12StaffCompensations] 
 ON [RDS].[BridgeK12StaffCompensationSeaFinancialAccountClassifications] ([FactK12StaffCompensationId] ASC)
GO
