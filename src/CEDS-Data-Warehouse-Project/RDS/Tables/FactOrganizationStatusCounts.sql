CREATE TABLE [RDS].[FactOrganizationStatusCounts] (
    [FactOrganizationStatusCountId]                  INT IDENTITY (1, 1) NOT NULL,
    [FactTypeId]                                     INT CONSTRAINT [DF_FactOrganizationStatusCounts_FactTypeId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                    INT CONSTRAINT [DF_FactOrganizationStatusCounts_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [SchoolYearId]                                   INT CONSTRAINT [DF_FactOrganizationStatusCounts_SchoolYearId] DEFAULT ((-1) )NOT NULL,
    [RaceId]                                         INT CONSTRAINT [DF_FactOrganizationStatusCounts_RaceId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                                   INT CONSTRAINT [DF_FactOrganizationStatusCounts_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                               INT CONSTRAINT [DF_FactOrganizationStatusCounts_DemographicId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]              INT CONSTRAINT [DF_FactOrganizationStatusCounts_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [SchoolPerformanceIndicatorId]                   INT CONSTRAINT [DF_FactOrganizationStatusCounts_SchoolPerformanceIndicatorId] DEFAULT ((-1)) NOT NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusId] INT CONSTRAINT [DF_FactOrganizationStatusCounts_SchoolPerformanceIndicatorStateDefinedStatusId] DEFAULT ((-1)) NOT NULL,
    [OrganizationStatusCount]                        INT NOT NULL,
    [SchoolQualityOrStudentSuccessIndicatorId]       INT CONSTRAINT [DF_FactOrganizationStatusCounts_SchoolQualityOrStudentSuccessIndicatorId] DEFAULT ((-1)) NOT NULL,
    [SchoolPerformanceIndicatorCategoryId]           INT CONSTRAINT [DF_FactOrganizationStatusCounts_SchoolPerformanceIndicatorCategoryId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_FactOrganizationStatusCount] PRIMARY KEY CLUSTERED ([FactOrganizationStatusCountId] ASC),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimFactTypes] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimIdeaStatuses] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimK12Demographics] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchoolYear] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimEconomicallyDisadvantagedStatuses] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimRaces] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchoolPerformanceIndicatorCategories] FOREIGN KEY ([SchoolPerformanceIndicatorCategoryId]) REFERENCES [RDS].[DimSchoolPerformanceIndicatorCategories] ([DimSchoolPerformanceIndicatorCategoryId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchoolPerformanceIndicators] FOREIGN KEY ([SchoolPerformanceIndicatorId]) REFERENCES [RDS].[DimSchoolPerformanceIndicators] ([DimSchoolPerformanceIndicatorId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchoolPerformanceIndicatorStateDefinedStatuses] FOREIGN KEY ([SchoolPerformanceIndicatorStateDefinedStatusId]) REFERENCES [RDS].[DimSchoolPerformanceIndicatorStateDefinedStatuses] ([DimSchoolPerformanceIndicatorStateDefinedStatusId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_DimSchoolQualityOrStudentSuccessIndicators] FOREIGN KEY ([SchoolQualityOrStudentSuccessIndicatorId]) REFERENCES [RDS].[DimSchoolQualityOrStudentSuccessIndicators] ([DimSchoolQualityOrStudentSuccessIndicatorId]),
    CONSTRAINT [FK_FactOrganizationStatusCounts_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_FactTypeId] ON [RDS].[FactOrganizationStatusCounts]([FactTypeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_K12SchoolId] ON [RDS].[FactOrganizationStatusCounts]([K12SchoolId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_SchoolYearId] ON [RDS].[FactOrganizationStatusCounts]([SchoolYearId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_RaceId] ON [RDS].[FactOrganizationStatusCounts]([RaceId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_IdeaStatusId] ON [RDS].[FactOrganizationStatusCounts]([IdeaStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_K12DemographicId] ON [RDS].[FactOrganizationStatusCounts]([K12DemographicId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_EconomicallyDisadvantagedStatusId] ON [RDS].[FactOrganizationStatusCounts]([EconomicallyDisadvantagedStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_SchoolPerformanceIndicatorId] ON [RDS].[FactOrganizationStatusCounts]([SchoolPerformanceIndicatorId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_SchoolPerformanceIndicatorStateDefinedStatusId] ON [RDS].[FactOrganizationStatusCounts]([SchoolPerformanceIndicatorStateDefinedStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_SchoolQualityOrStudentSuccessIndicatorId] ON [RDS].[FactOrganizationStatusCounts]([SchoolQualityOrStudentSuccessIndicatorId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationStatusCounts_SchoolPerformanceIndicatorCategoryId] ON [RDS].[FactOrganizationStatusCounts]([SchoolPerformanceIndicatorCategoryId] ASC);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationStatusCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationStatusCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationStatusCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationStatusCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactOrganizationStatusCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO