CREATE TABLE [RDS].[FactK12GraduationCohorts] (
    [FactK12GraduationCohortId]	        BIGINT          IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                      INT             CONSTRAINT [DF_FactK12GraduationCohorts_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CohortYearId]                      INT             CONSTRAINT [DF_FactK12GraduationCohorts_CohortYearId] DEFAULT ((-1)) NOT NULL,
    [CohortGraduationYearId]            INT             CONSTRAINT [DF_FactK12GraduationCohorts_CohortGraduationYearId] DEFAULT ((-1)) NOT NULL,
    [DiplomaOrCredentialAwardDateId]	INT             CONSTRAINT [DF_FactK12GraduationCohorts_DiplomaOrCredentialAwardDateId] DEFAULT ((-1)) NOT NULL,
    [CohortExclusionId]                 INT             CONSTRAINT [DF_FactK12GraduationCohorts_CohortExclusionId] DEFAULT ((-1)) NOT NULL,
    [K12AcademicAwardStatusId]          INT             CONSTRAINT [DF_FactK12GraduationCohorts_K12AcademicAwardStatusId] DEFAULT ((-1)) NOT NULL,
    [SeaId]								INT             CONSTRAINT [DF_FactK12GraduationCohorts_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                             INT             CONSTRAINT [DF_FactK12GraduationCohorts_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]				INT             CONSTRAINT [DF_FactK12GraduationCohorts_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaFundingId]						INT             CONSTRAINT [DF_FactK12GraduationCohorts_LeaFundingId] DEFAULT ((-1)) NOT NULL,
    [LeaGraduationId]					INT             CONSTRAINT [DF_FactK12GraduationCohorts_LeaGraduationId] DEFAULT ((-1)) NOT NULL,
    [LeaInstructionId]					INT             CONSTRAINT [DF_FactK12GraduationCohorts_LeaInstructionId] DEFAULT ((-1)) NOT NULL,
    [LeaResidentId]						INT             CONSTRAINT [DF_FactK12GraduationCohorts_LeaResidentId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]						INT             CONSTRAINT [DF_FactK12GraduationCohorts_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]						BIGINT          CONSTRAINT [DF_FactK12GraduationCohorts_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [K12Student_CurrentId]                BIGINT          CONSTRAINT [DF_FactK12GraduationCohorts_K12Student_CurrentId] DEFAULT ((-1)) NOT NULL,
    [K12EnrollmentStatusId]             INT             CONSTRAINT [DF_FactK12GraduationCohorts_K12EnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DropoutStatusId]                INT             CONSTRAINT [DF_FactK12GraduationCohorts_K12DropoutStatusId] DEFAULT ((-1)) NOT NULL,
    [CohortId]                          INT             CONSTRAINT [DF_FactK12GraduationCohorts_CohortId] DEFAULT ((-1)) NOT NULL,
	[CohortStatusId]					INT				CONSTRAINT [DF_FactK12GraduationCohorts_CohortStatusId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelId]						INT             CONSTRAINT [DF_FactK12GraduationCohorts_GradeLevelId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]					INT             CONSTRAINT [DF_FactK12GraduationCohorts_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId] INT             CONSTRAINT [DF_FactK12GraduationCohorts_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [HomelessnessStatusId]              INT             CONSTRAINT [DF_FactK12GraduationCohorts_HomelessnessStatusId] DEFAULT ((-1)) NOT NULL,
    [MigrantStatusId]                   INT             CONSTRAINT [DF_FactK12GraduationCohorts_MigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [FosterCareStatusId]                INT             CONSTRAINT [DF_FactK12GraduationCohorts_FosterCareStatusId] DEFAULT ((-1)) NOT NULL,
    [EnglishLearnerStatusId]            INT             CONSTRAINT [DF_FactK12GraduationCohorts_EnglishLearnerStatusId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                      INT             CONSTRAINT [DF_FactK12GraduationCohorts_IdeaStatusId] DEFAULT ((-1)) NOT NULL, 
    [DisabilityStatusId]                INT             CONSTRAINT [DF_FactK12GraduationCohorts_DisabilityStatusId] DEFAULT ((-1)) NOT NULL,
    [MilitaryStatusId]                  INT             CONSTRAINT [DF_FactK12GraduationCohorts_MilitaryStatusId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                  INT             CONSTRAINT [DF_FactK12GraduationCohorts_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [RecordStatusId]                    INT             CONSTRAINT [DF_FactK12GraduationCohorts_RecordStatusId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_FactK12GraduationCohorts] PRIMARY KEY NONCLUSTERED ([FactK12GraduationCohortId] ASC),
    CONSTRAINT [FK_FactK12GraduationCohorts_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_CohortYearId] FOREIGN KEY ([CohortYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_CohortGraduationYearId] FOREIGN KEY ([CohortGraduationYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_DiplomaOrCredentialAwardDateId] FOREIGN KEY ([DiplomaOrCredentialAwardDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_CohortExclusionId] FOREIGN KEY ([CohortExclusionId]) REFERENCES [RDS].[DimCohortExclusions] ([DimCohortExclusionId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12AcademicAwardStatusId] FOREIGN KEY ([K12AcademicAwardStatusId]) REFERENCES [RDS].[DimK12AcademicAwardStatuses] ([DimK12AcademicAwardStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_LeaFundingId] FOREIGN KEY ([LeaFundingId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_LeaGraduationId] FOREIGN KEY ([LeaGraduationId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_LeaInstructionId] FOREIGN KEY ([LeaInstructionId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_LeaResidentId] FOREIGN KEY ([LeaResidentId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current] ([DimPersonId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12EnrollmentStatusId] FOREIGN KEY ([K12EnrollmentStatusId]) REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12DropoutStatusId] FOREIGN KEY ([K12DropoutStatusId]) REFERENCES [RDS].[DimK12DropoutStatuses] ([DimK12DropoutStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_CohortId] FOREIGN KEY ([CohortId]) REFERENCES [RDS].[DimCohorts] ([DimCohortId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_CohortStatusId] FOREIGN KEY ([CohortId]) REFERENCES [RDS].[DimCohortStatuses] ([DimCohortStatusId]),
	CONSTRAINT [FK_FactK12GraduationCohorts_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_FosterCareStatusId] FOREIGN KEY ([FosterCareStatusId]) REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_MilitaryStatusId] FOREIGN KEY ([MilitaryStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12GraduationCohorts_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12SchoolId]
    ON [RDS].[FactK12GraduationCohorts]([K12SchoolId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_LeaAccountabilityId]
    ON [RDS].[FactK12GraduationCohorts]([LeaAccountabilityId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_LeaFundingId]
    ON [RDS].[FactK12GraduationCohorts]([LeaFundingId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_LeaGraduationId]
    ON [RDS].[FactK12GraduationCohorts]([LeaGraduationId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_LeaInstructionId]
    ON [RDS].[FactK12GraduationCohorts]([LeaInstructionId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_LeaResidentId]
    ON [RDS].[FactK12GraduationCohorts]([LeaResidentId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_IeuId]
    ON [RDS].[FactK12GraduationCohorts]([IeuId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12StudentId]
    ON [RDS].[FactK12GraduationCohorts]([K12StudentId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12Student_CurrentId]
    ON [RDS].[FactK12GraduationCohorts]([K12Student_CurrentId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_SeaId]
    ON [RDS].[FactK12GraduationCohorts]([SeaId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12DemographicId]
    ON [RDS].[FactK12GraduationCohorts]([K12DemographicId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_GradeLevelId]
    ON [RDS].[FactK12GraduationCohorts]([GradeLevelId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_CohortId]
    ON [RDS].[FactK12GraduationCohorts]([CohortId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_CohortStatusId]
    ON [RDS].[FactK12GraduationCohorts]([CohortStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_CohortYearId]
    ON [RDS].[FactK12GraduationCohorts]([CohortYearId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_CohortGraduationYearId]
    ON [RDS].[FactK12GraduationCohorts]([CohortGraduationYearId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_DiplomaOrCredentialAwardDateId]
    ON [RDS].[FactK12GraduationCohorts]([DiplomaOrCredentialAwardDateId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12AcademicAwardStatusId]
    ON [RDS].[FactK12GraduationCohorts]([K12AcademicAwardStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12EnrollmentStatusId]
    ON [RDS].[FactK12GraduationCohorts]([K12EnrollmentStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12DropoutStatusId]
    ON [RDS].[FactK12GraduationCohorts]([K12DropoutStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_EconomicallyDisadvantagedStatusId]
    ON [RDS].[FactK12GraduationCohorts]([EconomicallyDisadvantagedStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_HomelessnessStatusId]
    ON [RDS].[FactK12GraduationCohorts]([HomelessnessStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_MigrantStatusId]
    ON [RDS].[FactK12GraduationCohorts]([MigrantStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_FosterCareStatusId]
    ON [RDS].[FactK12GraduationCohorts]([FosterCareStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_EnglishLearnerStatusId]
    ON [RDS].[FactK12GraduationCohorts]([EnglishLearnerStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_IdeaStatusId]
    ON [RDS].[FactK12GraduationCohorts]([IdeaStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_DisabilityStatusId]
    ON [RDS].[FactK12GraduationCohorts]([DisabilityStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_MilitaryStatusId]
    ON [RDS].[FactK12GraduationCohorts]([MilitaryStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_FactK12GraduationCohorts_SchoolYearId]
    ON [RDS].[FactK12GraduationCohorts]([SchoolYearId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_FactK12GraduationCohorts_CohortExclusionId]
    ON [RDS].[FactK12GraduationCohorts]([CohortExclusionId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_FactK12GraduationCohorts_RecordStatusId]
    ON [RDS].[FactK12GraduationCohorts]([RecordStatusId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_FactK12GraduationCohorts_DataCollectionId]
    ON [RDS].[FactK12GraduationCohorts]([DataCollectionId] ASC);
GO

