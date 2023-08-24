CREATE TABLE [RDS].[BridgeK12StudentCourseSectionRaces] (
    [BridgeK12StudentCourseSectionRaceId] BIGINT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentCourseSectionId]       BIGINT CONSTRAINT [DF_BridgeK12StudentCourseSectionRaces_FactK12StudentCourseSectionId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                              INT    CONSTRAINT [DF_BridgeK12StudentCourseSectionRaces_RaceId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentCourseSectionRace] PRIMARY KEY CLUSTERED ([BridgeK12StudentCourseSectionRaceId] ASC),
    CONSTRAINT [FK_BridgeK12StudentCourseSectionRace_FactK12StudentCourseSections] FOREIGN KEY ([FactK12StudentCourseSectionId]) REFERENCES [RDS].[FactK12StudentCourseSections] ([FactK12StudentCourseSectionId]),
    CONSTRAINT [FK_BridgeK12StudentCourseSectionRace_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionRaces_RaceId]
    ON [RDS].[BridgeK12StudentCourseSectionRaces]([RaceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionRaces_FactK12StudentCourseSectionId]
    ON [RDS].[BridgeK12StudentCourseSectionRaces]([FactK12StudentCourseSectionId] ASC);


GO

