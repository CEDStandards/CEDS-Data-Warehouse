CREATE TABLE [RDS].[BridgeSpecialEducationRaces] (
    [BridgeSpecialEducationRaceId] INT IDENTITY (1, 1) NOT NULL,
    [FactSpecialEducationId]       INT CONSTRAINT [DF_BridgeSpecialEducationRaces_FactSpecialEducationId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                       INT CONSTRAINT [DF_BridgeSpecialEducationRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeSpecialEducationRaces] PRIMARY KEY CLUSTERED ([BridgeSpecialEducationRaceId] ASC),
    CONSTRAINT [FK_BridgeSpecialEducationRaces_FactSpecialEducationId] FOREIGN KEY ([FactSpecialEducationId]) REFERENCES [RDS].[FactSpecialEducation] ([FactSpecialEducationId]),
    CONSTRAINT [FK_BridgeSpecialEducationRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeSpecialEducationRaces_RaceId]
    ON [RDS].[BridgeSpecialEducationRaces]([RaceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeSpecialEducationRaces_FactSpecialEducation]
    ON [RDS].[BridgeSpecialEducationRaces]([FactSpecialEducationId] ASC);


GO

