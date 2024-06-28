CREATE TABLE [RDS].[BridgeK12StaffCompensationRaces] (
    [BridgeK12StaffCompensationRace] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StaffCompensationId]           INT NOT NULL,
    [RaceId]                              INT NOT NULL,
    CONSTRAINT [PK_BridgeK12StaffCompensationRaces] PRIMARY KEY CLUSTERED ([BridgeK12StaffCompensationRace] ASC),
    CONSTRAINT [FK_BridgeK12StaffCompensationRaces_FactK12StaffCompensationId] FOREIGN KEY ([FactK12StaffCompensationId]) REFERENCES [RDS].[FactK12StaffCompensations] ([FactK12StaffCompensationId]),
    CONSTRAINT [FK_BridgeK12StaffCompensationRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCompensationRaces_FactK12StaffCompensationId]
    ON [RDS].[BridgeK12StaffCompensationRaces]([FactK12StaffCompensationId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCompensationRaces_RaceId]
    ON [RDS].[BridgeK12StaffCompensationRaces]([RaceId] ASC);


GO

