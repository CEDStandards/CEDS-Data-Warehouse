CREATE TABLE [RDS].[BridgePsStudentEnrollmentRaces] (
    [BridgePsStudentEnrollmentRaceId] BIGINT IDENTITY (1, 1) NOT NULL,
    [FactPsStudentEnrollmentId]       BIGINT CONSTRAINT [DF_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollmentId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                          INT    CONSTRAINT [DF_BridgePsStudentEnrollmentRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgePsStudentEnrollmentRaces] PRIMARY KEY CLUSTERED ([BridgePsStudentEnrollmentRaceId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollments] FOREIGN KEY ([FactPsStudentEnrollmentId]) REFERENCES [RDS].[FactPsStudentEnrollments] ([FactPsStudentEnrollmentId]),
    CONSTRAINT [FK_BridgePsStudentEnrollmentRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentEnrollmentRaces_FactPsStudentEnrollments]
    ON [RDS].[BridgePsStudentEnrollmentRaces]([FactPsStudentEnrollmentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentEnrollmentRaces_RaceId]
    ON [RDS].[BridgePsStudentEnrollmentRaces]([RaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

