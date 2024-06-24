CREATE TABLE [RDS].[FactPsStudentCourseTranscripts] (
    [FactPsStudentCourseTranscriptId]       BIGINT IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                          INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                      INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [PsInstitutionId]                       INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_PsInstitutionId] DEFAULT ((-1)) NOT NULL,
    [PsStudentId]                           BIGINT CONSTRAINT [DF_FactPsStudentCourseTranscripts_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [AcademicTermDesignatorId]              INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_AcademicTermDesignatorId] DEFAULT ((-1)) NOT NULL,
    [CipCodeId]                             INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_CipCodeId] DEFAULT ((-1)) NOT NULL,
    [StatePsCourseId]                       INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_StatePsCourseId] DEFAULT ((-1)) NOT NULL,
    [UniversityPsCourseId]                  INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_UniversityPsCourseId] DEFAULT ((-1)) NOT NULL,
    [EnglishLearnerStatusId]                INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_EnglishLearnerStatusId] DEFAULT ((-1)) NOT NULL,
    [PsDemographicId]                       INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_PsDemographicId] DEFAULT ((-1)) NOT NULL,
    [DisabilityStatusId]                    INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_DisabilityStatusId] DEFAULT ((-1)) NOT NULL,
    [EconomicallyDisadvantagedStatusId]     INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_EconomicallyDisadvantagedStatusId] DEFAULT ((-1)) NOT NULL,
    [HomelessnessStatusId]                  INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_HomelessnessStatusId] DEFAULT ((-1)) NOT NULL,
    [MigrantStatusId]                       INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_MigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [PrimaryDisabilityTypeId]               INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_PrimaryDisabilityTypeId] DEFAULT ((-1)) NOT NULL,
    [IdeaStatusId]                          INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_IdeaStatusId] DEFAULT ((-1)) NOT NULL,
    [ImmigrantStatusId]                     INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_ImmigrantStatusId] DEFAULT ((-1)) NOT NULL,
    [MilitartyStatusId]                     INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_MilitaryStatusId] DEFAULT ((-1)) NOT NULL,
    [CourseGradePointAverageIndicatorId]    INT    CONSTRAINT [DF_FactPsStudentCourseTranscripts_CourseGradePointAverageIndicatorId] DEFAULT ((-1)) NOT NULL,
    [NumberOfCreditsAttempted]              DECIMAL(9,2) NULL,
    [NumberOfCreditsEarned]                 DECIMAL(9,2) NULL,
    [StudentCourseSectionGradeEarned]       NVARCHAR(15) NULL,

    CONSTRAINT [PK_FactPsStudentCourseTranscripts] PRIMARY KEY CLUSTERED ([FactPsStudentCourseTranscriptId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_AcademicTermDesignatorId] FOREIGN KEY ([AcademicTermDesignatorId]) REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_PrimaryDisabilityTypeId] FOREIGN KEY ([PrimaryDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_MilitaryStatusId] FOREIGN KEY ([MilitartyStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_StatePsCourseId] FOREIGN KEY ([StatePsCourseId]) REFERENCES [RDS].[DimPsCourses] ([DimPsCourseId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_UniversityPsCourseId] FOREIGN KEY ([UniversityPsCourseId]) REFERENCES [RDS].[DimPsCourses] ([DimPsCourseId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_PsDemographicId] FOREIGN KEY ([PsDemographicId]) REFERENCES [RDS].[DimPsDemographics] ([DimPsDemographicId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_PsInstitutionId] FOREIGN KEY ([PsInstitutionId]) REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_PsStudentId] FOREIGN KEY ([PsStudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactPsStudentCourseTranscripts_CourseGradePointAverageIndicatorId] FOREIGN KEY ([CourseGradePointAverageIndicatorId]) REFERENCES [RDS].[DimCourseGradePointAverageIndicators] ([DimCourseGradePointAverageIndicatorId])

);

GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits that a student can earn for enrolling in and completing a given course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Credits Attempted' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000199' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000199' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits an individual earns by the successful completion of a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Credits Earned' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000200' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000200' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A final indicator of student performance in a course section as submitted by the instructor.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Course Section Grade Earned' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000124' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000124' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactPsStudentCourseTranscripts', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO




--Bridge to DimRaces
