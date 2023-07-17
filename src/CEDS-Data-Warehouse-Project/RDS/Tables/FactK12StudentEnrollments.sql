CREATE TABLE [RDS].[FactK12StudentEnrollments] (
    [FactK12StudentEnrollmentId]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                               INT            NOT NULL,
    [CountDateId]                                INT            CONSTRAINT [DF_FactK12StudentEnrollments_CountDateId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                           INT            NOT NULL,
    [SeaId]                                      INT            NOT NULL,
    [IeuId]                                      INT            NOT NULL,
    [K12StudentId]                               BIGINT         NOT NULL,
    [LeaAccountabilityId]                        INT            NOT NULL,
    [LeaAttendanceId]                            INT            NOT NULL,
    [LeaFundingId]                               INT            NOT NULL,
    [LeaGraduationID]                            INT            NOT NULL,
    [LeaIndividualizedEducationProgramId]        INT            NOT NULL,
    [K12SchoolId]                                INT            NOT NULL,
    [EducationOrganizationNetworkId]             INT            NOT NULL,
    [CohortGraduationYearId]                     INT            NOT NULL,
    [CohortYearId]                               INT            NOT NULL,
    [CteStatusId]                                INT            NOT NULL,
    [EntryGradeLevelId]                          INT            NOT NULL,
    [ExitGradeLevelId]                           INT            NOT NULL,
    [EnrollmentEntryDateId]                      INT            NOT NULL,
    [EnrollmentExitDateId]                       INT            NOT NULL,
    [EnglishLearnerStatusId]                     INT            NOT NULL,
    [K12EnrollmentStatusId]                      INT            NOT NULL,
    [K12DemographicId]                           INT            NOT NULL,
    [IdeaStatusId]                               INT            NOT NULL,
    [HomelessnessStatusId]                       INT            NOT NULL,
    [EconomicallyDisadvantagedStatusId]          INT            NOT NULL,
    [FosterCareStatusId]                         INT            NOT NULL,
    [ImmigrantStatusId]                          INT            NOT NULL,
    [LanguageHomeId]                             INT            NOT NULL,
    [LanguageNativeId]                           INT            NOT NULL,
    [MigrantStatusId]                            INT            NOT NULL,
    [MilitaryStatusId]                           INT            NOT NULL,
    [NOrDStatusId]                               INT            NOT NULL,
    [PrimaryDisabilityTypeId]                    INT            NOT NULL,
    [SecondaryDisabilityTypeId]                  INT            NOT NULL,
    [ProjectedGraduationDateId]                  INT            NOT NULL,
    [StatusStartDateEconomicallyDisadvantagedId] INT            NOT NULL,
    [StatusEndDateEconomicallyDisadvantagedId]   INT            NOT NULL,
    [StatusStartDateEnglishLearnerId]            INT            NOT NULL,
    [StatusEndDateEnglishLearnerId]              INT            NOT NULL,
    [StatusStartDateHomelessnessId]              INT            NOT NULL,
    [StatusEndDateHomelessnessId]                INT            NOT NULL,
    [StatusStartDateIdeaId]                      INT            NOT NULL,
    [StatusEndDateIdeaId]                        INT            NOT NULL,
    [StatusStartDateMigrantId]                   INT            NOT NULL,
    [StatusEndDateMigrantId]                     INT            NOT NULL,
    [StatusStartDateMilitaryConnectedStudentId]  INT            NOT NULL,
    [StatusEndDateMilitaryConnectedStudentId]    INT            NOT NULL,
    [StatusStartDatePerkinsEnglishLearnerId]     INT            NOT NULL,
    [StatusEndDatePerkinsEnglishLearnerId]       INT            NOT NULL,
    [StatusEndDateTitleIIIImmigrantId]           INT            NOT NULL,
    [StatusStartDateTitleIIIImmigrantId]         INT            NOT NULL,
    [TitleIIIStatusId]                           INT            NOT NULL,
    [FullTimeEquivalency]                        DECIMAL (5, 2) NULL,
    [StudentCount]                               INT            NOT NULL,
    [ResponsibleSchoolTypeId]                    INT            CONSTRAINT [DF_FactK12StudentEnrollments_ResponsibleSchoolTypeId] DEFAULT ((-1)) NOT NULL,
    [LeaMembershipResidentId]                    INT            CONSTRAINT [DF_FactK12StudentEnrollments_LeaMembershipResidentId] DEFAULT ((-1)) NOT NULL,
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
    CONSTRAINT [FK_FactK12StudentEnrollments_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentEnrollments_K12EnrollmentStatusId] FOREIGN KEY ([K12EnrollmentStatusId]) REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId]),
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
    CONSTRAINT [FK_FactK12StudentEnrollments_TitleIIIStatusId] FOREIGN KEY ([TitleIIIStatusId]) REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDatePerkinsELId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDatePerkinsEnglishLearnerId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_PrimaryDisabilityTypes]
    ON [RDS].[FactK12StudentEnrollments]([PrimaryDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaFundingId]
    ON [RDS].[FactK12StudentEnrollments]([LeaFundingId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CteStatusId]
    ON [RDS].[FactK12StudentEnrollments]([CteStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateTitleIIIImmgirantId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateTitleIIIImmigrantId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12SchoolId]
    ON [RDS].[FactK12StudentEnrollments]([K12SchoolId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateEnglishLearnerId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateEnglishLearnerId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EnrollmentEntryDateId]
    ON [RDS].[FactK12StudentEnrollments]([EnrollmentEntryDateId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12StudentId]
    ON [RDS].[FactK12StudentEnrollments]([K12StudentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateTitleIIIImmigrantId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateTitleIIIImmigrantId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateHomelessnessId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateHomelessnessId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaGraduationId]
    ON [RDS].[FactK12StudentEnrollments]([LeaGraduationID] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EnrollmentExitDateId]
    ON [RDS].[FactK12StudentEnrollments]([EnrollmentExitDateId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_IdeaStatusId]
    ON [RDS].[FactK12StudentEnrollments]([IdeaStatusId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateEconomicallyDisadvantagedId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateEconomicallyDisadvantagedId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateEnglishLearnerId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateEnglishLearnerId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_IeuId]
    ON [RDS].[FactK12StudentEnrollments]([IeuId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_TitleIIIStatusId]
    ON [RDS].[FactK12StudentEnrollments]([TitleIIIStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ProjectedGraduationDateId]
    ON [RDS].[FactK12StudentEnrollments]([ProjectedGraduationDateId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_DataCollectionId]
    ON [RDS].[FactK12StudentEnrollments]([DataCollectionId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateHomelessnessId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateHomelessnessId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EconomicallyDisadvantagedStatusId]
    ON [RDS].[FactK12StudentEnrollments]([EconomicallyDisadvantagedStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LanguageHomeId]
    ON [RDS].[FactK12StudentEnrollments]([LanguageHomeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateIdeaId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateIdeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaIndividualizedEducationProgramId]
    ON [RDS].[FactK12StudentEnrollments]([LeaIndividualizedEducationProgramId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_SchoolYearId]
    ON [RDS].[FactK12StudentEnrollments]([SchoolYearId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EntryGradeLevelId]
    ON [RDS].[FactK12StudentEnrollments]([EntryGradeLevelId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LanguageNativeId]
    ON [RDS].[FactK12StudentEnrollments]([LanguageNativeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_MigrantStatusId]
    ON [RDS].[FactK12StudentEnrollments]([MigrantStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_SeaId]
    ON [RDS].[FactK12StudentEnrollments]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateIdeaId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateIdeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ExitGradeLevelId]
    ON [RDS].[FactK12StudentEnrollments]([ExitGradeLevelId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaMembershipResidentId]
    ON [RDS].[FactK12StudentEnrollments]([LeaMembershipResidentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ImmigrantStatusId]
    ON [RDS].[FactK12StudentEnrollments]([ImmigrantStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactK12StudentEnrollments_DataCollectionId_With_Includes]
    ON [RDS].[FactK12StudentEnrollments]([DataCollectionId] ASC)
    INCLUDE([SchoolYearId], [SeaId], [IeuId], [LeaAccountabilityId], [K12SchoolId], [K12StudentId], [K12EnrollmentStatusId], [EntryGradeLevelId], [ExitGradeLevelId], [EnrollmentEntryDateId], [EnrollmentExitDateId], [ProjectedGraduationDateId], [K12DemographicId], [IdeaStatusId], [StudentCount]);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateMigrantId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateMigrantId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateMilitaryConnectedStudentId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateMilitaryConnectedStudentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12DemographicId]
    ON [RDS].[FactK12StudentEnrollments]([K12DemographicId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CohortGraduationYearId]
    ON [RDS].[FactK12StudentEnrollments]([CohortGraduationYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_SecodanryDisabilityTypes]
    ON [RDS].[FactK12StudentEnrollments]([SecondaryDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaAccountabilityId]
    ON [RDS].[FactK12StudentEnrollments]([LeaAccountabilityId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_ResponsibleSchoolTypeId]
    ON [RDS].[FactK12StudentEnrollments]([ResponsibleSchoolTypeId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EducationOrganizationNetworkId]
    ON [RDS].[FactK12StudentEnrollments]([EducationOrganizationNetworkId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDatePerkinsELId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDatePerkinsEnglishLearnerId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_EnglishLearnerStatusId]
    ON [RDS].[FactK12StudentEnrollments]([EnglishLearnerStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12EnrollmentStatusId]
    ON [RDS].[FactK12StudentEnrollments]([K12EnrollmentStatusId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_MilitaryStatusId]
    ON [RDS].[FactK12StudentEnrollments]([MilitaryStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateMigrantId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateMigrantId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_FosterCareStatusId]
    ON [RDS].[FactK12StudentEnrollments]([FosterCareStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_HomelessnessStatusId]
    ON [RDS].[FactK12StudentEnrollments]([HomelessnessStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusEndDateEconomicallyDisadvantageId]
    ON [RDS].[FactK12StudentEnrollments]([StatusEndDateEconomicallyDisadvantagedId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_NOrDStatusId]
    ON [RDS].[FactK12StudentEnrollments]([NOrDStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_CohortYearId]
    ON [RDS].[FactK12StudentEnrollments]([CohortYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_LeaAttendanceId]
    ON [RDS].[FactK12StudentEnrollments]([LeaAttendanceId] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_StatusStartDateMilitaryConnectedStudentId]
    ON [RDS].[FactK12StudentEnrollments]([StatusStartDateMilitaryConnectedStudentId] ASC);


GO
