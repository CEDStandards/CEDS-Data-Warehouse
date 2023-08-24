CREATE TABLE [RDS].[BridgeK12StudentEnrollmentRaces] (
    [BridgeK12StudentEnrollmentRaceId] BIGINT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentEnrollmentId]       BIGINT CONSTRAINT [DF_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollmentId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                           INT    CONSTRAINT [DF_BridgeK12StudentEnrollmentRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentEnrollmentRaces] PRIMARY KEY CLUSTERED ([BridgeK12StudentEnrollmentRaceId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollments] FOREIGN KEY ([FactK12StudentEnrollmentId]) REFERENCES [RDS].[FactK12StudentEnrollments] ([FactK12StudentEnrollmentId]),
    CONSTRAINT [FK_BridgeK12StudentEnrollmentRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentRaces_FactK12StudentEnrollments]
    ON [RDS].[BridgeK12StudentEnrollmentRaces]([FactK12StudentEnrollmentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentRaces_RaceId]
    ON [RDS].[BridgeK12StudentEnrollmentRaces]([RaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

