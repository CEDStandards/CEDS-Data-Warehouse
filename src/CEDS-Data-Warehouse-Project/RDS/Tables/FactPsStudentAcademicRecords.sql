CREATE TABLE [RDS].[FactPsStudentAcademicRecords] (
    [FactPsStudentAcademicRecordId]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                              INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                               INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_CountDateId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                     INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_SeaId] DEFAULT ((-1)) NOT NULL,
    [PsInstitutionID]                           INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_PsInstitutionId] DEFAULT ((-1)) NOT NULL,
    [PsStudentId]                               BIGINT          CONSTRAINT [DF_FactPsStudentAcademicRecords_PsStudentId] DEFAULT ((-1)) NOT NULL,
    [AcademicTermDesignatorId]                  INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_AcademicTermDesignatorId] DEFAULT ((-1)) NOT NULL,
    [PsCourseId]                                INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_PsCourseId] DEFAULT ((-1)) NOT NULL,
    [PsDemographicId]                           INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_PsDemographicId] DEFAULT ((-1)) NOT NULL,
    [PsInstitutionStatusId]                     INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_PsInstitutionStatusId] DEFAULT ((-1)) NOT NULL,
    [PsEnrollmentStatusId]                      BIGINT          CONSTRAINT [DF_FactPsStudentAcademicRecords_PsEnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]                     INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentExitDateId]                      INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_EnrollmentExitDateId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                          INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [InstructionalActivityHoursCompletedCredit] DECIMAL (10, 2) NULL,
    [GradePointAverage]                         DECIMAL (5, 4)  NULL,
    [GradePointAverageCumulative]               DECIMAL (5, 4)  NULL,
    [DualCreditDualEnrollmentCreditsAwarded]    DECIMAL (4, 2)  NULL,
    [APCreditsAwarded]                          INT             NULL,
    [CourseTotal]                               INT             NULL,
    [StudentCourseCount]                        INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_StudentCourseCount] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_FactPsStudentAcademicRecords] PRIMARY KEY CLUSTERED ([FactPsStudentAcademicRecordId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_AcademicTermDesignatorId] FOREIGN KEY ([AcademicTermDesignatorId]) REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsCourseId] FOREIGN KEY ([PsCourseId]) REFERENCES [RDS].[DimPsCourses] ([DimPsCourseId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsDemographicId] FOREIGN KEY ([PsDemographicId]) REFERENCES [RDS].[DimPsDemographics] ([DimPsDemographicId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsEnrollmentStatusId] FOREIGN KEY ([PsEnrollmentStatusId]) REFERENCES [RDS].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsInstitutionId] FOREIGN KEY ([PsInstitutionID]) REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsInstitutionStatusId] FOREIGN KEY ([PsInstitutionStatusId]) REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsStudentId] FOREIGN KEY ([PsStudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_EnrollmentEntryDateId]
    ON [RDS].[FactPsStudentAcademicRecords]([EnrollmentEntryDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_SeaId]
    ON [RDS].[FactPsStudentAcademicRecords]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_EnrollmentExitDateId]
    ON [RDS].[FactPsStudentAcademicRecords]([EnrollmentExitDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_SchoolYearId]
    ON [RDS].[FactPsStudentAcademicRecords]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_CountDateId]
    ON [RDS].[FactPsStudentAcademicRecords]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_AcademicTermDesignatorId]
    ON [RDS].[FactPsStudentAcademicRecords]([AcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsInstitutionId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsInstitutionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsCourseId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsCourseId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsInstitutionStatusId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsInstitutionStatusId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_DataCollectionId]
    ON [RDS].[FactPsStudentAcademicRecords]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsEnrollmentStatusId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsEnrollmentStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsDemographicId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsDemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsStudentId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsStudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21703' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignatorId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CourseTotal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of courses listed on a transcript. Used as a check digit for integrity purposes.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CourseTotal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Total' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CourseTotal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001316' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CourseTotal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CourseTotal';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'DualCreditDualEnrollmentCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits awarded a student by the postsecondary institution based on successful completion of dual credit/dual enrollment courses. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'DualCreditDualEnrollmentCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Dual Credit Dual Enrollment Credits Awarded' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'DualCreditDualEnrollmentCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000085' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'DualCreditDualEnrollmentCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21085' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'DualCreditDualEnrollmentCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of the total quality points divided by the Credit Hours for Grade Point Average. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Point Average' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverage';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverageCumulative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of the total quality points divided by the Credit Hours for Grade Point Average. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverageCumulative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Point Average' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverageCumulative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverageCumulative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'GradePointAverageCumulative';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'PsEnrollmentStatusId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective month, day, and year on which the data was counted.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Count Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001760' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22741' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'APCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits awarded a student by the postsecondary institution based on successful completion of advanced placement courses and/or advanced placement tests. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'APCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Advanced Placement Credits Awarded' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'APCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000018' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'APCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21018' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'APCreditsAwarded';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credit hours and/or contact hours successfully completed by a person during a term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Instructional Activity Hours Completed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000362' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21361' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO