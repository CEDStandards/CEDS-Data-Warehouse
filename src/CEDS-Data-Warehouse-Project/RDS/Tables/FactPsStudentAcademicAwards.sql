CREATE TABLE [RDS].[FactPsStudentAcademicAwards] (
    [FactPsStudentAcademicAwardId] INT    IDENTITY (1, 1) NOT NULL,
    [PsInstitutionId]              INT    CONSTRAINT [DF_FactPsStudentAcademicAwards_PsInstitutionID] DEFAULT ((-1)) NOT NULL,
    [PsStudentId]                  BIGINT CONSTRAINT [DF_FactPsStudentAcademicAwards_PsStudentId] DEFAULT ((-1)) NOT NULL,
    [PsAcademicAwardTitleId]       INT    CONSTRAINT [DF_FactPsStudentAcademicAwards_PsAcademicAwardTitleId] DEFAULT ((-1)) NOT NULL,
    [AcademicAwardDateId]          INT    CONSTRAINT [DF_FactPsStudentAcademicAwards_AcademicAwardDateId] DEFAULT ((-1)) NOT NULL,
    [PsAcademicAwardStatusId]      INT    CONSTRAINT [DF_FactPsStudentAcademicAwards_PsAcademicAwardStatusId] DEFAULT ((-1)) NOT NULL,
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

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_SchoolYearId]
    ON [RDS].[FactPsStudentAcademicAwards]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_PsDemographicId]
    ON [RDS].[FactPsStudentAcademicAwards]([PsDemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day or year and month on which the academic award was conferred.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Award Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000001' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21001' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicAwards', @level2type=N'COLUMN',@level2name=N'AcademicAwardDateId';
GO