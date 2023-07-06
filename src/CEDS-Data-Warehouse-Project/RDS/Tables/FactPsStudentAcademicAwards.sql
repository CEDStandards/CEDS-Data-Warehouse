CREATE TABLE [RDS].[FactPsStudentAcademicAwards] (
    [FactPsStudentAcademicAwardId] INT    IDENTITY (1, 1) NOT NULL,
    [PsInstitutionID]              INT    NOT NULL,
    [PsStudentId]                  BIGINT NOT NULL,
    [PsAcademicAwardTitleId]       INT    NOT NULL,
    [AcademicAwardDateId]          INT    NOT NULL,
    [PsAcademicAwardStatusId]      INT    NOT NULL,
    [StudentCount]                 INT    NOT NULL,
    [SchoolYearId]                 INT    CONSTRAINT [DF_FactPsStudentAcademicAwards_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [PsDemographicId]              INT    CONSTRAINT [DF_FactPsStudentAcademicAwards_PsDemographicId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_FactPsStudentAcademicAwards] PRIMARY KEY CLUSTERED ([FactPsStudentAcademicAwardId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_AcademicAwardDateId] FOREIGN KEY ([AcademicAwardDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_PsAcademicAwardStatuId] FOREIGN KEY ([PsAcademicAwardStatusId]) REFERENCES [RDS].[DimPsAcademicAwardStatuses] ([DimPsAcademicAwardStatusId]),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_PsAcademicAwardTitleId] FOREIGN KEY ([PsAcademicAwardTitleId]) REFERENCES [RDS].[DimPsAcademicAwardTitles] ([DimPsAcademicAwardTitleId]),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_PsDemographicId] FOREIGN KEY ([PsDemographicId]) REFERENCES [RDS].[DimPsDemographics] ([DimPsDemographicId]),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_PsInstitutionId] FOREIGN KEY ([PsInstitutionID]) REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID]),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_PsStudentId] FOREIGN KEY ([PsStudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactPsStudentAcademicAwards_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_PsInstitutionId]
    ON [RDS].[FactPsStudentAcademicAwards]([PsInstitutionID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_AcademicAwardDateId]
    ON [RDS].[FactPsStudentAcademicAwards]([AcademicAwardDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_PsAcademicAwardStatusId]
    ON [RDS].[FactPsStudentAcademicAwards]([PsAcademicAwardStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_AcademicAwardTitleId]
    ON [RDS].[FactPsStudentAcademicAwards]([PsAcademicAwardTitleId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_PsStudentId]
    ON [RDS].[FactPsStudentAcademicAwards]([PsStudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

