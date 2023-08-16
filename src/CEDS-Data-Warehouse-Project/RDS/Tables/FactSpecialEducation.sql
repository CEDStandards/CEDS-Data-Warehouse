CREATE TABLE [RDS].[FactSpecialEducation] (
    [FactSpecialEducationId]                             INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                                       INT            CONSTRAINT [DF_FactSpecialEducation_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                                        INT            CONSTRAINT [DF_FactSpecialEducation_CountDateId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                                   INT            CONSTRAINT [DF_FactSpecialEducation_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                              INT            CONSTRAINT [DF_FactSpecialEducation_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                                              INT            CONSTRAINT [DF_FactSpecialEducation_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]                                INT            CONSTRAINT [DF_FactSpecialEducation_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaAttendanceId]                                    INT            CONSTRAINT [DF_FactSpecialEducation_LeaAttendanceId] DEFAULT ((-1)) NOT NULL,
    [LeaFundingId]                                       INT            CONSTRAINT [DF_FactSpecialEducation_LeaFundingId] DEFAULT ((-1)) NOT NULL,
    [LeaGraduationId]                                    INT            CONSTRAINT [DF_FactSpecialEducation_LeaGraduationId] DEFAULT ((-1)) NOT NULL,
    [LeaIndividualizedEducationProgramId]                INT            CONSTRAINT [DF_FactSpecialEducation_LeaIndividualizedEducationProgramId] DEFAULT ((-1)) NOT NULL,
    [LeaIEPServiceProviderId]                            INT            CONSTRAINT [DF_FactSpecialEducation_LeaIEPServiceProviderId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                        INT            CONSTRAINT [DF_FactSpecialEducation_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [ResponsibleSchoolTypeId]                            INT            CONSTRAINT [DF_FactSpecialEducation_ResponsibleSchoolTypeId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                                       BIGINT         CONSTRAINT [DF_FactSpecialEducation_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]                              INT            CONSTRAINT [DF_FactSpecialEducation_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentExitDateId]                               INT            CONSTRAINT [DF_FactSpecialEducation_EnrollmentExitDateId] DEFAULT ((-1)) NOT NULL,
    [ConsentToEvaluationDateId]                          INT            CONSTRAINT [DF_FactSpecialEducation_ConsentToEvaluationDateId] DEFAULT ((-1)) NOT NULL,
    [ChildOutcomeSummaryBaselineId]                      INT            CONSTRAINT [DF_FactSpecialEducation_ChildOutcomeSummaryBaselineId] DEFAULT ((-1)) NOT NULL,
    [ChildOutcomeSummaryAtExitId]                        INT            CONSTRAINT [DF_FactSpecialEducation_ChildOutcomeSummaryAtExitId] DEFAULT ((-1)) NOT NULL,
    [ChildOutcomeSummaryDateBaselineId]                  INT            CONSTRAINT [DF_FactSpecialEducation_ChildOutcomeSummaryDateBaselineId] DEFAULT ((-1)) NOT NULL,
    [ChildOutcomeSummaryDateAtExitId]                    INT            CONSTRAINT [DF_FactSpecialEducation_ChildOutcomeSummaryDateAtExitId] DEFAULT ((-1)) NOT NULL,
    [DisabilityStatusId]                                 INT            CONSTRAINT [DF_FactSpecialEducation_DisabilityStatusId] DEFAULT ((-1)) NOT NULL,
    [CteStatusId]                                        INT            CONSTRAINT [DF_FactSpecialEducation_CteStatusId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]                  INT            CONSTRAINT [DF_FactSpecialEducation_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [EnglishLearnerStatusId]                             INT            CONSTRAINT [DF_FactSpecialEducation_EnglishLearnerStatusId] DEFAULT ((-1)) NOT NULL,
    [EntryGradeLevelId]                                  INT            CONSTRAINT [DF_FactSpecialEducation_EntryGradeLevelId] DEFAULT ((-1)) NOT NULL,
    [EligibilityEvaluationDateInitialId]                 INT            CONSTRAINT [DF_FactSpecialEducation_EligibilityEvaluationDateInitialId] DEFAULT ((-1)) NOT NULL,
    [EligibilityEvaluationDateReevaluationId]            INT            CONSTRAINT [DF_FactSpecialEducation_EligibilityEvaluationDateReevaluationId] DEFAULT ((-1)) NOT NULL,
    [FosterCareStatusId]                                 INT            CONSTRAINT [DF_FactSpecialEducation_FosterCareId] DEFAULT ((-1)) NOT NULL,
    [HomelessnessStatusId]                               INT            CONSTRAINT [DF_FactSpecialEducation_HomelessnessStatusId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                                       INT            CONSTRAINT [DF_FactSpecialEducation_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [ImmigrantStatusId]                                  INT            CONSTRAINT [DF_FactSpecialEducation_ImmigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [IndividualizedProgramStatusId]                      INT            CONSTRAINT [DF_FactSpecialEducation_IndividualizedProgramStatusId] DEFAULT ((-1)) NOT NULL,
    [IndividualizedProgramServicePlanDateId]             INT            CONSTRAINT [DF_FactSpecialEducation_IndividualizedProgramServicePlanDateId] DEFAULT ((-1)) NOT NULL,
    [IndividualizedProgramServicePlanReevaluationDateId] INT            CONSTRAINT [DF_FactSpecialEducation_IndividualizedProgramServicePlanReevaluationDateId] DEFAULT ((-1)) NOT NULL,
    [IndividualizedProgramServicePlanExitDateId]         INT            CONSTRAINT [DF_FactSpecialEducation_IndividualizedProgramServicePlanExitDateId] DEFAULT ((-1)) NOT NULL,
    [IndividualizedProgramDateId]                        INT            CONSTRAINT [DF_FactSpecialEducation_IndividualizedProgramDateId] DEFAULT ((-1)) NOT NULL,
    [K12EnrollmentStatusId]                              INT            CONSTRAINT [DF_FactSpecialEducation_K12EnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                                   INT            CONSTRAINT [DF_FactSpecialEducation_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [MigrantStatusId]                                    INT            CONSTRAINT [DF_FactSpecialEducation_MigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [MilitaryStatusId]                                   INT            CONSTRAINT [DF_FactSpecialEducation_MilitaryStatusId] DEFAULT ((-1)) NOT NULL,
    [NOrDStatusId]                                       INT            CONSTRAINT [DF_FactSpecialEducation_NOrDStatusId] DEFAULT ((-1)) NOT NULL,
    [ProgramParticipationStartDateId]                    INT            CONSTRAINT [DF_FactSpecialEducation_ProgramParticipationStartDateId] DEFAULT ((-1)) NOT NULL,
    [PrimaryDisabilityTypeId]                            INT            CONSTRAINT [DF_FactSpecialEducation_PrimaryDisabilityTypeId] DEFAULT ((-1)) NOT NULL,
    [SecondaryDisabilityTypeId]                          INT            CONSTRAINT [DF_FactSpecialEducation_SecondaryDisabilityTypeId] DEFAULT ((-1)) NOT NULL,
    [SpecialEducationServicesExitDateId]                 INT            CONSTRAINT [DF_FactSpecialEducation_SpecialEducationServicesExitDateId] DEFAULT ((-1)) NOT NULL,
    [TitleIIIStatusId]                                   INT            CONSTRAINT [DF_FactSpecialEducation_TitleIIIStatusId] DEFAULT ((-1)) NOT NULL,
    [FullTimeEquivalency]                                DECIMAL (5, 2) NULL,
    [SpecialEducationFTE]                                DECIMAL (5, 2) NULL,
    [StudentCount]                                       TINYINT        NULL,
    CONSTRAINT [PK_FactSpecialEducationId] PRIMARY KEY CLUSTERED ([FactSpecialEducationId] ASC),
    CONSTRAINT [FK_FactSpecialEducation_ChildOutcomeSummaryAtExitId] FOREIGN KEY ([ChildOutcomeSummaryAtExitId]) REFERENCES [RDS].[DimChildOutcomeSummaries] ([DimChildOutcomeSummaryId]),
    CONSTRAINT [FK_FactSpecialEducation_ChildOutcomeSummaryBaselineId] FOREIGN KEY ([ChildOutcomeSummaryBaselineId]) REFERENCES [RDS].[DimChildOutcomeSummaries] ([DimChildOutcomeSummaryId]),
    CONSTRAINT [FK_FactSpecialEducation_ChildOutcomeSummaryDateAtExitId] FOREIGN KEY ([ChildOutcomeSummaryDateAtExitId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_ChildOutcomeSummaryDateBaselineId] FOREIGN KEY ([ChildOutcomeSummaryDateBaselineId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_ConsentToEvaluationDateId] FOREIGN KEY ([ConsentToEvaluationDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_CteStatusId] FOREIGN KEY ([CteStatusId]) REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactSpecialEducation_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_EligibilityEvaluationDateInitialId] FOREIGN KEY ([EligibilityEvaluationDateInitialId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_EligibilityEvaluationDateReevaluationId] FOREIGN KEY ([EligibilityEvaluationDateReevaluationId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_EntryGradeLevelId] FOREIGN KEY ([EntryGradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactSpecialEducation_FosterCareStatusId] FOREIGN KEY ([FosterCareStatusId]) REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactSpecialEducation_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_IndividualizedProgramDateId] FOREIGN KEY ([IndividualizedProgramDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_IndividualizedProgramServicePlanDateId] FOREIGN KEY ([IndividualizedProgramServicePlanDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_IndividualizedProgramServicePlanExitDateId] FOREIGN KEY ([IndividualizedProgramServicePlanExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_IndividualizedProgramServicePlanReevaluationDateId] FOREIGN KEY ([IndividualizedProgramServicePlanReevaluationDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_IndividualizedProgramStatusId] FOREIGN KEY ([IndividualizedProgramStatusId]) REFERENCES [RDS].[DimIndividualizedProgramStatuses] ([DimIndividualizedProgramStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactSpecialEducation_K12EnrollmentStatusId] FOREIGN KEY ([K12EnrollmentStatusId]) REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactSpecialEducation_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactSpecialEducation_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactSpecialEducation_LeaAttendanceId] FOREIGN KEY ([LeaAttendanceId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactSpecialEducation_LeaFundingId] FOREIGN KEY ([LeaFundingId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactSpecialEducation_LeaGraduationId] FOREIGN KEY ([LeaGraduationId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactSpecialEducation_LeaIndividualizedEducationProgramId] FOREIGN KEY ([LeaIndividualizedEducationProgramId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactSpecialEducation_LeaIEPServiceProviderId] FOREIGN KEY ([LeaIEPServiceProviderId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactSpecialEducation_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_MilitaryStatusId] FOREIGN KEY ([MilitaryStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_NOrDStatusId] FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_PrimaryDisabilityTypeId] FOREIGN KEY ([PrimaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactSpecialEducation_ProgramParticipationStartDateId] FOREIGN KEY ([ProgramParticipationStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_ProgramStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactSpecialEducation_ResponsibleSchoolTypeId] FOREIGN KEY ([ResponsibleSchoolTypeId]) REFERENCES [RDS].[DimResponsibleSchoolTypes] ([DimResponsibleSchoolTypeId]),
    CONSTRAINT [FK_FactSpecialEducation_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactSpecialEducation_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactSpecialEducation_SecondaryDisabilityTypeId] FOREIGN KEY ([SecondaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactSpecialEducation_SpecialEducationServicesExitDateId] FOREIGN KEY ([SpecialEducationServicesExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactSpecialEducation_TitleIIIStatusId] FOREIGN KEY ([TitleIIIStatusId]) REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_DisabilityStatusId]
    ON [RDS].[FactSpecialEducation]([DisabilityStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_LeaFundingId]
    ON [RDS].[FactSpecialEducation]([LeaFundingId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ChildOutcomeSummaryDateAtExitId]
    ON [RDS].[FactSpecialEducation]([ChildOutcomeSummaryDateAtExitId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_EnrollmentExitDateId]
    ON [RDS].[FactSpecialEducation]([EnrollmentExitDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_LeaGraduationId]
    ON [RDS].[FactSpecialEducation]([LeaGraduationId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_EnrollmentEntryDateId]
    ON [RDS].[FactSpecialEducation]([EnrollmentEntryDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_CteStatusId]
    ON [RDS].[FactSpecialEducation]([CteStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ChildOutcomeSummaryDateBaselineId]
    ON [RDS].[FactSpecialEducation]([ChildOutcomeSummaryDateBaselineId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_K12EnrollmentStatusId]
    ON [RDS].[FactSpecialEducation]([K12EnrollmentStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IndividualizedProgramDateId]
    ON [RDS].[FactSpecialEducation]([IndividualizedProgramDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_EconomicallyDisadvantagedStatusId]
    ON [RDS].[FactSpecialEducation]([EconomicallyDisadvantagedStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_LeaAttendanceId]
    ON [RDS].[FactSpecialEducation]([LeaAttendanceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_EnglishLearnerStatusId]
    ON [RDS].[FactSpecialEducation]([EnglishLearnerStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ChildOutcomeSummaryAtExitId]
    ON [RDS].[FactSpecialEducation]([ChildOutcomeSummaryAtExitId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IndividualizedProgramStatusServicePlanExitDateId]
    ON [RDS].[FactSpecialEducation]([IndividualizedProgramServicePlanExitDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_CountDateId]
    ON [RDS].[FactSpecialEducation]([CountDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_GradeLevelId]
    ON [RDS].[FactSpecialEducation]([EntryGradeLevelId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_DimK12Schools_K12SchoolId]
    ON [RDS].[FactSpecialEducation]([K12SchoolId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_FosterCareStatusId]
    ON [RDS].[FactSpecialEducation]([FosterCareStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_MilitaryId]
    ON [RDS].[FactSpecialEducation]([MilitaryStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IndividualizedProgramStatusServicePlanReevaluationDateId]
    ON [RDS].[FactSpecialEducation]([IndividualizedProgramServicePlanReevaluationDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ChildOutcomeSummaryBaselineId]
    ON [RDS].[FactSpecialEducation]([ChildOutcomeSummaryBaselineId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_HomelessnessStatusId]
    ON [RDS].[FactSpecialEducation]([HomelessnessStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_NOrDStatusId]
    ON [RDS].[FactSpecialEducation]([NOrDStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_MigrantId]
    ON [RDS].[FactSpecialEducation]([MigrantStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ProgramParticipationStartDateId]
    ON [RDS].[FactSpecialEducation]([ProgramParticipationStartDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_PrimaryDisabilityTypeId]
    ON [RDS].[FactSpecialEducation]([PrimaryDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IndividualizedProgramStatusServicePlanDateId]
    ON [RDS].[FactSpecialEducation]([IndividualizedProgramServicePlanDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_DataCollectionId]
    ON [RDS].[FactSpecialEducation]([DataCollectionId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IdeaStatusId]
    ON [RDS].[FactSpecialEducation]([IdeaStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_SchoolYearId]
    ON [RDS].[FactSpecialEducation]([SchoolYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_SpecialEducationServicesExitDateId]
    ON [RDS].[FactSpecialEducation]([SpecialEducationServicesExitDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ResponsibleSchoolTypeId]
    ON [RDS].[FactSpecialEducation]([ResponsibleSchoolTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IeuId]
    ON [RDS].[FactSpecialEducation]([IeuId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ConsentToEvaluationDateId]
    ON [RDS].[FactSpecialEducation]([ConsentToEvaluationDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_SeaId]
    ON [RDS].[FactSpecialEducation]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_IndividualizedProgramStatusId]
    ON [RDS].[FactSpecialEducation]([IndividualizedProgramStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_LeaIndividualizedEducationProgramId]
    ON [RDS].[FactSpecialEducation]([LeaIndividualizedEducationProgramId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_LeaIEPServiceProviderId]
    ON [RDS].[FactSpecialEducation]([LeaIEPServiceProviderId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_LeaAccountabilityId]
    ON [RDS].[FactSpecialEducation]([LeaAccountabilityId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_ImmigrantStatusId]
    ON [RDS].[FactSpecialEducation]([ImmigrantStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_EligibilityEvaluationDateInitialId]
    ON [RDS].[FactSpecialEducation]([EligibilityEvaluationDateInitialId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_K12DemographicId]
    ON [RDS].[FactSpecialEducation]([K12DemographicId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_K12StudentId]
    ON [RDS].[FactSpecialEducation]([K12StudentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_TitleIIIStatusId]
    ON [RDS].[FactSpecialEducation]([TitleIIIStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_EligibilityEvaluationDateReevaluationId]
    ON [RDS].[FactSpecialEducation]([EligibilityEvaluationDateReevaluationId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_SecondaryDisabilityTypeId]
    ON [RDS].[FactSpecialEducation]([SecondaryDisabilityTypeId] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time a person is enrolled, employed, involved, or participates in the organization, divided by the time the organization defines as full-time for that role.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'SpecialEducationFTE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Calculated ratio of time the student is in a special education setting. Values range from 0.00 to 1.00. If the student is in a special education setting 25% of the time, the value is .25; if 100% of the time, the value is 1.00.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'SpecialEducationFTE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'SpecialEducationFTE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'SpecialEducationFTE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22208' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactSpecialEducation', @level2type=N'COLUMN',@level2name=N'SpecialEducationFTE';
GO