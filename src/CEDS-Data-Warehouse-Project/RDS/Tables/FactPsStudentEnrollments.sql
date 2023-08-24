CREATE TABLE [RDS].[FactPsStudentEnrollments] (
    [FactPsStudentEnrollmentId]    BIGINT IDENTITY (1, 1) NOT NULL,
    [DataCollectionId]             INT    CONSTRAINT [DF_FactPsStudentEnrollments_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [SchoolYearId]                 INT    CONSTRAINT [DF_FactPsStudentEnrollments_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                  INT    CONSTRAINT [DF_FactPsStudentEnrollments_CountDateId] DEFAULT ((-1)) NOT NULL,
    [PsInstitutionID]              INT    CONSTRAINT [DF_FactPsStudentEnrollments_PsInstitutionId] DEFAULT ((-1)) NOT NULL,
    [PsStudentId]                  BIGINT CONSTRAINT [DF_FactPsStudentEnrollments_PsStudentId] DEFAULT ((-1)) NOT NULL,
    [AcademicTermDesignatorId]     INT    CONSTRAINT [DF_FactPsStudentEnrollments_AcademicTermDesignatorId] DEFAULT ((-1)) NOT NULL,
    [EntryDateIntoPostSecondaryId] INT    CONSTRAINT [DF_FactPsStudentEnrollments_EntryDateIntoPostSecondaryId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]        INT    CONSTRAINT [DF_FactPsStudentEnrollments_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentExitDateId]         INT    CONSTRAINT [DF_FactPsStudentEnrollments_EnrollmentExitDateId] DEFAULT ((-1)) NOT NULL,
    [PsEnrollmentStatusId]         BIGINT CONSTRAINT [DF_FactPsStudentEnrollments_PsEnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [PsInstitutionStatusId]        INT    CONSTRAINT [DF_FactPsStudentEnrollments_PsInstitutionStatusId] DEFAULT ((-1)) NOT NULL,
    [StudentCount]                 INT    CONSTRAINT [DF_FactPsStudentEnrollments_StudentCount] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactPsStudentEnrollments] PRIMARY KEY CLUSTERED ([FactPsStudentEnrollmentId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactPsStudentEnrollments_AcademicTermDesignatorId] FOREIGN KEY ([AcademicTermDesignatorId]) REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_EntryDateIntoPostSecondaryId] FOREIGN KEY ([EntryDateIntoPostSecondaryId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_PsEnrollmentStatusId] FOREIGN KEY ([PsEnrollmentStatusId]) REFERENCES [RDS].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_PsInstitutionId] FOREIGN KEY ([PsInstitutionID]) REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID]),
    CONSTRAINT [FK_FactPsStudentEnrollments_PsInstitutionStatusId] FOREIGN KEY ([PsInstitutionStatusId]) REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_PsStudentId] FOREIGN KEY ([PsStudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactPsStudentEnrollments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
);


GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] NOCHECK CONSTRAINT [FK_FactPsStudentEnrollments_AcademicTermDesignatorId];


GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] NOCHECK CONSTRAINT [FK_FactPsStudentEnrollments_DataCollectionId];


GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] NOCHECK CONSTRAINT [FK_FactPsStudentEnrollments_PsEnrollmentStatusId];


GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] NOCHECK CONSTRAINT [FK_FactPsStudentEnrollments_PsInstitutionStatusId];


GO
ALTER TABLE [RDS].[FactPsStudentEnrollments] NOCHECK CONSTRAINT [FK_FactPsStudentEnrollments_SchoolYearId];


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_DataCollectionId] ON [RDS].[FactPsStudentEnrollments]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_SchoolYearId] ON [RDS].[FactPsStudentEnrollments]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_CountDateId] ON [RDS].[FactPsStudentEnrollments]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_PsInstitutionID] ON [RDS].[FactPsStudentEnrollments]([PsInstitutionID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_PsStudentId] ON [RDS].[FactPsStudentEnrollments]([PsStudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_AcademicTermDesignatorId] ON [RDS].[FactPsStudentEnrollments]([AcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_EntryDateIntoPostSecondaryId] ON [RDS].[FactPsStudentEnrollments]([EntryDateIntoPostSecondaryId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_EnrollmentEntryDateId] ON [RDS].[FactPsStudentEnrollments]([EnrollmentEntryDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_EnrollmentExitDateId] ON [RDS].[FactPsStudentEnrollments]([EnrollmentExitDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_PsEnrollmentStatusId] ON [RDS].[FactPsStudentEnrollments]([PsEnrollmentStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_PsInstitutionStatusId] ON [RDS].[FactPsStudentEnrollments]([PsInstitutionStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month, day, and year on which a person enters and begins to receive instructional services in a school, institution, program, or class-section during a given session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Entry Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the student officially withdrew or graduated, i.e. the date on which the student''s enrollment ended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Exit Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000107' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21107' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentEnrollments', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO