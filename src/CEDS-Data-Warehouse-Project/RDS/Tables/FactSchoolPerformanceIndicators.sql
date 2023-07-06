CREATE TABLE [RDS].[FactSchoolPerformanceIndicators] (
    [FactSchoolPerformanceIndicatorId]               INT IDENTITY (1, 1) NOT NULL,
    [FactTypeId]                                     INT NOT NULL,
    [K12SchoolId]                                    INT NOT NULL,
    [CountDateId]                                    INT NOT NULL,
    [RaceId]                                         INT NOT NULL,
    [IdeaStatusId]                                   INT NOT NULL,
    [K12DemographicId]                               INT NOT NULL,
    [EconomicallyDisadvantagedStatusId]              INT NOT NULL,
    [SubgroupId]                                     INT NOT NULL,
    [SchoolPerformanceIndicatorId]                   INT NOT NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusId] INT NOT NULL,
    [OrganizationCount]                              INT DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactSchoolPerformanceIndicators] PRIMARY KEY CLUSTERED ([FactSchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimFactTypes] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimIdeaStatuses] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimK12Demographics] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimRaces] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimSchoolPerformanceIndicators] FOREIGN KEY ([SchoolPerformanceIndicatorId]) REFERENCES [RDS].[DimSchoolPerformanceIndicators] ([DimSchoolPerformanceIndicatorId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimSchoolPerformanceIndicatorStateDefinedStatuses] FOREIGN KEY ([SchoolPerformanceIndicatorStateDefinedStatusId]) REFERENCES [RDS].[DimSchoolPerformanceIndicatorStateDefinedStatuses] ([DimSchoolPerformanceIndicatorStateDefinedStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimSchoolPerformanceIndicators]
    ON [RDS].[FactSchoolPerformanceIndicators]([SchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimIdeaStatuses]
    ON [RDS].[FactSchoolPerformanceIndicators]([IdeaStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimK12Demographics]
    ON [RDS].[FactSchoolPerformanceIndicators]([K12DemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimRace]
    ON [RDS].[FactSchoolPerformanceIndicators]([RaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimK12Schools]
    ON [RDS].[FactSchoolPerformanceIndicators]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimSchoolPerformanceIndicatorStateDefinedStatuses]
    ON [RDS].[FactSchoolPerformanceIndicators]([SchoolPerformanceIndicatorStateDefinedStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_DimDates]
    ON [RDS].[FactSchoolPerformanceIndicators]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

