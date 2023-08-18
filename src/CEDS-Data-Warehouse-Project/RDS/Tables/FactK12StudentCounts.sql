CREATE TABLE [RDS].[FactK12StudentCounts] (
    [FactK12StudentCountId]                 INT    IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                          INT    CONSTRAINT [DF_FactK12StudentCounts_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [FactTypeId]                            INT    CONSTRAINT [DF_FactK12StudentCounts_FactTypeId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                 INT    CONSTRAINT [DF_FactK12StudentCounts_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                                 INT    CONSTRAINT [DF_FactK12StudentCounts_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaId]                                 INT    CONSTRAINT [DF_FactK12StudentCounts_LeaId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                           INT    CONSTRAINT [DF_FactK12StudentCounts_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                          BIGINT CONSTRAINT [DF_FactK12StudentCounts_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [AgeId]                                 INT    CONSTRAINT [DF_FactK12StudentCounts_AgeId] DEFAULT ((-1)) NOT NULL,
    [AttendanceId]                          INT    CONSTRAINT [DF_FactK12StudentCounts_AttendanceId] DEFAULT ((-1)) NOT NULL,
    [CohortStatusId]                        INT    CONSTRAINT [DF_FactK12StudentCounts_CohortStatusId] DEFAULT ((-1)) NOT NULL,
    [CteStatusId]                           INT    CONSTRAINT [DF_FactK12StudentCounts_CteStatusId] DEFAULT ((-1)) NOT NULL,
    [DisabilityStatusId]                    INT    CONSTRAINT [DF_FactK12StudentCounts_DisabilityStatusId] DEFAULT ((-1)) NOT NULL,
    [EnglishLearnerStatusId]                INT    CONSTRAINT [DF_FactK12StudentCounts_EnglishLearnerStatusId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelId]                          INT    CONSTRAINT [DF_FactK12StudentCounts_GradeLevelId] DEFAULT ((-1)) NOT NULL,
    [HomelessnessStatusId]                  INT    CONSTRAINT [DF_FactK12StudentCounts_HomelessnessStatusId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]     INT    CONSTRAINT [DF_FactK12StudentCounts_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [FosterCareStatusId]                    INT    CONSTRAINT [DF_FactK12StudentCounts_FosterCareStatusId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                          INT    CONSTRAINT [DF_FactK12StudentCounts_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [ImmigrantStatusId]                     INT    CONSTRAINT [DF_FactK12StudentCounts_ImmigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                      INT    CONSTRAINT [DF_FactK12StudentCounts_K12Demographic] DEFAULT ((-1)) NOT NULL,
    [K12EnrollmentStatusId]                 INT    CONSTRAINT [DF_FactK12StudentCounts_EnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [K12AcademicAwardStatusId]              INT    CONSTRAINT [DF_FactK12StudentCounts_K12AcademicAwardStatusId] DEFAULT ((-1)) NOT NULL,
    [LanguageId]                            INT    CONSTRAINT [DF_FactK12StudentCounts_LanguageId] DEFAULT ((-1)) NOT NULL,
    [MigrantStatusId]                       INT    CONSTRAINT [DF_FactK12StudentCounts_MigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [NOrDStatusId]                          INT    CONSTRAINT [DF_FactK12StudentCounts_NOrDStatusId] DEFAULT ((-1)) NOT NULL,
    [PrimaryDisabilityTypeId]               INT    CONSTRAINT [DF_FactK12StudentCounts_PrimaryDisabilityType] DEFAULT ((-1)) NOT NULL,
    [RaceId]                                INT    CONSTRAINT [DF_FactK12StudentCounts_RaceId] DEFAULT ((-1)) NOT NULL,
    [SpecialEducationServicesExitDateId]    INT    CONSTRAINT [DF_FactK12StudentCounts_SpecialEducationServicesExitDateId] DEFAULT ((-1)) NOT NULL,
    [MigrantStudentQualifyingArrivalDateId] INT    CONSTRAINT [DF_FactK12StudentCounts_MigrantStudentQualifyingArrivalDateId] DEFAULT ((-1)) NOT NULL,
    [LastQualifyingMoveDateId]              INT    CONSTRAINT [DF_FactK12StudentCounts_LastQualifyingMoveDateId] DEFAULT ((-1)) NOT NULL,
    [TitleIStatusId]                        INT    CONSTRAINT [DF_FactK12StudentCounts_TitleIStatusId] DEFAULT ((-1)) NOT NULL,
    [TitleIIIStatusId]                      INT    CONSTRAINT [DF_FactK12StudentCounts_TitleIIIStatusId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateEnglishLearnerId]       INT    CONSTRAINT [DF_FactK12StudentCounts_StatusStartDateEnglishLearnerId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateEnglishLearnerId]         INT    CONSTRAINT [DF_FactK12StudentCounts_StatusEndDateEnglishLearnerId] DEFAULT ((-1)) NOT NULL,
    [StudentCount]                          INT    CONSTRAINT [DF_FactK12StudentCounts_StudentCount] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactStudentCounts] PRIMARY KEY CLUSTERED ([FactK12StudentCountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactK12StudentCounts_AgeId] FOREIGN KEY ([AgeId]) REFERENCES [RDS].[DimAges] ([DimAgeId]),
    CONSTRAINT [FK_FactK12StudentCounts_AttendanceId] FOREIGN KEY ([AttendanceId]) REFERENCES [RDS].[DimAttendances] ([DimAttendanceId]),
    CONSTRAINT [FK_FactK12StudentCounts_CohortStatusId] FOREIGN KEY ([CohortStatusId]) REFERENCES [RDS].[DimCohortStatuses] ([DimCohortStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_CteStatusId] FOREIGN KEY ([CteStatusId]) REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_EnglishLearnerId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_FactTypeId] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactK12StudentCounts_FosterCareStatusId] FOREIGN KEY ([FosterCareStatusId]) REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentCounts_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentCounts_K12EnrollmentStatusId] FOREIGN KEY ([K12EnrollmentStatusId]) REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_K12AcademicAwardStatusId] FOREIGN KEY ([K12AcademicAwardStatusId]) REFERENCES [RDS].[DimK12AcademicAwardStatuses] ([DimK12AcademicAwardStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentCounts_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentCounts_LanguageId] FOREIGN KEY ([LanguageId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]),
    CONSTRAINT [FK_FactK12StudentCounts_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuID]),
    CONSTRAINT [FK_FactK12StudentCounts_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCounts_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_MigrantStudentQualifyingArrivalDateId] FOREIGN KEY ([MigrantStudentQualifyingArrivalDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCounts_NOrDStatusId] FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_PrimaryDisabilityTypeId] FOREIGN KEY ([PrimaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactK12StudentCounts_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]),
    CONSTRAINT [FK_FactK12StudentCounts_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentCounts_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentCounts_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_SpecialEducationServicesExitDateId] FOREIGN KEY ([SpecialEducationServicesExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCounts_LastQualifyingMoveDateId] FOREIGN KEY ([LastQualifyingMoveDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCounts_StatusEndDateEnglishLearnerId] FOREIGN KEY ([StatusEndDateEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCounts_StatusStartDateEnglishLearnerId] FOREIGN KEY ([StatusStartDateEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCounts_TitleIIIStatusId] FOREIGN KEY ([TitleIIIStatusId]) REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId]),
    CONSTRAINT [FK_FactK12StudentCounts_TitleIStatusId] FOREIGN KEY ([TitleIStatusId]) REFERENCES [RDS].[DimTitleIStatuses] ([DimTitleIStatusId])
);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_K12DemographicId]
    ON [RDS].[FactK12StudentCounts]([K12DemographicId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_K12SchoolId]
    ON [RDS].[FactK12StudentCounts]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_K12EnrollmentStatusId]
    ON [RDS].[FactK12StudentCounts]([K12EnrollmentStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_K12AcademicAwardStatusId]
    ON [RDS].[FactK12StudentCounts]([K12AcademicAwardStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_TitleIStatusId]
    ON [RDS].[FactK12StudentCounts]([TitleIStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_IdeaStatusesId]
    ON [RDS].[FactK12StudentCounts]([IdeaStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_MigrantStudentQualifyingArrivalDateId]
    ON [RDS].[FactK12StudentCounts]([MigrantStudentQualifyingArrivalDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_ImmigrantStatusId]
    ON [RDS].[FactK12StudentCounts]([ImmigrantStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_GradeLevelId]
    ON [RDS].[FactK12StudentCounts]([GradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_SpecialEducationServicesExitDateId]
    ON [RDS].[FactK12StudentCounts]([SpecialEducationServicesExitDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_HomelessnessStatusId]
    ON [RDS].[FactK12StudentCounts]([HomelessnessStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_TitleIIIStatusId]
    ON [RDS].[FactK12StudentCounts]([TitleIIIStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_FactTypeId]
    ON [RDS].[FactK12StudentCounts]([FactTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_FosterCareStatusId]
    ON [RDS].[FactK12StudentCounts]([FosterCareStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_SeaId]
    ON [RDS].[FactK12StudentCounts]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_RaceId]
    ON [RDS].[FactK12StudentCounts]([RaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_StatusStartDateEnglishLearnerId]
    ON [RDS].[FactK12StudentCounts]([StatusStartDateEnglishLearnerId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_EnglishLearnerStatusId]
    ON [RDS].[FactK12StudentCounts]([EnglishLearnerStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_SchoolYearId]
    ON [RDS].[FactK12StudentCounts]([SchoolYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_StatusEndDateEnglishLearnerId]
    ON [RDS].[FactK12StudentCounts]([StatusEndDateEnglishLearnerId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_NOrDStatusId]
    ON [RDS].[FactK12StudentCounts]([NOrDStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_CteStatusId]
    ON [RDS].[FactK12StudentCounts]([CteStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_PrimaryDisabilityTypeId]
    ON [RDS].[FactK12StudentCounts]([PrimaryDisabilityTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_EconomicallyDisadvantagedStatusId]
    ON [RDS].[FactK12StudentCounts]([EconomicallyDisadvantagedStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_LeaId]
    ON [RDS].[FactK12StudentCounts]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_AgeId]
    ON [RDS].[FactK12StudentCounts]([AgeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_CohortStatusId]
    ON [RDS].[FactK12StudentCounts]([CohortStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_MigrantStatusId]
    ON [RDS].[FactK12StudentCounts]([MigrantStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_AttendanceId]
    ON [RDS].[FactK12StudentCounts]([AttendanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_K12Studentid]
    ON [RDS].[FactK12StudentCounts]([K12StudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_FactK12StudentCounts_SchoolYearId_FactTypeId]
    ON [RDS].[FactK12StudentCounts]([SchoolYearId] ASC, [FactTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_LanguageId]
    ON [RDS].[FactK12StudentCounts]([LanguageId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_IeuId]
    ON [RDS].[FactK12StudentCounts]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_DisabilityStatusId]
    ON [RDS].[FactK12StudentCounts]([DisabilityStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_LastQualifyingMoveDateId]
    ON [RDS].[FactK12StudentCounts]([LastQualifyingMoveDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_RDS_FactK12StudentCounts_SchoolYearId_FactTypeId_AgeId]
    ON [RDS].[FactK12StudentCounts]([SchoolYearId] ASC, [FactTypeId] ASC, [AgeId] ASC)
    INCLUDE([SeaId], [LeaId], [K12StudentId], [IdeaStatusId], [PrimaryDisabilityTypeId], [SpecialEducationServicesExitDateId], [StudentCount]);
GO

CREATE NONCLUSTERED INDEX [IX_RDS_FactK12StudentCounts_SchoolYearId_FactTypeId_SeaId_WithIncludes]
    ON [RDS].[FactK12StudentCounts]([SchoolYearId] ASC, [FactTypeId] ASC, [SeaId] ASC)
    INCLUDE([LeaId], [K12StudentId], [AgeId], [IdeaStatusId], [PrimaryDisabilityTypeId], [SpecialEducationServicesExitDateId], [StudentCount]);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day a child with disabilities (IDEA) ages 14 through 21 exited special education.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Services Exit Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000263' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21263' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId';
GO