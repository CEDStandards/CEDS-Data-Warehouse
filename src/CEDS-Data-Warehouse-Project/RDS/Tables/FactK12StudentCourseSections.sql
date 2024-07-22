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
    [LeaInstructionId]                    INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaInstructionId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                         INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                        BIGINT CONSTRAINT [DF_FactK12StudentCourseSections_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]                    INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [K12CourseSectionId]                  INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12CourseSectionId] DEFAULT ((-1)) NOT NULL,
    [StateK12CourseId]                    INT    CONSTRAINT [DF_FactK12StudentCourseSections_StateK12CourseId] DEFAULT ((-1)) NOT NULL,
    [LeaK12CourseId]                      INT    CONSTRAINT [DF_FactK12StudentCourseSections_LeaK12CourseId] DEFAULT ((-1)) NOT NULL,
    [K12CourseStatusId]                   INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12CourseStatusId] DEFAULT ((-1)) NOT NULL,
    [K12CourseSectionStatusId]            INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12CourseSectionStatusId] DEFAULT ((-1)) NOT NULL,
    [ScedCodeId]                          INT    CONSTRAINT [DF_FactK12StudentCourseSections_ScedCodeId] DEFAULT ((-1)) NOT NULL,
    [CipCodeId]                           INT    CONSTRAINT [DF_FactK12StudentCourseSections_CipCodeId] DEFAULT ((-1)) NOT NULL,
    [LanguageId]                          INT    CONSTRAINT [DF_FactK12StudentCourseSections_LanguageId] DEFAULT ((-1)) NOT NULL,
    [EntryGradeLevelId]                   INT    CONSTRAINT [DF_FactK12StudentCourseSections_EntryGradeLevelId] DEFAULT ((-1)) NOT NULL,
    [K12CourseSectionEnrollmentStatusId]  INT    CONSTRAINT [DF_FactK12StudentCourseSections_K12CourseSectionEnrollmentStatusId] DEFAULT ((-1)) NOT NULL,
    [WorkBasedLearningStatusId]  INT    CONSTRAINT [DF_FactK12StudentCourseSections_WorkBasedLearningStatusId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]                 INT   CONSTRAINT [DF_FactK12StudentCourseSections_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [CourseSectionExitWithdrawalDateId]     INT   CONSTRAINT [DF_FactK12StudentCourseSections_CourseSectionExitWithdrawalDateId] DEFAULT ((-1)) NOT NULL,
    [CalendarSessionId]                   INT    CONSTRAINT [DF_FactK12StudentCourseSections_CalendarSessionId] DEFAULT ((-1)) NOT NULL,
    [ClassBeginningTimeId]              INT    CONSTRAINT [DK_FactK12StudentCourseSections_ClassBeginningTimeId] DEFAULT ((-1)) NOT NULL,
    [ClassEndingTimeId]                 INT    CONSTRAINT [DK_FactK12StudentCourseSections_ClassEndingTimeId] DEFAULT ((-1)) NOT NULL,
    [MidTermMark]                           NVARCHAR(15) NULL,
    [NumberOfCreditsAttempted]              DECIMAL(9,2) NULL,
    [NumberOfCreditsEarned]                 DECIMAL(9,2) NULL,
    [StudentCourseSectionGradeEarned]       NVARCHAR(15) NULL,
    [StudentCourseSectionGradeNarrative]    NVARCHAR(300) NULL,
    [StudentCourseSectionCount]           INT    CONSTRAINT [DF_FactK12StudentCourseSections_StudentCourseSectionCount] DEFAULT ((1)) NOT NULL,
    [RecordStatusId]                  INT    CONSTRAINT [DF_FactK12StudentCourseSections_RecordStatusId] DEFAULT ((-1)) NOT NULL,
    [RecordStartDateTime] DATETIME NULL,
	[RecordEndDateTime] DATETIME NULL,

    CONSTRAINT [PK_FactK12StudentCourseSections] PRIMARY KEY CLUSTERED ([FactK12StudentCourseSectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactK12StudentCourseSections_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_EntryGradeLevelId] FOREIGN KEY ([EntryGradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_StateK12CourseId] FOREIGN KEY ([StateK12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaK12CourseId] FOREIGN KEY ([LeaK12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseStatusId] FOREIGN KEY ([K12CourseStatusId]) REFERENCES [RDS].[DimK12CourseStatuses] ([DimK12CourseStatusId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseSectionStatusId] FOREIGN KEY ([K12CourseSectionStatusId]) REFERENCES [RDS].[DimK12CourseSectionStatuses] ([DimK12CourseSectionStatusId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LanguageId] FOREIGN KEY ([LanguageId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaAttendanceId] FOREIGN KEY ([LeaAttendanceId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaFundingId] FOREIGN KEY ([LeaFundingId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaGraduationId] FOREIGN KEY ([LeaGraduationId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaIndividualizedEducationProgramId] FOREIGN KEY ([LeaIndividualizedEducationProgramId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_LeaInstructionId] FOREIGN KEY ([LeaInstructionId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentCourseSections_ScedCodeId] FOREIGN KEY ([ScedCodeId]) REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseSectionEnrollmentStatusId] FOREIGN KEY ([K12CourseSectionEnrollmentStatusId]) REFERENCES [RDS].[DimK12CourseSectionEnrollmentStatuses] ([DimK12CourseSectionEnrollmentStatusId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_WorkBasedLearningStatusId] FOREIGN KEY ([WorkBasedLearningStatusId]) REFERENCES [RDS].[DimWorkBasedLearningStatuses] ([DimWorkBasedLearningStatusId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseSectionId] FOREIGN KEY ([K12CourseSectionId]) REFERENCES [RDS].[DimK12CourseSections] ([DimK12CourseSectionId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_CourseSectionExitWithdrawalDateId] FOREIGN KEY ([CourseSectionExitWithdrawalDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_CalendarSessionId] FOREIGN KEY ([CalendarSessionId]) REFERENCES [RDS].[DimCalendarSessions] ([DimCalendarSessionId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_ClassBeginningTimeId] FOREIGN KEY ([ClassBeginningTimeId]) REFERENCES [RDS].[DimTimes] ([DimTimeId]),
    CONSTRAINT [FK_FactK12StudentCourseSections_ClassEndingTimeId] FOREIGN KEY ([ClassEndingTimeId]) REFERENCES [RDS].[DimTimes] ([DimTimeId]),
    CONSTRAINT [FF_FactK12StudentCourseSections_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId])
);


GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_CipCodeId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_DataCollectionId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_EntryGradeLevelId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_StateK12CourseId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaK12CourseId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseStatusId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseSectionStatusId];

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
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseSectionEnrollmentStatusId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_WorkBasedLearningStatusId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_EnrollmentEntryDateId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_CourseSectionExitWithdrawalDateId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_CalendarSessionId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_ClassBeginningTimeId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_ClassEndingTimeId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaAccountabilityId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaAttendanceId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaFundingId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaGraduationId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaIndividualizedEducationProgramId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaInstructionId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12SchoolId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_K12StudentId];

GO
ALTER TABLE [RDS].[FactK12StudentCourseSections] NOCHECK CONSTRAINT [FK_FactK12StudentCourseSections_LeaK12CourseId];

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
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_StateK12CourseId] ON [RDS].[FactK12StudentCourseSections]([StateK12CourseId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LeaK12CourseId] ON [RDS].[FactK12StudentCourseSections]([LeaK12CourseId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12CourseStatusId] ON [RDS].[FactK12StudentCourseSections]([K12CourseStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12CourseSectionStatusId] ON [RDS].[FactK12StudentCourseSections]([K12CourseSectionStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_ScedCodeId] ON [RDS].[FactK12StudentCourseSections]([ScedCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_CipCodeId] ON [RDS].[FactK12StudentCourseSections]([CipCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_LanguageId] ON [RDS].[FactK12StudentCourseSections]([LanguageId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_EntryGradeLevelId] ON [RDS].[FactK12StudentCourseSections]([EntryGradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12CourseSectionEnrollmentStatusId] ON [RDS].[FactK12StudentCourseSections]([K12CourseSectionEnrollmentStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_WorkBasedLearningStatusId] ON [RDS].[FactK12StudentCourseSections]([WorkBasedLearningStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_EnrollmentEntryDateId] ON [RDS].[FactK12StudentCourseSections]([EnrollmentEntryDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_CourseSectionExitWithdrawalDateId] ON [RDS].[FactK12StudentCourseSections]([CourseSectionExitWithdrawalDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12CourseSectionId] ON [RDS].[FactK12StudentCourseSections]([K12CourseSectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_CalendarSessionId] ON [RDS].[FactK12StudentCourseSections]([CalendarSessionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month, day, and year on which a person enters and begins to receive instructional services in a school, institution, program, or class-section during a given session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Entry Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionExitWithdrawalDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day of the first day after the date of a person''s last enrollment in a course section.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionExitWithdrawalDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Exit Withdrawal Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionExitWithdrawalDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000651' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionExitWithdrawalDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000651' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionExitWithdrawalDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'MidTermMark';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicator of student performance at the mid-point of the marking period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'MidTermMark';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Mid Term Mark' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'MidTermMark';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000183' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'MidTermMark';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000183' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'MidTermMark';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits that a student can earn for enrolling in and completing a given course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Credits Attempted' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000199' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000199' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits an individual earns by the successful completion of a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Credits Earned' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000200' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000200' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A final indicator of student performance in a course section as submitted by the instructor.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Course Section Grade Earned' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000124' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000124' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeNarrative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The narrative of the student performance in a course section as submitted by the instructor.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeNarrative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Course Section Grade Narrative' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeNarrative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeNarrative';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeNarrative';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the time of day the class begins.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Class Beginning Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000519' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000519' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the time of day the class ends.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Class Ending Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000520' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000520' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO