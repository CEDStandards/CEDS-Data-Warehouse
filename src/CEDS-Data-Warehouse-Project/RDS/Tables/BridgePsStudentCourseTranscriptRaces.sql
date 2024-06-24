CREATE TABLE [RDS].[BridgePsStudentCourseTranscriptRaces] (
    [BridgeFactPsStudentCourseTranscriptRaceId] INT IDENTITY (1, 1) NOT NULL,
    [FactPsStudentCourseTranscriptId]           BIGINT NOT NULL,
    [RaceId]                              INT NOT NULL,
    CONSTRAINT [PK_BridgePsStudentCourseTranscriptRaces] PRIMARY KEY CLUSTERED ([BridgeFactPsStudentCourseTranscriptRaceId] ASC),
    CONSTRAINT [FK_BridgePsStudentCourseTranscriptRaces_FactPsStudentCourseTranscriptId] FOREIGN KEY ([FactPsStudentCourseTranscriptId]) REFERENCES [RDS].[FactPsStudentCourseTranscripts] ([FactPsStudentCourseTranscriptId]),
    CONSTRAINT [FK_BridgePsStudentCourseTranscriptRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentCourseTranscriptRaces_FactPsStudentCourseTranscriptId]
    ON [RDS].[BridgePsStudentCourseTranscriptRaces]([FactPsStudentCourseTranscriptId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentCourseTranscriptRaces_RaceId]
    ON [RDS].[BridgePsStudentCourseTranscriptRaces]([RaceId] ASC);


GO

