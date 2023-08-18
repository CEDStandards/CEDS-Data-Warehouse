CREATE TABLE [RDS].[BridgeK12ProgramParticipationRaces] (
    [BridgeK12ProgramParticipationId] BIGINT IDENTITY (1, 1) NOT NULL,
    [FactK12ProgramParticipationId]   BIGINT CONSTRAINT [DF_BridgeK12ProgramParticipationRaces_FactK12ProgramParticipationId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                          INT    CONSTRAINT [DF_BridgeK12ProgramParticipationRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12ProgramParticipations] PRIMARY KEY CLUSTERED ([BridgeK12ProgramParticipationId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgeK12ProgramParticipationRaces_FactK12ProgramParticipations] FOREIGN KEY ([FactK12ProgramParticipationId]) REFERENCES [RDS].[FactK12ProgramParticipations] ([FactK12ProgramParticipationId]),
    CONSTRAINT [FK_BridgeK12ProgramParticipationRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12ProgramParticipationRaces_FactK12ProgramParticipations]
    ON [RDS].[BridgeK12ProgramParticipationRaces]([FactK12ProgramParticipationId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12ProgramParticipationRaces_RaceId]
    ON [RDS].[BridgeK12ProgramParticipationRaces]([RaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

