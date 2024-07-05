CREATE TABLE [RDS].[FactK12StudentEnrollments] (
    [FactK12StudentEnrollmentId]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                               INT            CONSTRAINT [DF_FactK12StudentEnrollments_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                                INT            CONSTRAINT [DF_FactK12StudentEnrollments_CountDateId] DEFAULT ((-1)) NOT NULL,
    [RecordStartDateTime]                        DATETIME       NULL,      
    [RecordEndDateTime]                          DATETIME       NULL,
    [DataCollectionId]                           INT            CONSTRAINT [DF_FactK12StudentEnrollments_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                      INT            CONSTRAINT [DF_FactK12StudentEnrollments_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                                      INT            CONSTRAINT [DF_FactK12StudentEnrollments_IeuId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                               BIGINT         CONSTRAINT [DF_FactK12StudentEnrollments_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]                        INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaAttendanceId]                            INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaAttendanceId] DEFAULT ((-1)) NOT NULL,
    [LeaFundingId]                               INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaFundingId] DEFAULT ((-1)) NOT NULL,
    [LeaGraduationID]                            INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaGraduationID] DEFAULT ((-1)) NOT NULL,
    [LeaIndividualizedEducationProgramId]        INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaIndividualizedEducationProgramId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                INT            CONSTRAINT [DF_FactK12StudentEnrollments_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [EducationOrganizationNetworkId]             INT            CONSTRAINT [DF_FactK12StudentEnrollments_EducationOrganizationNetworkId] DEFAULT ((-1)) NOT NULL,
    [CohortGraduationYearId]                     INT            CONSTRAINT [DF_FactK12StudentEnrollments_CohortGraduationYearId] DEFAULT ((-1)) NOT NULL,
    [CohortYearId]                               INT            CONSTRAINT [DF_FactK12StudentEnrollments_CohortYearId] DEFAULT ((-1)) NOT NULL,
    [CteStatusId]                                INT            CONSTRAINT [DF_FactK12StudentEnrollments_CteStatusId] DEFAULT ((-1)) NOT NULL,
    [EntryGradeLevelId]                          INT            CONSTRAINT [DF_FactK12StudentEnrollments_EntryGradeLevelId] DEFAULT ((-1)) NOT NULL,
    [ExitGradeLevelId]                           INT            CONSTRAINT [DF_FactK12StudentEnrollments_ExitGradeLevelId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]                      INT            CONSTRAINT [DF_FactK12StudentEnrollments_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentExitDateId]                       INT            CONSTRAINT [DF_FactK12StudentEnrollments_EnrollmentExitDateId] DEFAULT ((-1)) NOT NULL,
    [EnglishLearnerStatusId]                     INT            CONSTRAINT [DF_FactK12StudentEnrollments_EnglishLearnerStatusId] DEFAULT ((-1)) NOT NULL,
    [K12EnrollmentStatusId]                      INT            CONSTRAINT [DF_FactK12StudentEnrollments_K12EnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [K12RetentionStatusId]                       INT            CONSTRAINT [DF_FactK12StudentEnrollments_K12RetentionStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DropoutStatusId]                         INT            CONSTRAINT [DF_FactK12StudentEnrollments_K12DropoutStatusId] DEFAULT ((-1)) NOT NULL,
    [CteOutcomeIndicatorId]                      INT            CONSTRAINT [DF_FactK12StudentEnrollments_CteOutcomeIndicatorId] DEFAULT ((-1)) NOT NULL,
    [PsEnrollmentStatusId]                       INT            CONSTRAINT [DF_FactK12StudentEnrollments_PsEnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                           INT            CONSTRAINT [DF_FactK12StudentEnrollments_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                               INT            CONSTRAINT [DF_FactK12StudentEnrollments_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [DisabilityStatusId]                         INT            CONSTRAINT [DF_FactK12StudentEnrollments_DisabilityStatusId] DEFAULT ((-1)) NOT NULL,
    [HomelessnessStatusId]                       INT            CONSTRAINT [DF_FactK12StudentEnrollments_HomelessnessStatusId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]          INT            CONSTRAINT [DF_FactK12StudentEnrollments_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [FosterCareStatusId]                         INT            CONSTRAINT [DF_FactK12StudentEnrollments_FosterCareStatusId] DEFAULT ((-1)) NOT NULL,
    [ImmigrantStatusId]                          INT            CONSTRAINT [DF_FactK12StudentEnrollments_ImmigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [LanguageHomeId]                             INT            CONSTRAINT [DF_FactK12StudentEnrollments_LanguageHomeId] DEFAULT ((-1)) NOT NULL,
    [LanguageNativeId]                           INT            CONSTRAINT [DF_FactK12StudentEnrollments_LanguageNativeId] DEFAULT ((-1)) NOT NULL,
    [MigrantStatusId]                            INT            CONSTRAINT [DF_FactK12StudentEnrollments_MigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [MilitaryStatusId]                           INT            CONSTRAINT [DF_FactK12StudentEnrollments_MilitaryStatusId] DEFAULT ((-1)) NOT NULL,
    [NOrDStatusId]                               INT            CONSTRAINT [DF_FactK12StudentEnrollments_NOrDStatusId] DEFAULT ((-1)) NOT NULL,
    [PrimaryDisabilityTypeId]                    INT            CONSTRAINT [DF_FactK12StudentEnrollments_PrimaryDisabilityTypeId] DEFAULT ((-1)) NOT NULL,
    [SecondaryDisabilityTypeId]                  INT            CONSTRAINT [DF_FactK12StudentEnrollments_SecondaryDisabilityTypeId] DEFAULT ((-1)) NOT NULL,
    [ProjectedGraduationDateId]                  INT            CONSTRAINT [DF_FactK12StudentEnrollments_ProjectedGraduationDateId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateEconomicallyDisadvantagedId] INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateEconomicallyDisadvantagedId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateEconomicallyDisadvantagedId]   INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateEconomicallyDisadvantagedId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateEnglishLearnerId]            INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateEnglishLearnerId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateEnglishLearnerId]              INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateEnglishLearnerId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateHomelessnessId]              INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateHomelessnessId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateHomelessnessId]                INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateHomelessnessId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateIdeaId]                      INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateIdeaId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateIdeaId]                        INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateIdeaId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateMigrantId]                   INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateMigrantId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateMigrantId]                     INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateMigrantId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateMilitaryConnectedStudentId]  INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateMilitaryConnectedStudentId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateMilitaryConnectedStudentId]    INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateMilitaryConnectedStudentId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDatePerkinsEnglishLearnerId]     INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDatePerkinsEnglishLearnerId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDatePerkinsEnglishLearnerId]       INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDatePerkinsEnglishLearnerId] DEFAULT ((-1)) NOT NULL,
    [StatusEndDateTitleIIIImmigrantId]           INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusEndDateTitleIIIImmigrantId] DEFAULT ((-1)) NOT NULL,
    [StatusStartDateTitleIIIImmigrantId]         INT            CONSTRAINT [DF_FactK12StudentEnrollments_StatusStartDateTitleIIIImmigrantId] DEFAULT ((-1)) NOT NULL,
    [TitleIIIStatusId]                           INT            CONSTRAINT [DF_FactK12StudentEnrollments_TitleIIIStatusId] DEFAULT ((-1)) NOT NULL,
    [FullTimeEquivalency]                        DECIMAL (5, 2) NULL,
    [StudentCount]                               INT            NOT NULL,
    [ResponsibleSchoolTypeId]                    INT            CONSTRAINT [DF_FactK12StudentEnrollments_ResponsibleSchoolTypeId] DEFAULT ((-1)) NOT NULL,
    [LeaMembershipResidentId]                    INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaMembershipResidentId] DEFAULT ((-1)) NOT NULL,
    [RecordStatusId]                             INT            CONSTRAINT [DF_FactK12StudentEnrollments_RecordStatusId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_FactK12StudentEnrollments] PRIMARY KEY NONCLUSTERED ([FactK12StudentEnrollmentId] ASC),
    CONSTRAINT [FK_FactK12StudentEnrollments_CohortGraduationYearId] FOREIGN KEY ([CohortGraduationYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_CohortYearId] FOREIGN KEY ([CohortYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_CteStatusId] FOREIGN KEY ([CteStatusId]) REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_EducationOrganizationNetworkId] FOREIGN KEY ([EducationOrganizationNetworkId]) REFERENCES [RDS].[DimEducationOrganizationNetworks] ([DimEducationOrganizationNetworkId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_EntryGradeLevelId] FOREIGN KEY ([EntryGradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_ExitGradeLevelId] FOREIGN KEY ([ExitGradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_FosterCareStatusId] FOREIGN KEY ([FosterCareStatusId]) REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_GraduationLeaID] FOREIGN KEY ([LeaGraduationID]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentEnrollments_HomelessnessStatusEndDateId] FOREIGN KEY ([StatusEndDateHomelessnessId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_HomelessnessStatusStartDateId] FOREIGN KEY ([StatusStartDateHomelessnessId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12EnrollmentStatusId] FOREIGN KEY ([K12EnrollmentStatusId]) REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12DropoutStatusId] FOREIGN KEY ([K12DropoutStatusId]) REFERENCES [RDS].[DimK12DropoutStatuses] ([DimK12DropoutStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12RetentionStatusId] FOREIGN KEY ([K12RetentionStatusId]) REFERENCES [RDS].[DimK12RetentionStatuses] ([DimK12RetentionStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_PsEnrollmentStatusId] FOREIGN KEY ([PsEnrollmentStatusId]) REFERENCES [RDS].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_CteOutcomeIndicatorId] FOREIGN KEY ([CteOutcomeIndicatorId]) REFERENCES [RDS].[DimCteOutcomeIndicators] ([DimCteOutcomeIndicatorId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LanguageHomeId] FOREIGN KEY ([LanguageHomeId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LanguageNativeId] FOREIGN KEY ([LanguageNativeId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LeaAttendanceId] FOREIGN KEY ([LeaAttendanceId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LeaFundingId] FOREIGN KEY ([LeaFundingId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LeaIndividualizedEducationProgramId] FOREIGN KEY ([LeaIndividualizedEducationProgramId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentEnrollments_LeaMembershipResidentId] FOREIGN KEY ([LeaMembershipResidentId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentEnrollments_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_MilitaryStatusId] FOREIGN KEY ([MilitaryStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_NOrDStatusId] FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_PrimaryDisabilityTypeId] FOREIGN KEY ([PrimaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_ProjectedGraduationDateId] FOREIGN KEY ([ProjectedGraduationDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_ResponsibleSchoolTypeId] FOREIGN KEY ([ResponsibleSchoolTypeId]) REFERENCES [RDS].[DimResponsibleSchoolTypes] ([DimResponsibleSchoolTypeId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_SecondaryDisabilityTypeId] FOREIGN KEY ([SecondaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDateEconomicallyDisadvantagedId] FOREIGN KEY ([StatusEndDateEconomicallyDisadvantagedId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDateEnglishLearnerId] FOREIGN KEY ([StatusEndDateEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDateIdeaId] FOREIGN KEY ([StatusEndDateIdeaId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDateMigrantId] FOREIGN KEY ([StatusEndDateMigrantId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDateMilitaryConnectedStudentId ] FOREIGN KEY ([StatusEndDateMilitaryConnectedStudentId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDatePerkinsEnglishLearnerId] FOREIGN KEY ([StatusEndDatePerkinsEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusEndDateTitleIIIImmigrantId] FOREIGN KEY ([StatusEndDateTitleIIIImmigrantId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDateEconomicallyDisadvantagedId] FOREIGN KEY ([StatusStartDateEconomicallyDisadvantagedId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDateEnglishLearnerId] FOREIGN KEY ([StatusStartDateEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDateIdeaId] FOREIGN KEY ([StatusStartDateIdeaId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDateMigrantId] FOREIGN KEY ([StatusStartDateMigrantId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDateMilitaryConnectedStudentId] FOREIGN KEY ([StatusStartDateMilitaryConnectedStudentId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDatePerkinsEnglishLearnerId] FOREIGN KEY ([StatusStartDatePerkinsEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_StatusStartDateTitleIIIImmigrantId] FOREIGN KEY ([StatusStartDateTitleIIIImmigrantId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_TitleIIIStatusId] FOREIGN KEY ([TitleIIIStatusId]) REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]),
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_SchoolYearId] ON [RDS].[FactK12StudentEnrollments]([SchoolYearId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CountDateId] ON [RDS].[FactK12StudentEnrollments]([CountDateId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DataCollectionId] ON [RDS].[FactK12StudentEnrollments]([DataCollectionId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_SeaId] ON [RDS].[FactK12StudentEnrollments]([SeaId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_IeuId] ON [RDS].[FactK12StudentEnrollments]([IeuId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12StudentId] ON [RDS].[FactK12StudentEnrollments]([K12StudentId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaAccountabilityId] ON [RDS].[FactK12StudentEnrollments]([LeaAccountabilityId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaAttendanceId] ON [RDS].[FactK12StudentEnrollments]([LeaAttendanceId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaFundingId] ON [RDS].[FactK12StudentEnrollments]([LeaFundingId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaGraduationID] ON [RDS].[FactK12StudentEnrollments]([LeaGraduationID] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaIndividualizedEducationProgramId] ON [RDS].[FactK12StudentEnrollments]([LeaIndividualizedEducationProgramId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12SchoolId] ON [RDS].[FactK12StudentEnrollments]([K12SchoolId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EducationOrganizationNetworkId] ON [RDS].[FactK12StudentEnrollments]([EducationOrganizationNetworkId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CohortGraduationYearId] ON [RDS].[FactK12StudentEnrollments]([CohortGraduationYearId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CohortYearId] ON [RDS].[FactK12StudentEnrollments]([CohortYearId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CteStatusId] ON [RDS].[FactK12StudentEnrollments]([CteStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EntryGradeLevelId] ON [RDS].[FactK12StudentEnrollments]([EntryGradeLevelId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ExitGradeLevelId] ON [RDS].[FactK12StudentEnrollments]([ExitGradeLevelId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EnrollmentEntryDateId] ON [RDS].[FactK12StudentEnrollments]([EnrollmentEntryDateId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EnrollmentExitDateId] ON [RDS].[FactK12StudentEnrollments]([EnrollmentExitDateId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EnglishLearnerStatusId] ON [RDS].[FactK12StudentEnrollments]([EnglishLearnerStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12EnrollmentStatusId] ON [RDS].[FactK12StudentEnrollments]([K12EnrollmentStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12DemographicId] ON [RDS].[FactK12StudentEnrollments]([K12DemographicId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_IdeaStatusId] ON [RDS].[FactK12StudentEnrollments]([IdeaStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_HomelessnessStatusId] ON [RDS].[FactK12StudentEnrollments]([HomelessnessStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EconomicallyDisadvantagedStatusId] ON [RDS].[FactK12StudentEnrollments]([EconomicallyDisadvantagedStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_FosterCareStatusId] ON [RDS].[FactK12StudentEnrollments]([FosterCareStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ImmigrantStatusId] ON [RDS].[FactK12StudentEnrollments]([ImmigrantStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LanguageHomeId] ON [RDS].[FactK12StudentEnrollments]([LanguageHomeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LanguageNativeId] ON [RDS].[FactK12StudentEnrollments]([LanguageNativeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_MigrantStatusId] ON [RDS].[FactK12StudentEnrollments]([MigrantStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_MilitaryStatusId] ON [RDS].[FactK12StudentEnrollments]([MilitaryStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_NOrDStatusId] ON [RDS].[FactK12StudentEnrollments]([NOrDStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_PrimaryDisabilityTypeId] ON [RDS].[FactK12StudentEnrollments]([PrimaryDisabilityTypeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_SecondaryDisabilityTypeId] ON [RDS].[FactK12StudentEnrollments]([SecondaryDisabilityTypeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ProjectedGraduationDateId] ON [RDS].[FactK12StudentEnrollments]([ProjectedGraduationDateId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateEconomicallyDisadvantagedId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateEconomicallyDisadvantagedId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateEconomicallyDisadvantagedId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateEconomicallyDisadvantagedId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateEnglishLearnerId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateEnglishLearnerId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateEnglishLearnerId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateEnglishLearnerId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateHomelessnessId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateHomelessnessId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateHomelessnessId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateHomelessnessId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateIdeaId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateIdeaId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateIdeaId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateIdeaId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateMigrantId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateMigrantId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateMigrantId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateMigrantId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateMilitaryConnectedStudentId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateMilitaryConnectedStudentId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateMilitaryConnectedStudentId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateMilitaryConnectedStudentId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDatePerkinsEnglishLearnerId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDatePerkinsEnglishLearnerId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDatePerkinsEnglishLearnerId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDatePerkinsEnglishLearnerId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateTitleIIIImmigrantId] ON [RDS].[FactK12StudentEnrollments]([StatusEndDateTitleIIIImmigrantId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateTitleIIIImmigrantId] ON [RDS].[FactK12StudentEnrollments]([StatusStartDateTitleIIIImmigrantId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_TitleIIIStatusId] ON [RDS].[FactK12StudentEnrollments]([TitleIIIStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_K12DropoutStatusId] ON [RDS].[FactK12StudentEnrollments]([K12DropoutStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_K12RetentionStatusId] ON [RDS].[FactK12StudentEnrollments]([K12RetentionStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_PsEnrollmentStatusId] ON [RDS].[FactK12StudentEnrollments]([PsEnrollmentStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_CteOutcomeIndicatorId] ON [RDS].[FactK12StudentEnrollments]([CteOutcomeIndicatorId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_RecordStatusId] ON [RDS].[FactK12StudentEnrollments]([RecordStatusId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_ResponsibleSchoolTypeId] ON [RDS].[FactK12StudentEnrollments]([ResponsibleSchoolTypeId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_LeaMembershipResidentId] ON [RDS].[FactK12StudentEnrollments]([LeaMembershipResidentId] ASC);
GO
CREATE NONCLUSTERED INDEX [IXFX_FactK12StudentEnrollments_DisabilityStatusId] ON [RDS].[FactK12StudentEnrollments]([DisabilityStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactK12StudentEnrollments_DataCollectionId_With_Includes]
    ON [RDS].[FactK12StudentEnrollments]([DataCollectionId] ASC)
    INCLUDE([SchoolYearId], [SeaId], [IeuId], [LeaAccountabilityId], [K12SchoolId], [K12StudentId], [K12EnrollmentStatusId], [EntryGradeLevelId], [ExitGradeLevelId], [EnrollmentEntryDateId], [EnrollmentExitDateId], [ProjectedGraduationDateId], [K12DemographicId], [IdeaStatusId], [StudentCount]);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time a person is enrolled, employed, involved, or participates in the organization, divided by the time the organization defines as full-time for that role.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month, day, and year on which a person enters and begins to receive instructional services in a school, institution, program, or class-section during a given session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Entry Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EntryGradeLevelId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The grade level or primary instructional level at which a student enters and receives services in a school or an educational institution during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EntryGradeLevelId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Entry Grade Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EntryGradeLevelId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000100' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EntryGradeLevelId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21100' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'EntryGradeLevelId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentEnrollments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO