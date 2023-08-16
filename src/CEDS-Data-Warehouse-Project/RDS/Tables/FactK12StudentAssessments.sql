CREATE TABLE [RDS].[FactK12StudentAssessments] (
    [FactK12StudentAssessmentId]              INT           IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                            INT           CONSTRAINT [DF_FactK12StudentAssessments_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                             INT           CONSTRAINT [DF_FactK12StudentAssessments_CountDateId] DEFAULT ((-1)) NOT NULL,
    [FactTypeId]                              INT           CONSTRAINT [DF_FactK12StudentAssessments_FactTypeId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                   INT           CONSTRAINT [DF_FactK12StudentAssessments_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                                   INT           CONSTRAINT [DF_FactK12StudentAssessments_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaId]                                   INT           CONSTRAINT [DF_FactK12StudentAssessments_LeaId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                             INT           CONSTRAINT [DF_FactK12StudentAssessments_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                            BIGINT        CONSTRAINT [DF_FactK12StudentAssessments_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [AssessmentId]                            INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentId] DEFAULT ((-1)) NOT NULL,
    [AssessmentSubtestId]                     INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentSubtestId] DEFAULT ((-1)) NOT NULL,
    [AssessmentAdministrationId]              INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentAdministrationId] DEFAULT ((-1)) NOT NULL,
    [AssessmentRegistrationId]                INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentRegistrationId] DEFAULT ((-1)) NOT NULL,
    [AssessmentParticipationSessionId]        INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentParticipationSessionId] DEFAULT ((-1)) NOT NULL,
    [AssessmentPerformanceLevelId]            INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentPerformanceLevelId] DEFAULT ((-1)) NOT NULL,
    [CompetencyDefinitionId]                  INT           CONSTRAINT [DF_FactK12StudentAssessments_CompetencyDefinitionId] DEFAULT ((-1)) NOT NULL,
    [CteStatusId]                             INT           CONSTRAINT [DF_FactK12StudentAssessments_CteStatusId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelWhenAssessedId]                INT           CONSTRAINT [DF_FactK12StudentAssessments_GradeLevelWhenAssessedId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                            INT           CONSTRAINT [DF_FactK12StudentAssessments_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                        INT           CONSTRAINT [DF_FactK12StudentAssessments_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [NOrDStatusId]                            INT           CONSTRAINT [DF_FactK12StudentAssessments_NOrDStatusId] DEFAULT ((-1)) NOT NULL,
    [TitleIIIStatusId]                        INT           CONSTRAINT [DF_FactK12StudentAssessments_TitleIIIStatusId] DEFAULT ((-1)) NOT NULL,
    [AssessmentCount]                         INT           CONSTRAINT [DF_FactK12StudentAssessments_AssessmentCount] DEFAULT ((1)) NOT NULL,
    [AssessmentResultScoreValueRawScore]      NVARCHAR (35) NULL,
    [AssessmentResultScoreValueScaleScore]    NVARCHAR (35) NULL,
    [AssessmentResultScoreValuePercentile]    NVARCHAR (35) NULL,
    [AssessmentResultScoreValueTScore]        NVARCHAR (35) NULL,
    [AssessmentResultScoreValueZScore]        NVARCHAR (35) NULL,
    [AssessmentResultScoreValueACTScore]      NVARCHAR (35) NULL,
    [AssessmentResultScoreValueSATScore]      NVARCHAR (35) NULL,
    CONSTRAINT [PK_FactK12StudentAssessments] PRIMARY KEY CLUSTERED ([FactK12StudentAssessmentId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_FactK12StudentAssessments_AssessmentAdministrationId] FOREIGN KEY ([AssessmentAdministrationId]) REFERENCES [RDS].[DimAssessmentAdministrations] ([DimAssessmentAdministrationId]),
    CONSTRAINT [FK_FactK12StudentAssessments_AssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [RDS].[DimAssessments] ([DimAssessmentId]),
    CONSTRAINT [FK_FactK12StudentAssessments_AssessmentParticipationSessionId] FOREIGN KEY ([AssessmentParticipationSessionId]) REFERENCES [RDS].[DimAssessmentParticipationSessions] ([DimAssessmentParticipationSessionId]),
    CONSTRAINT [FK_FactK12StudentAssessments_AssessmentPerformanceLevelId] FOREIGN KEY ([AssessmentPerformanceLevelId]) REFERENCES [RDS].[DimAssessmentPerformanceLevels] ([DimAssessmentPerformanceLevelId]),
    CONSTRAINT [FK_FactK12StudentAssessments_AssessmentRegistrationId] FOREIGN KEY ([AssessmentRegistrationId]) REFERENCES [RDS].[DimAssessmentRegistrations] ([DimAssessmentRegistrationId]),
    CONSTRAINT [FK_FactK12StudentAssessments_AssessmentSubtestId] FOREIGN KEY ([AssessmentSubtestId]) REFERENCES [RDS].[DimAssessmentSubtests] ([DimAssessmentSubtestId]),
    CONSTRAINT [FK_FactK12StudentAssessments_CompetencyDefinitionId] FOREIGN KEY ([CompetencyDefinitionId]) REFERENCES [RDS].[DimCompetencyDefinitions] ([DimCompetencyDefinitionId]),
    CONSTRAINT [FK_FactK12StudentAssessments_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAssessments_CteStatusId] FOREIGN KEY ([CteStatusId]) REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId]),
    CONSTRAINT [FK_FactK12StudentAssessments_DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentAssessments_FactTypeId] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactK12StudentAssessments_GradeLevelId] FOREIGN KEY ([GradeLevelWhenAssessedId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentAssessments_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12StudentAssessments_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentAssessments_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentAssessments_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuID]),
    CONSTRAINT [FK_FactK12StudentAssessments_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentAssessments_NOrDStatuses] FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]),
    CONSTRAINT [FK_FactK12StudentAssessments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentAssessments_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentAssessments_TitleIIIStatusId] FOREIGN KEY ([TitleIIIStatusId]) REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_SchoolYearId] ON [RDS].[FactK12StudentAssessments]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_CountDateId] ON [RDS].[FactK12StudentAssessments]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_FactTypeId] ON [RDS].[FactK12StudentAssessments]([FactTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_SeaId] ON [RDS].[FactK12StudentAssessments]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_IeuId] ON [RDS].[FactK12StudentAssessments]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_LeaId] ON [RDS].[FactK12StudentAssessments]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_K12SchoolId] ON [RDS].[FactK12StudentAssessments]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_K12StudentId] ON [RDS].[FactK12StudentAssessments]([K12StudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_AssessmentId] ON [RDS].[FactK12StudentAssessments]([AssessmentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_AssessmentSubtestId] ON [RDS].[FactK12StudentAssessments]([AssessmentSubtestId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_AssessmentAdministrationId] ON [RDS].[FactK12StudentAssessments]([AssessmentAdministrationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_AssessmentRegistrationId] ON [RDS].[FactK12StudentAssessments]([AssessmentRegistrationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_AssessmentParticipationSessionId] ON [RDS].[FactK12StudentAssessments]([AssessmentParticipationSessionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_AssessmentPerformanceLevelId] ON [RDS].[FactK12StudentAssessments]([AssessmentPerformanceLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_CompetencyDefinitionId] ON [RDS].[FactK12StudentAssessments]([CompetencyDefinitionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_CteStatusId] ON [RDS].[FactK12StudentAssessments]([CteStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_GradeLevelWhenAssessedId] ON [RDS].[FactK12StudentAssessments]([GradeLevelWhenAssessedId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_IdeaStatusId] ON [RDS].[FactK12StudentAssessments]([IdeaStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_K12DemographicId] ON [RDS].[FactK12StudentAssessments]([K12DemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_NOrDStatusId] ON [RDS].[FactK12StudentAssessments]([NOrDStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_TitleIIIStatusId] ON [RDS].[FactK12StudentAssessments]([TitleIIIStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueACTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueACTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueACTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueACTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueACTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValuePercentile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValuePercentile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValuePercentile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValuePercentile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValuePercentile';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueRawScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueRawScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueRawScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueRawScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueRawScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueSATScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueSATScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueSATScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueSATScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueSATScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueScaleScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueTScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueZScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A meaningful raw score, derived score, or statistical expression of the performance of a person on an assessment. The type of result is indicated by the Assessment Score Metric Type element. The results can be expressed as a number, percentile, range, level, etc. The score relates to all scored items or a sub test scoring one aspect of performance on the test. This value may or may not correspond to one or more Performance Levels.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueZScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Result Score Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueZScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueZScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21245' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentResultScoreValueZScore';
GO