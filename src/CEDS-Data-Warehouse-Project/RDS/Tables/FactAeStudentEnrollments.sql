CREATE TABLE [RDS].[FactAeStudentEnrollments] (
    [FactAeStudentEnrollmentId]           INT            IDENTITY (1, 1) NOT NULL,
    [ProgramYearId]                     INT            CONSTRAINT [DF_FactAeStudentEnrollments_ProgramYearId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                    INT            CONSTRAINT [DF_FactAeStudentEnrollments_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [AeStudentId]                         BIGINT         CONSTRAINT [DF_FactAeStudentEnrollments_AeStudentId] DEFAULT ((-1)) NOT NULL,
    [AeProviderId]                        INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeProviderId] DEFAULT ((-1)) NOT NULL,
    [AeProgramTypeId]                     INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeProgramTypeId] DEFAULT ((-1)) NOT NULL,
    [AeProgramTransitionIndicatorId]      INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeProgramTransitionIndicatorId] DEFAULT ((-1)) NOT NULL,
    [AeProgramEmploymentIndicatorId]      INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeProgramEmploymentIndicatorId] DEFAULT ((-1)) NOT NULL,
    [AeProgramParticipantAssessmentIndicatorId]      INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeProgramParticipantAssessmentIndicatorId] DEFAULT ((-1)) NOT NULL,
    [AeProgramParticipantIndicatorId]      INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeProgramParticipantIndicatorId] DEFAULT ((-1)) NOT NULL,
    [ApplicationDateId]                   INT            CONSTRAINT [DF_FactAeStudentEnrollments_ApplicationDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]               INT            CONSTRAINT [DF_FactAeStudentEnrollments_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentExitDateId]                INT            CONSTRAINT [DF_FactAeStudentEnrollments_EnrollmentExitDateId] DEFAULT ((-1)) NOT NULL,
    [AePostsecondaryTransitionDateId]     INT            CONSTRAINT [DF_FactAeStudentEnrollments_AePostsecondaryTransitionDateId] DEFAULT ((-1)) NOT NULL,
    [AeDemographicId]                     INT            CONSTRAINT [DF_FactAeStudentEnrollments_AeDemographicId] DEFAULT ((-1)) NOT NULL,
    [EnglishLearnerStatusId]                     INT            CONSTRAINT [DF_FactAeStudentEnrollments_EnglishLearnerStatusId] DEFAULT ((-1)) NOT NULL,
    [HomelessnessStatusId]                       INT            CONSTRAINT [DF_FactAeStudentEnrollments_HomelessnessStatusId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]          INT            CONSTRAINT [DF_FactAeStudentEnrollments_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [MigrantStatusId]                            INT            CONSTRAINT [DF_FactAeStudentEnrollments_MigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [MilitaryStatusId]                           INT            CONSTRAINT [DF_FactAeStudentEnrollments_MilitaryStatusId] DEFAULT ((-1)) NOT NULL,
    [DisabilityStatusId]                         INT            CONSTRAINT [DF_FactAeStudentEnrollments_DisabilityStatusId] DEFAULT ((-1)) NOT NULL,
    [HighSchoolDiplomaDiplomaOrCredentialAwardDateId]   INT            CONSTRAINT [DF_FactAeStudentEnrollments_HighSchoolDiplomaDiplomaOrCredentialAwardDateId] DEFAULT ((-1)) NOT NULL,
    [K12AcademicAwardStatusId]            INT            CONSTRAINT [DF_FactAeStudentEnrollments_K12AcademicAwardStatusId] DEFAULT ((-1)) NOT NULL,
    [QuarterlyEarningsAfterExitQ1]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ2]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ3]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ4]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ5]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ6]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ7]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ8]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ9]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ10]       DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ11]       DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ12]       DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ13]       DECIMAL (9, 2) NULL,
    [InstructionalActivityHoursCompleted] DECIMAL (9, 2) NULL,
    [StudentCount]                        INT            NOT NULL,
    CONSTRAINT [PK_FactAeStudentEnrollments] PRIMARY KEY CLUSTERED ([FactAeStudentEnrollmentId] ASC),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeDemographicId] FOREIGN KEY ([AeDemographicId]) REFERENCES [RDS].[DimAeDemographics] ([DimAeDemographicId]),

    CONSTRAINT [FK_FactAeStudentEnrollments_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_MilitaryStatusId] FOREIGN KEY ([MilitaryStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AePostsecondaryTransitionDateId] FOREIGN KEY ([AePostsecondaryTransitionDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeProgramTypeId] FOREIGN KEY ([AeProgramTypeId]) REFERENCES [RDS].[DimAeProgramTypes] ([DimAeProgramTypeId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_ProgramYearId] FOREIGN KEY ([ProgramYearId]) REFERENCES [RDS].[DimProgramYears] ([DimProgramYearId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeProviderId] FOREIGN KEY ([AeProviderId]) REFERENCES [RDS].[DimAeProviders] ([DimAeProviderId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeStudentId] FOREIGN KEY ([AeStudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeProgramParticipantIndicatorId] FOREIGN KEY ([AeProgramParticipantIndicatorId]) REFERENCES [RDS].[DimAeProgramParticipantIndicators] ([DimAeProgramParticipantIndicatorId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeProgramParticipantAssessmentIndicatorId] FOREIGN KEY ([AeProgramParticipantAssessmentIndicatorId]) REFERENCES [RDS].[DimAeProgramParticipantAssessmentIndicators] ([DimAeProgramParticipantAssessmentIndicatorId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeProgramEmploymentIndicatorId] FOREIGN KEY ([AeProgramEmploymentIndicatorId]) REFERENCES [RDS].[DimAeProgramEmploymentIndicators] ([DimAeProgramEmploymentIndicatorId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_AeProgramTransitionIndicatorId] FOREIGN KEY ([AeProgramTransitionIndicatorId]) REFERENCES [RDS].[DimAeProgramTransitionIndicators] ([DimAeProgramTransitionIndicatorId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_ApplicationDateId] FOREIGN KEY ([ApplicationDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_K12AcademicAwardStatusId] FOREIGN KEY ([K12AcademicAwardStatusId]) REFERENCES [RDS].[DimK12AcademicAwardStatuses] ([DimK12AcademicAwardStatusId]),
    CONSTRAINT [FK_FactAeStudentEnrollments_HighSchoolDiplomaDiplomaOrCredentialAwardDateId] FOREIGN KEY ([HighSchoolDiplomaDiplomaOrCredentialAwardDateId]) REFERENCES [RDS].[DimDates] ([DimDateId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeDemographicId] ON [RDS].[FactAeStudentEnrollments]([AeDemographicId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AePostsecondaryTransitionDateId] ON [RDS].[FactAeStudentEnrollments]([AePostsecondaryTransitionDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeProgramTypeId] ON [RDS].[FactAeStudentEnrollments]([AeProgramTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_ProgramYearId] ON [RDS].[FactAeStudentEnrollments]([ProgramYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeProviderId] ON [RDS].[FactAeStudentEnrollments]([AeProviderId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeStudentId] ON [RDS].[FactAeStudentEnrollments]([AeStudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeProgramParticipantIndicatorId] ON [RDS].[FactAeStudentEnrollments]([AeProgramParticipantIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeProgramParticipantAssessmentIndicatorId] ON [RDS].[FactAeStudentEnrollments]([AeProgramParticipantAssessmentIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeProgramEmploymentIndicatorId] ON [RDS].[FactAeStudentEnrollments]([AeProgramEmploymentIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeProgramTransitionIndicatorId] ON [RDS].[FactAeStudentEnrollments]([AeProgramTransitionIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_ApplicationDateId] ON [RDS].[FactAeStudentEnrollments]([ApplicationDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_DataCollectionId] ON [RDS].[FactAeStudentEnrollments]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_EnrollmentEntryDateId] ON [RDS].[FactAeStudentEnrollments]([EnrollmentEntryDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_EnrollmentExitDateId] ON [RDS].[FactAeStudentEnrollments]([EnrollmentExitDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_K12AcademicAwardStatusId] ON [RDS].[FactAeStudentEnrollments]([K12AcademicAwardStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_HighSchoolDiplomaDiplomaOrCredentialAwardDateId] ON [RDS].[FactAeStudentEnrollments]([HighSchoolDiplomaDiplomaOrCredentialAwardDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person previously enrolled in adult education entered and began to receive instructional services or training at a postsecondary institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Postsecondary Transition Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001081' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001081' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AeProgramTypeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AeProgramTypeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AeProgramTypeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AeProgramTypeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'AeProgramTypeId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'ApplicationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which an individual  application is received by the organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'ApplicationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Application Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'ApplicationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000323' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'ApplicationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000323' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'ApplicationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month, day, and year on which a person enters and begins to receive instructional services in a school, institution, program, or class-section during a given session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Entry Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000097' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the student officially withdrew or graduated, i.e. the date on which the student''s enrollment ended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Exit Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000107' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000107' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompleted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credit hours and/or contact hours successfully completed by a person during a term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompleted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Instructional Activity Hours Completed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompleted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000362' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompleted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000362' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompleted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month and year on which the diploma/credential is awarded to a student in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Diploma or Credential Award Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000081' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000081' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'HighSchoolDiploma' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaDiplomaOrCredentialAwardDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ1';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ1';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ1';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ1';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ1';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ10';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ10';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ10';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ10';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ10';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ11';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ11';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ11';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ11';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ11';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ12';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ12';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ12';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ12';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ12';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ13';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ13';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ13';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ13';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ13';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ2';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ2';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ2';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ2';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ2';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ3';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ3';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ3';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ3';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ3';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ4';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ4';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ4';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ4';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ4';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ5';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ5';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ5';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ5';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ5';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ6';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ6';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ6';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ6';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ6';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ7';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ7';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ7';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ7';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ7';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ8';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ8';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ8';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ8';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ8';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ9';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ9';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ9';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ9';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactAeStudentEnrollments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarningsAfterExitQ9';
GO