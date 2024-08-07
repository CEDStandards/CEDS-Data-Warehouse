CREATE TABLE [RDS].[BridgeK12StaffEmploymentRaces] (
    [BridgeK12StaffEmploymentRace] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StaffEmploymentId]           INT NOT NULL,
    [RaceId]                              INT NOT NULL,
    CONSTRAINT [PK_BridgeK12StaffEmploymentRaces] PRIMARY KEY CLUSTERED ([BridgeK12StaffEmploymentRace] ASC),
    CONSTRAINT [FK_BridgeK12StaffEmploymentRaces_FactK12StaffEmploymentId] FOREIGN KEY ([FactK12StaffEmploymentId]) REFERENCES [RDS].[FactK12StaffEmployments] ([FactK12StaffEmploymentId]),
    CONSTRAINT [FK_BridgeK12StaffEmploymentRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffEmploymentRaces_FactK12StaffEmploymentId]
    ON [RDS].[BridgeK12StaffEmploymentRaces]([FactK12StaffEmploymentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffEmploymentRaces_RaceId]
    ON [RDS].[BridgeK12StaffEmploymentRaces]([RaceId] ASC);


GO

