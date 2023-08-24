CREATE TABLE [RDS].[BridgeK12StudentAssessmentRaces] (
    [BridgeK12StudentAssessmentRaceId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentAssessmentId]       INT NOT NULL,
    [RaceId]                           INT NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentAssessmentRaces] PRIMARY KEY CLUSTERED ([BridgeK12StudentAssessmentRaceId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_BridgeK12StudentAssessmentRaces_FactK12StudentAssessments] FOREIGN KEY ([FactK12StudentAssessmentId]) REFERENCES [RDS].[FactK12StudentAssessments] ([FactK12StudentAssessmentId]),
    CONSTRAINT [FK_BridgeK12StudentAssessmentRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentRaces_RaceId]
    ON [RDS].[BridgeK12StudentAssessmentRaces]([RaceId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentAssessmentRaces_FactK12StudentAssessments]
    ON [RDS].[BridgeK12StudentAssessmentRaces]([FactK12StudentAssessmentId] ASC) WITH (FILLFACTOR = 80);


GO

