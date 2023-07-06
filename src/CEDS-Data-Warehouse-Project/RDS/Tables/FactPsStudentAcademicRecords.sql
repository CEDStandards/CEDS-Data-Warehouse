CREATE TABLE [RDS].[FactPsStudentAcademicRecords] (
    [FactPsStudentAcademicRecordId]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                              INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                     INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_SeaId] DEFAULT ((-1)) NOT NULL,
    [PsInstitutionID]                           INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_PsInstitutionId] DEFAULT ((-1)) NOT NULL,
    [PsStudentId]                               BIGINT          CONSTRAINT [DF_FactPsStudentAcademicRecords_PsStudentId] DEFAULT ((-1)) NOT NULL,
    [AcademicTermDesignatorId]                  INT             CONSTRAINT [DF_FactPsStudentAcademicRecords_AcademicTermDesignatorId] DEFAULT ((-1)) NOT NULL,
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
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsDemographicId] FOREIGN KEY ([PsDemographicId]) REFERENCES [RDS].[DimPsDemographics] ([DimPsDemographicId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsEnrollmentStatusId] FOREIGN KEY ([PsEnrollmentStatusId]) REFERENCES [RDS].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsInstitutionId] FOREIGN KEY ([PsInstitutionID]) REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionID]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsInstitutionStatusId] FOREIGN KEY ([PsInstitutionStatusId]) REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_PsStudentId] FOREIGN KEY ([PsStudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactPsStudentAcademicRecords_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
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

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_AcademicTermDesignatorId]
    ON [RDS].[FactPsStudentAcademicRecords]([AcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsInstitutionId]
    ON [RDS].[FactPsStudentAcademicRecords]([PsInstitutionID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


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

