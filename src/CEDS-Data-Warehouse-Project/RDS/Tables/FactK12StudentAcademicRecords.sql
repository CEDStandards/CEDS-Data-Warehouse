CREATE TABLE [RDS].[FactK12StudentAcademicRecords] (
    [FactK12StudentAcademicRecordId]                    BIGINT  IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]                                      INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [CountDateId]                                       INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_CountDateId] DEFAULT ((-1)) NOT NULL,
    [AcademicTermDesignatorId]                          INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_AcademicTermDesignatorId] DEFAULT ((-1)) NOT NULL,
    [SeaId]                                             INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_SeaId] DEFAULT ((-1)) NOT NULL,
    [LeaAccountabilityId]                               INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_LeaAccountabilityId] DEFAULT ((-1)) NOT NULL,
    [LeaInstructionId]                                  INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_LeaInstructionId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]                                       INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]                                      BIGINT  CONSTRAINT [DF_FactK12StudentAcademicRecords_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [K12AcademicAwardStatusId]                          INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_K12AcademicAwardStatusId] DEFAULT ((-1)) NOT NULL,
    [HighSchoolGradePointAverageWeighted]               DECIMAl (5,4) NULL,
    [HighSchoolGradePointAverageCumulativeWeighted]     DECIMAL (5,4) NULL,
    [HighSchoolGradePointAverageUnweighted]             DECIMAL (5,4) NULL,
    [HighSchoolGradePointAverageCumulativeUnweighted]   DECIMAL (5,4) NULL,
    [ProjectedGraduationDateId]                         INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_ProjectedGraduationDateId] DEFAULT ((-1)) NOT NULL,
    [EducationCareerEducationPlanDateId]                INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_EducationCareerEducationPlanDateId] DEFAULT ((-1)) NOT NULL,
    [CareerCareerEducationPlanDateId]                   INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_CareerCareerEducationPlanDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentEntryDateId]                             INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_EnrollmentEntryDateId] DEFAULT ((-1)) NOT NULL,
    [EnrollmentExitDateId]                              INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_EnrollmentExitDateId] DEFAULT ((-1)) NOT NULL,
    [DataCollectionId]                                  INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_DataCollectionId] DEFAULT ((-1)) NOT NULL,
    [RecordStatusId]                                    INT     CONSTRAINT [DF_FactK12StudentAcademicRecords_RecordStatusId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_FactK12StudentAcademicRecords] PRIMARY KEY CLUSTERED ([FactK12StudentAcademicRecordId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_AcademicTermDesignatorId] FOREIGN KEY ([AcademicTermDesignatorId]) REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_ProjectedGraduationDateId] FOREIGN KEY ([ProjectedGraduationDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_EducationCareerEducationPlanDateId] FOREIGN KEY ([EducationCareerEducationPlanDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_CareerCareerEducationPlanDateId] FOREIGN KEY ([CareerCareerEducationPlanDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_LeaAccountabilityId] FOREIGN KEY ([LeaAccountabilityId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_LeaInstructionId] FOREIGN KEY ([LeaInstructionId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]),
    CONSTRAINT [FK_FactK12StudentAcademicRecords_K12AcademicAwardStatusId] FOREIGN KEY ([K12AcademicAwardStatusId]) REFERENCES [RDS].[DimK12AcademicAwardStatuses] ([Dimk12AcademicAwardStatusId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_EnrollmentEntryDateId]
    ON [RDS].[FactK12StudentAcademicRecords]([EnrollmentEntryDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_SeaId]
    ON [RDS].[FactK12StudentAcademicRecords]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_EnrollmentExitDateId]
    ON [RDS].[FactK12StudentAcademicRecords]([EnrollmentExitDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_SchoolYearId]
    ON [RDS].[FactK12StudentAcademicRecords]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_CountDateId]
    ON [RDS].[FactK12StudentAcademicRecords]([CountDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_AcademicTermDesignatorId]
    ON [RDS].[FactK12StudentAcademicRecords]([AcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_DataCollectionId]
    ON [RDS].[FactK12StudentAcademicRecords]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_K12StudentId]
    ON [RDS].[FactK12StudentAcademicRecords]([K12StudentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective month, day, and year on which the data was counted.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Count Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001760' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001760' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CountDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of the total quality points divided by the Credit Hours for Grade Point Average. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Point Average' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Grade Point Average Domain' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'HighSchool' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElement', @value=N'Grade Point Average Weighted Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementGlobalId', @value=N'000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionCode', @value=N'Weighted' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of the total quality points divided by the Credit Hours for Grade Point Average. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Point Average' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000127' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Grade Point Average Domain' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'HighSchool' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElement', @value=N'Grade Point Average Weighted Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementGlobalId', @value=N'000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionCode', @value=N'Unweighted' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A measure of average performance in all courses taken by a person during his or her school career as determined for record-keeping purposes. This is obtained by dividing the total grade points received by the total number of credits attempted. This usually includes grade points received and credits attempted in his or her current school as well as those transferred from schools in which the person was previously enrolled.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Point Average Cumulative' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000128' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000128' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Grade Point Average Domain' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'HighSchool' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElement', @value=N'Grade Point Average Weighted Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementGlobalId', @value=N'000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionCode', @value=N'Unweighted' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeUnweighted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A measure of average performance in all courses taken by a person during his or her school career as determined for record-keeping purposes. This is obtained by dividing the total grade points received by the total number of credits attempted. This usually includes grade points received and credits attempted in his or her current school as well as those transferred from schools in which the person was previously enrolled.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Point Average Cumulative' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000128' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000128' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Grade Point Average Domain' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'HighSchool' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000758' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElement', @value=N'Grade Point Average Weighted Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementGlobalId', @value=N'000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionCode', @value=N'Weighted' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000123' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'HighSchoolGradePointAverageCumulativeWeighted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'ProjectedGraduationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year and month the student is projected to graduate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'ProjectedGraduationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Projected Graduation Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'ProjectedGraduationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000226' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'ProjectedGraduationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000226' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'ProjectedGraduationDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date on which an individual''s professional development career plan was last updated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Education Plan Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Career Education Plan Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'001290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'Education' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/001290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'EducationCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date on which an individual''s professional development career plan was last updated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Education Plan Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Career Education Plan Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'001290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'Career' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/001290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAcademicRecords', @level2type=N'COLUMN',@level2name=N'CareerCareerEducationPlanDateId';
GO