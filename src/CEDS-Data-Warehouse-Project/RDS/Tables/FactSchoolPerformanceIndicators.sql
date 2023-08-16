CREATE TABLE [RDS].[FactSchoolPerformanceIndicators] (
    [FactSchoolPerformanceIndicatorId]               INT IDENTITY (1, 1) NOT NULL,
    [FactTypeId]                                     INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_FactTypeId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                    INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                                    INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_CountDateId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                                         INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_RaceId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                                   INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                               INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]              INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [SubgroupId]                                     INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_SubgroupId] DEFAULT ((-1)) NOT NULL,
    [SchoolPerformanceIndicatorId]                   INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_SchoolPerformanceIndicatorId] DEFAULT ((-1)) NOT NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusId] INT CONSTRAINT [DF_FactSchoolPerformanceIndicators_SchoolPerformanceIndicatorStateDefinedStatusId] DEFAULT ((-1)) NOT NULL,
    [OrganizationCount]                              INT DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactSchoolPerformanceIndicators] PRIMARY KEY CLUSTERED ([FactSchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimFactTypes] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimIdeaStatuses] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimK12Demographics] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimK12Schools] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimEconomicallyDisadvantagedStatuses] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimSubgroups] FOREIGN KEY ([SubgroupId]) REFERENCES [RDS].[DimSubgroups] ([DimSubgroupId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimRaces] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimSchoolPerformanceIndicators] FOREIGN KEY ([SchoolPerformanceIndicatorId]) REFERENCES [RDS].[DimSchoolPerformanceIndicators] ([DimSchoolPerformanceIndicatorId]),
    CONSTRAINT [FK_FactSchoolPerformanceIndicators_DimSchoolPerformanceIndicatorStateDefinedStatuses] FOREIGN KEY ([SchoolPerformanceIndicatorStateDefinedStatusId]) REFERENCES [RDS].[DimSchoolPerformanceIndicatorStateDefinedStatuses] ([DimSchoolPerformanceIndicatorStateDefinedStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_FactTypeId] ON [RDS].[FactSchoolPerformanceIndicators]([FactTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_K12SchoolId] ON [RDS].[FactSchoolPerformanceIndicators]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_CountDateId] ON [RDS].[FactSchoolPerformanceIndicators]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_RaceId] ON [RDS].[FactSchoolPerformanceIndicators]([RaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_IdeaStatusId] ON [RDS].[FactSchoolPerformanceIndicators]([IdeaStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_K12DemographicId] ON [RDS].[FactSchoolPerformanceIndicators]([K12DemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_EconomicallyDisadvantagedStatusId] ON [RDS].[FactSchoolPerformanceIndicators]([EconomicallyDisadvantagedStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_SubgroupId] ON [RDS].[FactSchoolPerformanceIndicators]([SubgroupId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_SchoolPerformanceIndicatorId] ON [RDS].[FactSchoolPerformanceIndicators]([SchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactSchoolPerformanceIndicators_SchoolPerformanceIndicatorStateDefinedStatusId] ON [RDS].[FactSchoolPerformanceIndicators]([SchoolPerformanceIndicatorStateDefinedStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

