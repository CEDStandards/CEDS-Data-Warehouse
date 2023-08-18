CREATE TABLE [RDS].[BridgeK12StudentDisciplineRaces] (
    [BridgeK12StudentDisciplineRaceId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentDisciplineId]       INT CONSTRAINT [DF_BridgeK12StudentDisciplineRaces_FactK12StudentDisciplineId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                           INT CONSTRAINT [DF_BridgeK12StudentDisciplineRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentDisciplineRaces] PRIMARY KEY CLUSTERED ([BridgeK12StudentDisciplineRaceId] ASC),
    CONSTRAINT [FK_BridgeK12StudentDisciplineRaces_FactK12StudentDisciplines] FOREIGN KEY ([FactK12StudentDisciplineId]) REFERENCES [RDS].[FactK12StudentDisciplines] ([FactK12StudentDisciplineId]),
    CONSTRAINT [FK_BridgeK12StudentDisciplineRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineRaces_FactK12StudentDisciplines]
    ON [RDS].[BridgeK12StudentDisciplineRaces]([FactK12StudentDisciplineId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineRaces_RaceId]
    ON [RDS].[BridgeK12StudentDisciplineRaces]([RaceId] ASC);


GO

