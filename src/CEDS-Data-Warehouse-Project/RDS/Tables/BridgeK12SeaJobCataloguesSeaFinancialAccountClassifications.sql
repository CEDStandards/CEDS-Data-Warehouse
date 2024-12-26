CREATE TABLE [RDS].[BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications]
(
	[BridgeK12SeaJobCatalogueSeaFinancialAccountClassificationId] int NOT NULL IDENTITY (1, 1),
	[FactK12SeaJobCatalogueId] INT NULL,
	[SeaFinancialAccountClassificationId] int NULL,
    [FundingProgramAllowed]    NVARCHAR (50)  NOT NULL,
	CONSTRAINT [PK_BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications] PRIMARY KEY CLUSTERED ([BridgeK12SeaJobCatalogueSeaFinancialAccountClassificationId] ASC),
	CONSTRAINT [FK_BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications_FactK12SeaJobCatalogueId] FOREIGN KEY ([FactK12SeaJobCatalogueId]) REFERENCES [RDS].[FactK12SeaJobCatalogues] ([FactK12SeaJobCatalogueId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications_SeaFinancialAccountClassificationId] FOREIGN KEY ([SeaFinancialAccountClassificationId]) REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications_DimSeaFinancialAccountClassifications] 
 ON [RDS].[BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications] ([SeaFinancialAccountClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications_FactK12SeaJobCatalogues] 
 ON [RDS].[BridgeK12SeaJobCatalogueSeaFinancialAccountClassifications] ([FactK12SeaJobCatalogueId] ASC)
GO

