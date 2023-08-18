CREATE TABLE [RDS].[BridgeAeStudentEnrollmentRaces] (
    [BridgeFactAeStudentEnrollmentRaceId] INT IDENTITY (1, 1) NOT NULL,
    [FactAeStudentEnrollmentId]           INT NOT NULL,
    [RaceId]                              INT NOT NULL,
    CONSTRAINT [PK_BridgeAeStudentEnrollmentRaces] PRIMARY KEY CLUSTERED ([BridgeFactAeStudentEnrollmentRaceId] ASC),
    CONSTRAINT [FK_BridgeAeStudentEnrollmentRaces_FactAeStudentEnrollmentId] FOREIGN KEY ([FactAeStudentEnrollmentId]) REFERENCES [RDS].[FactAeStudentEnrollments] ([FactAeStudentEnrollmentId]),
    CONSTRAINT [FK_BridgeAeStudentEnrollmentRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeAeStudentEnrollmentRaces_FactAeStudentEnrollmentId]
    ON [RDS].[BridgeAeStudentEnrollmentRaces]([FactAeStudentEnrollmentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeAeStudentEnrollmentRaces_RaceId]
    ON [RDS].[BridgeAeStudentEnrollmentRaces]([RaceId] ASC);


GO

