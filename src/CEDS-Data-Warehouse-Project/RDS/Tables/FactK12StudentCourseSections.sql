CREATE TABLE [RDS].[FactK12StudentCourseSections] (
    [FactK12StudentCourseSectionId]       BIGINT IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                        INT    CONSTRAINT [DF_FactK12StudentCourseSections_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                    INT    CONSTRAINT [DF_FactK12StudentCourseSections_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                               INT    CONSTRAINT [DF_FactK12StudentCourseSections_SeaId] DEFAULT ((-1)) NOT NULL,
    [IeuId]                               INT    CONSTRAINT [DF_FactK12StudentCourseSections_IeuId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]                 INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaAttendanceId]                     INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaAttendanceId] DEFAULT ((-1)) NOT NULL,
    [LeaFundingId]                        INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaFundingId] DEFAULT ((-1)) NOT NULL,
    [LeaGraduationId]                     INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaGraduationId] DEFAULT ((-1)) NOT NULL,
    [LeaIndividualizedEducationProgramId] INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaIndividualizedEducationProgramId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                         INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                        BIGINT CONSTRAINT [DF_FactK12StudentCourseSections_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                    INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [K12CourseId]                         INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12CourseId] DEFAULT ((-1)) NOT NULL,
    [K12CourseStatusId]                   INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12CourseStatusId] DEFAULT ((-1)) NOT NULL,
    [ScedCodeId]                          INT    CONSTRAINT [DF_FactK12StudentCourseSections_ScedCodeId] DEFAULT ((-1)) NOT NULL,
    [CipCodeId]                           INT    CONSTRAINT [DF_FactK12StudentCourseSections_CipCodeId] DEFAULT ((-1)) NOT NULL,
    [LanguageId]                          INT    CONSTRAINT [DF_FactK12StudentCourseSections_LanguageId] DEFAULT ((-1)) NOT NULL,
    [EntryGradeLevelId]                   INT    CONSTRAINT [DF_FactK12StudentCourseSections_EntryGradeLevelId] DEFAULT ((-1)) NOT NULL,
    [StudentCourseSectionCount]           INT    CONSTRAINT [DF_FactK12StudentCourseSections_StudentCourseSectionCount] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactK12StudentCourseSections] PRIMARY KEY CLUSTERED ([FactK12StudentCourseSectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactK12StudentCourseSections_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_EntryGradeLevelId] FOREIGN KEY ([EntryGradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseId] FOREIGN KEY ([K12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseStatusId] FOREIGN KEY ([K12CourseStatusId]) REFERENCES [RDS].[DimK12CourseStatuses] ([DimK12CourseStatusId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LanguageId] FOREIGN KEY ([LanguageId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaAttendanceId] FOREIGN KEY ([LeaAttendanceId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaFundingId] FOREIGN KEY ([LeaFundingId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaGraduationId] FOREIGN KEY ([LeaGraduationId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaIndividualizedEducationProgramId] FOREIGN KEY ([LeaIndividualizedEducationProgramId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_ScedCodeId] FOREIGN KEY ([ScedCodeId]) REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId])
);


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_CipCodeId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_DataCollectionId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_EntryGradeLevelId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseStatusId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12DemographicId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LanguageId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_ScedCodeId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_SchoolYearId];


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_SeaId];


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_SchoolYearId] ON [RDS].[FactK12StudentCourseSections]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_DataCollectionId] ON [RDS].[FactK12StudentCourseSections]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_SeaId] ON [RDS].[FactK12StudentCourseSections]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_IeuId] ON [RDS].[FactK12StudentCourseSections]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LeaAccountabilityId] ON [RDS].[FactK12StudentCourseSections]([LeaAccountabilityId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LeaAttendanceId] ON [RDS].[FactK12StudentCourseSections]([LeaAttendanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LeaFundingId] ON [RDS].[FactK12StudentCourseSections]([LeaFundingId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LeaGraduationId] ON [RDS].[FactK12StudentCourseSections]([LeaGraduationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LeaIndividualizedEducationProgramId] ON [RDS].[FactK12StudentCourseSections]([LeaIndividualizedEducationProgramId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12SchoolId] ON [RDS].[FactK12StudentCourseSections]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12StudentId] ON [RDS].[FactK12StudentCourseSections]([K12StudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12DemographicId] ON [RDS].[FactK12StudentCourseSections]([K12DemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12CourseId] ON [RDS].[FactK12StudentCourseSections]([K12CourseId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12CourseStatusId] ON [RDS].[FactK12StudentCourseSections]([K12CourseStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_ScedCodeId] ON [RDS].[FactK12StudentCourseSections]([ScedCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_CipCodeId] ON [RDS].[FactK12StudentCourseSections]([CipCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LanguageId] ON [RDS].[FactK12StudentCourseSections]([LanguageId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_EntryGradeLevelId] ON [RDS].[FactK12StudentCourseSections]([EntryGradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

