CREATE TABLE [RDS].[FactK12StudentDisciplines] (
    [FactK12StudentDisciplineId]        INT             IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                      INT             NOT NULL,
    [FactTypeId]                        INT             NOT NULL,
    [DataCollectionId]                  INT             CONSTRAINT [DF_FactK12StudentDisciplines_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                             INT             NOT NULL,
    [IeuId]                             INT             NOT NULL,
    [LeaId]                             INT             NOT NULL,
    [K12SchoolId]                       INT             NOT NULL,
    [K12StudentId]                      BIGINT          NOT NULL,
    [AgeId]                             INT             NOT NULL,
    [CteStatusId]                       INT             NOT NULL,
    [DisabilityStatusId]                INT             NOT NULL,
    [DisciplinaryActionStartDateId]     INT             NOT NULL,
    [DisciplinaryActionEndDateId]       INT             NOT NULL,
    [DisciplineStatusId]                INT             NOT NULL,
    [EconomicallyDisadvantagedStatusId] INT             NOT NULL,
    [EnglishLearnerStatusId]            INT             NOT NULL,
    [FirearmId]                         INT             NOT NULL,
    [FirearmDisciplineStatusId]         INT             NOT NULL,
    [FosterCareStatusId]                INT             NOT NULL,
    [GradeLevelId]                      INT             NOT NULL,
    [HomelessnessStatusId]              INT             NOT NULL,
    [IdeaStatusId]                      INT             NOT NULL,
    [ImmigrantStatusId]                 INT             NOT NULL,
    [IncidentIdentifier]                NVARCHAR (40)   NULL,
    [IncidentStatusId]                  INT             NOT NULL,
    [IncidentDateId]                    INT             NOT NULL,
    [K12DemographicId]                  INT             NOT NULL,
    [MigrantStatusId]                   INT             NOT NULL,
    [MilitaryStatusId]                  INT             CONSTRAINT [DF_FactK12StudentDisciplines_MilitaryId] DEFAULT ((-1)) NOT NULL,
    [NOrDStatusId]                      INT             NOT NULL,
    [RaceId]                            INT             CONSTRAINT [DF_FactK12StudentDisciplines_RaceId] DEFAULT ((-1)) NOT NULL,
    [PrimaryDisabilityTypeId]           INT             NOT NULL,
    [SecondaryDisabilityTypeId]         INT             NOT NULL,
    [TitleIStatusId]                    INT             NOT NULL,
    [TitleIIIStatusId]                  INT             NOT NULL,
    [DurationOfDisciplinaryAction]      DECIMAL (18, 2) NULL,
    [DisciplineCount]                   INT             NULL,
    CONSTRAINT [PK_FactK12StudentDisciplines] PRIMARY KEY CLUSTERED ([FactK12StudentDisciplineId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_FactK12StudentDisciplines_AgeId] FOREIGN KEY ([AgeId]) REFERENCES [RDS].[DimAges] ([DimAgeId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_CteStatusId] FOREIGN KEY ([CteStatusId]) REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_DisciplinaryActionEndDateId] FOREIGN KEY ([DisciplinaryActionEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_DisciplinaryActionStartDateId] FOREIGN KEY ([DisciplinaryActionStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_DisciplineStatusId] FOREIGN KEY ([DisciplineStatusId]) REFERENCES [RDS].[DimDisciplineStatuses] ([DimDisciplineStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_FactTypeId] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_FirearmId] FOREIGN KEY ([FirearmId]) REFERENCES [RDS].[DimFirearms] ([DimFirearmId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_FirearmsDisciplineStatusId] FOREIGN KEY ([FirearmDisciplineStatusId]) REFERENCES [RDS].[DimFirearmDisciplineStatuses] ([DimFirearmDisciplineStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_FosterCareStatusId] FOREIGN KEY ([FosterCareStatusId]) REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_IncidentDateId] FOREIGN KEY ([IncidentDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_IncidentStatusId] FOREIGN KEY ([IncidentStatusId]) REFERENCES [RDS].[DimIncidentStatuses] ([DimIncidentStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_LeaID] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentDisciplines_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_MilitaryStatusId] FOREIGN KEY ([MilitaryStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_NOrDStatusId] FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_PrimaryDisabilityTypeId] FOREIGN KEY ([PrimaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_SecondaryDisabilityTypeId] FOREIGN KEY ([SecondaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_TitleIIIStatusId] FOREIGN KEY ([TitleIIIStatusId]) REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId]),
    CONSTRAINT [FK_FactK12StudentDisciplines_TitleIStatusId] FOREIGN KEY ([TitleIStatusId]) REFERENCES [RDS].[DimTitleIStatuses] ([DimTitleIStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_FirearmDisciplineStatusId]
    ON [RDS].[FactK12StudentDisciplines]([FirearmDisciplineStatusId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_TitleIStatusId]
    ON [RDS].[FactK12StudentDisciplines]([TitleIStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_K12SchoolId]
    ON [RDS].[FactK12StudentDisciplines]([K12SchoolId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_IdeaStatusId]
    ON [RDS].[FactK12StudentDisciplines]([IdeaStatusId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_PrimaryDisabilityTypes]
    ON [RDS].[FactK12StudentDisciplines]([PrimaryDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DisciplinaryActionStartDateId]
    ON [RDS].[FactK12StudentDisciplines]([DisciplinaryActionStartDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DisabilityStatusId]
    ON [RDS].[FactK12StudentDisciplines]([DisabilityStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_MigrantStatusId]
    ON [RDS].[FactK12StudentDisciplines]([MigrantStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_IncidentStatusId]
    ON [RDS].[FactK12StudentDisciplines]([IncidentStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_EnglishLearnerStatusId]
    ON [RDS].[FactK12StudentDisciplines]([EnglishLearnerStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_GradeLevelId]
    ON [RDS].[FactK12StudentDisciplines]([GradeLevelId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_SecondaryDisabilityTypes]
    ON [RDS].[FactK12StudentDisciplines]([SecondaryDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DisciplineStatusId]
    ON [RDS].[FactK12StudentDisciplines]([DisciplineStatusId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_FirearmId]
    ON [RDS].[FactK12StudentDisciplines]([FirearmId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_SchoolYearId]
    ON [RDS].[FactK12StudentDisciplines]([SchoolYearId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_AgeId]
    ON [RDS].[FactK12StudentDisciplines]([AgeId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_ImmigrantStatusId]
    ON [RDS].[FactK12StudentDisciplines]([ImmigrantStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_K12StudentId]
    ON [RDS].[FactK12StudentDisciplines]([K12StudentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_NOrDStatusId]
    ON [RDS].[FactK12StudentDisciplines]([NOrDStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_HomelessnessStatusId]
    ON [RDS].[FactK12StudentDisciplines]([HomelessnessStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_K12DemographicId]
    ON [RDS].[FactK12StudentDisciplines]([K12DemographicId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DisciplinaryActionEndDateId]
    ON [RDS].[FactK12StudentDisciplines]([DisciplinaryActionEndDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_TitleIIIStatusId]
    ON [RDS].[FactK12StudentDisciplines]([TitleIIIStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_FactTypeId]
    ON [RDS].[FactK12StudentDisciplines]([FactTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_EconomicallyDisadvantagedStatusId]
    ON [RDS].[FactK12StudentDisciplines]([EconomicallyDisadvantagedStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_CteStatusId]
    ON [RDS].[FactK12StudentDisciplines]([CteStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_DataCollectionId]
    ON [RDS].[FactK12StudentDisciplines]([DataCollectionId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_FosterCareStatusId]
    ON [RDS].[FactK12StudentDisciplines]([FosterCareStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_SeaId]
    ON [RDS].[FactK12StudentDisciplines]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_IncidentDateId]
    ON [RDS].[FactK12StudentDisciplines]([IncidentDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_LeaId]
    ON [RDS].[FactK12StudentDisciplines]([LeaId] ASC) WITH (FILLFACTOR = 80);


GO


CREATE NONCLUSTERED INDEX [IX_RDS_FactK12StudentDisciplines_SchoolYearId_FactTypeId_DisciplineStatusId_IdeaStatusId]
    ON [RDS].[FactK12StudentDisciplines]([SchoolYearId] ASC, [FactTypeId] ASC, [DisciplineStatusId] ASC, [IdeaStatusId] ASC)
    INCLUDE([SeaId], [LeaId], [K12SchoolId], [K12StudentId], [AgeId]);
GO

CREATE NONCLUSTERED INDEX [IX_RDS_FactK12StudentDisciplines_SchoolYearId_FactTypeId_PrimaryDisabilityTypeId]
    ON [RDS].[FactK12StudentDisciplines]([SchoolYearId] ASC, [FactTypeId] ASC, [PrimaryDisabilityTypeId] ASC)
    INCLUDE([SeaId], [K12StudentId], [DisciplineStatusId], [IdeaStatusId], [DurationOfDisciplinaryAction], [DisciplineCount]);
GO

CREATE NONCLUSTERED INDEX [IX_RDS_FactK12StudentDisciplines_SchoolYearId_FactTypeId_WithIncludes]
    ON [RDS].[FactK12StudentDisciplines]([SchoolYearId] ASC, [FactTypeId] ASC)
    INCLUDE([K12StudentId], [DisciplineStatusId], [IdeaStatusId], [DurationOfDisciplinaryAction]);
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IncidentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific incident or occurrence. The same identifier should be used to document the entire incident even if it included multiple offenses and multiple offenders.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IncidentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IncidentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000501' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IncidentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21492' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IncidentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DurationOfDisciplinaryAction';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The length, in school days, of the disciplinary action.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DurationOfDisciplinaryAction';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Duration of Disciplinary Action' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DurationOfDisciplinaryAction';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000511' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DurationOfDisciplinaryAction';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21502' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DurationOfDisciplinaryAction';
GO