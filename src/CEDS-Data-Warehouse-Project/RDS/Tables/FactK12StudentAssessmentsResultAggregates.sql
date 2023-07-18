CREATE TABLE [RDS].[FactK12StudentAssessmentsResultAggregates] (
    [FactK12StudentAssessmentsResultAggregateId]    INT             IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                                  INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                         INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                                         INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaId]                                         INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_LeaId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                   INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [AcademicTermDesignatorId]                      INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_AcademicTermDesignatorId] DEFAULT ((-1)) NOT NULL,
    [AssessmentAdministrationId]                    INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_AssessmentAdministrationId] DEFAULT ((-1)) NOT NULL,
    [AssessmentId]                                  INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_AssessmentId] DEFAULT ((-1)) NOT NULL,
    [AssessmentSubtestId]                           INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_AssessmentSubtestId] DEFAULT ((-1)) NOT NULL,
    [CompetencyDefinitionId]                        INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_CompetencyDefinitionId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelWhenAssessedId]                      INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_GradeLevelWhenAssessedId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                                  INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                              INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [RaceId]                                        INT             CONSTRAINT [DF_FactK12StudentAssessmentsResultAggregates_RaceId] DEFAULT ((-1)) NOT NULL,
    [TotalPerformanceLevel1]                        INT             NULL,
    [TotalPerformanceLevel2]                        INT             NULL,
    [TotalPerformanceLevel3]                        INT             NULL,
    [TotalPerformanceLevel4]                        INT             NULL,
    [TotalPerformanceLevel5]                        INT             NULL,
    [TotalPerformanceLevel6]                        INT             NULL,
    [TotalMetStandard]                              INT             NULL,
    [TotalDidNotMeetStandard]                       INT             NULL,
    [PercentagePerformanceLevel1]                   DECIMAL (4, 1)  NULL,
    [PercentagePerformanceLevel2]                   DECIMAL (4, 1)  NULL,
    [PercentagePerformanceLevel3]                   DECIMAL (4, 1)  NULL,
    [PercentagePerformanceLevel4]                   DECIMAL (4, 1)  NULL,
    [PercentagePerformanceLevel5]                   DECIMAL (4, 1)  NULL,
    [PercentagePerformanceLevel6]                   DECIMAL (4, 1)  NULL,
    [PercentageMetStandard]                         DECIMAL (4, 1)  NULL,
    [PercentageDidNotMeetStandard]                  DECIMAL (4, 1)  NULL,
    [AverageScaleScorePerformanceLevel1]            DECIMAL (4, 1)  NULL,
    [AverageScaleScorePerformanceLevel2]            DECIMAL (4, 1)  NULL,
    [AverageScaleScorePerformanceLevel3]            DECIMAL (4, 1)  NULL,
    [AverageScaleScorePerformanceLevel4]            DECIMAL (4, 1)  NULL,
    [AverageScaleScorePerformanceLevel5]            DECIMAL (4, 1)  NULL,
    [AverageScaleScorePerformanceLevel6]            DECIMAL (4, 1)  NULL,
    [AverageScaleScoreMetStandard]                  DECIMAL (4, 1)  NULL,
    [AverageScaleScoreDidNotMeetStandard]           DECIMAL (4, 1)  NULL,
    [AverageScaleScore]                             DECIMAL (6, 2)  NULL,
    [StandarDeviationScaleScorePerformanceLevel1]   DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScorePerformanceLevel2]   DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScorePerformanceLevel3]   DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScorePerformanceLevel4]   DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScorePerformanceLevel5]   DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScorePerformanceLevel6]   DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScoreMetDeviation]        DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScoreDidNotMeetDeviation] DECIMAL (4, 1)  NULL,
    [StandarDeviationScaleScore]                    DECIMAL (5, 2)  NULL,
    [TotalAssessmentCount]                          INT             NULL,
    [TotalValidAssessmentCount]                     INT             NULL,
    [AssessmentSubtestMinimumValueScaleScore]       DECIMAL (20, 2) NULL,
    [AssessmentSubtestMaximumValueScaleScore]       DECIMAL (20, 2) NULL,
    [ScaleScore25thPercentile]                      DECIMAL (20, 2) NULL,
    [ScaleScore50thPercentile]                      DECIMAL (20, 2) NULL,
    [ScaleScore75thPercentile]                      DECIMAL (20, 2) NULL,
    CONSTRAINT [PK_FactK12StudentAssessmentsResultAggregates] PRIMARY KEY CLUSTERED ([FactK12StudentAssessmentsResultAggregateId] ASC),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_AcademicTermDesignatorId] FOREIGN KEY ([AcademicTermDesignatorId]) REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_AssessmentAdministrationId] FOREIGN KEY ([AssessmentAdministrationId]) REFERENCES [RDS].[DimAssessmentAdministrations] ([DimAssessmentAdministrationId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [RDS].[DimAssessments] ([DimAssessmentId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_AssessmentSubtestId] FOREIGN KEY ([AssessmentSubtestId]) REFERENCES [RDS].[DimAssessmentSubtests] ([DimAssessmentSubtestId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_CompetencyDefinitionId] FOREIGN KEY ([CompetencyDefinitionId]) REFERENCES [RDS].[DimCompetencyDefinitions] ([DimCompetencyDefinitionId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_GradeLevelWhenAssessedId] FOREIGN KEY ([GradeLevelWhenAssessedId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentAssessmentsResultAggregates_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_AcademicTermDesignatorId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([AcademicTermDesignatorId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_K12DemographicId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([K12DemographicId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_AssessmentAdministrationId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([AssessmentAdministrationId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_K12SchoolId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([K12SchoolId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_AssessmentId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([AssessmentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_LeaId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([LeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_AssessmentSubtestId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([AssessmentSubtestId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_RaceId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([RaceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_SchoolYearId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([SchoolYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_CompetencyDefinitionId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([CompetencyDefinitionId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_SeaId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_GradeLevelWhenAssessedId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([GradeLevelWhenAssessedId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_IdeaStatusId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([IdeaStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessmentsResultAggregates_IeuId]
    ON [RDS].[FactK12StudentAssessmentsResultAggregates]([IeuId] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The maximum value for the measurement.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Maximum Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000396' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The minimum value possible for the measurement.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Minimum Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000395' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21387' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessmentsResultAggregates', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValueScaleScore';
GO