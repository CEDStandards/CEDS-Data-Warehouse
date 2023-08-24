CREATE TABLE [RDS].[BridgeK12StudentEconomicDisadvantageRaces] (
    [BridgeK12StudentEconomicDisadvantageRaceId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentEconomicDisadvantageId]       INT CONSTRAINT [DF_BridgeK12StudentEconomicDisadvantageRaces_FactK12StudentEconomicDisadvantageId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                                     INT CONSTRAINT [DF_BridgeK12StudentEconomicDisadvantageRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentEconomicDisadvantageRaces] PRIMARY KEY CLUSTERED ([BridgeK12StudentEconomicDisadvantageRaceId] ASC),
    CONSTRAINT [FK_BridgeK12StudentEconomicDisadvantageRaces_FactK12StudentEconomicDisadvantageId] FOREIGN KEY ([FactK12StudentEconomicDisadvantageId]) REFERENCES [RDS].[FactK12StudentEconomicDisadvantages] ([FactK12StudentEconomicDisadvantageId]),
    CONSTRAINT [FK_BridgeK12StudentEconomicDisadvantageRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEconomicDisadvantageRaces_RaceId]
    ON [RDS].[BridgeK12StudentEconomicDisadvantageRaces]([RaceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEconomicDisadvantageRaces_FactK12StudentEconomicDisadvantageId]
    ON [RDS].[BridgeK12StudentEconomicDisadvantageRaces]([FactK12StudentEconomicDisadvantageId] ASC);


GO

