CREATE TABLE [RDS].[FactK12ProgramParticipations] (
    [FactK12ProgramParticipationId]       BIGINT IDENTITY (1, 1) NOT NULL,
    [DataCollectionId]                    INT    CONSTRAINT [DF_FactK12ProgramParticipations_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [SchoolYearId]                        INT    CONSTRAINT [DF_FactK12ProgramParticipations_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                               INT    CONSTRAINT [DF_FactK12ProgramParticipations_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                               INT    CONSTRAINT [DF_FactK12ProgramParticipations_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]                 INT    CONSTRAINT [DF_FactK12ProgramParticipations_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaAttendanceId]                     INT    CONSTRAINT [DF_FactK12ProgramParticipations_LeaAttendancId] DEFAULT ((-1)) NOT NULL,
    [LeaFundingId]                        INT    CONSTRAINT [DF_FactK12ProgramParticipations_LeaFundingId] DEFAULT ((-1)) NOT NULL,
    [LeaGraduationId]                     INT    CONSTRAINT [DF_FactK12ProgramParticipations_LeaGraduationId] DEFAULT ((-1)) NOT NULL,
    [LeaIndividualizedEducationProgramId] INT    CONSTRAINT [DF_FactK12ProgramParticipations_LeaIndividualizedEducationProgramId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                         INT    CONSTRAINT [DF_FactK12ProgramParticipations_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                        BIGINT CONSTRAINT [DF_FactK12ProgramParticipations_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                        INT    CONSTRAINT [DF_FactK12ProgramParticipations_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                    INT    CONSTRAINT [DF_FactK12ProgramParticipations_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [K12ProgramTypeId]                    INT    CONSTRAINT [DF_FactK12ProgramParticipations_K12ProgramTypeId] DEFAULT ((-1)) NOT NULL,
    [ProgramParticipationStartDateId]     INT    CONSTRAINT [DF_FactK12ProgramParticipations_ProgramParticipationStartDateId] DEFAULT ((-1)) NOT NULL,
    [ProgramParticipationExitDateId]      INT    CONSTRAINT [DF_FactK12ProgramParticipations_ProgramParticipationExitDateId] DEFAULT ((-1)) NOT NULL,
    [StudentCount]                        INT    CONSTRAINT [DF_FactK12ProgramParticipations_StudentCount] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactK12ProgramParticipations] PRIMARY KEY CLUSTERED ([FactK12ProgramParticipationId] ASC),
    CONSTRAINT [FK_FactK12ProgramParticipations_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_K12Demographics] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_K12ProgramTypes] FOREIGN KEY ([K12ProgramTypeId]) REFERENCES [RDS].[DimK12ProgramTypes] ([DimK12ProgramTypeId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12ProgramParticipations_LeaAttendanceId] FOREIGN KEY ([LeaAttendanceId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12ProgramParticipations_LeaFundingId] FOREIGN KEY ([LeaFundingId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12ProgramParticipations_LeaGraduationID] FOREIGN KEY ([LeaGraduationId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12ProgramParticipations_LeaIndividualizedEducationProgramId] FOREIGN KEY ([LeaIndividualizedEducationProgramId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12ProgramParticipations_ProgramParticipationExitDateId] FOREIGN KEY ([ProgramParticipationExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_ProgramParticipationStartDateId] FOREIGN KEY ([ProgramParticipationStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12ProgramParticipations_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_K12StudentId]
    ON [RDS].[FactK12ProgramParticipations]([K12StudentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_IeuId]
    ON [RDS].[FactK12ProgramParticipations]([IeuId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_SchoolYearId]
    ON [RDS].[FactK12ProgramParticipations]([SchoolYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_LeaGraduationId]
    ON [RDS].[FactK12ProgramParticipations]([LeaGraduationId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_LeaAccountabilityId]
    ON [RDS].[FactK12ProgramParticipations]([LeaAccountabilityId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_K12DemographicId]
    ON [RDS].[FactK12ProgramParticipations]([K12DemographicId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_SeaId]
    ON [RDS].[FactK12ProgramParticipations]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_DataCollectionId]
    ON [RDS].[FactK12ProgramParticipations]([DataCollectionId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_LeaIndividualizedEducationProgramId]
    ON [RDS].[FactK12ProgramParticipations]([LeaIndividualizedEducationProgramId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_K12ProgramTypeId]
    ON [RDS].[FactK12ProgramParticipations]([K12ProgramTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_ProgramParticipationExitDateId]
    ON [RDS].[FactK12ProgramParticipations]([ProgramParticipationExitDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_LeaAttendanceId]
    ON [RDS].[FactK12ProgramParticipations]([LeaAttendanceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_K12SchoolId]
    ON [RDS].[FactK12ProgramParticipations]([K12SchoolId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_IdeaStatusId]
    ON [RDS].[FactK12ProgramParticipations]([IdeaStatusId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_ProgramParticipationStartDateId]
    ON [RDS].[FactK12ProgramParticipations]([ProgramParticipationStartDateId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_LeaFundingId]
    ON [RDS].[FactK12ProgramParticipations]([LeaFundingId] ASC);


GO

