CREATE TABLE [RDS].[FactK12StudentCounts](
	[FactK12StudentCountId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[FactTypeId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[K12StudentId] [bigint] NOT NULL,
	[AgeId] [int] NOT NULL,
	[AttendanceId] [int] NOT NULL,
	[CohortStatusId] [int] NOT NULL,
	[CteStatusId] [int] NOT NULL,
	[DisabilityStatusId] [int] NOT NULL,
	[EnglishLearnerStatusId] [int] NOT NULL,
	[GradeLevelId] [int] NOT NULL,
	[HomelessnessStatusId] [int] NOT NULL,
	[EconomicallyDisadvantagedStatusId] [int] NOT NULL,
	[FosterCareStatusId] [int] NOT NULL,
	[IdeaStatusId] [int] NOT NULL,
	[ImmigrantStatusId] [int] NOT NULL,
	[K12DemographicId] [int] NOT NULL,
	[K12EnrollmentStatusId] [int] NOT NULL,
	[K12AcademicAwardStatusId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[MigrantStatusId] [int] NOT NULL,
	[NOrDStatusId] [int] NOT NULL,
	[PrimaryDisabilityTypeId] [int] NOT NULL,
	[RaceId] [int] NOT NULL,
	[SpecialEducationServicesExitDateId] [int] NOT NULL,
	[MigrantStudentQualifyingArrivalDateId] [int] NOT NULL,
	[LastQualifyingMoveDateId] [int] NOT NULL,
	[TitleIStatusId] [int] NOT NULL,
	[TitleIIIStatusId] [int] NOT NULL,
	[StatusStartDateEnglishLearnerId] [int] NOT NULL,
	[StatusEndDateEnglishLearnerId] [int] NOT NULL,
	[StudentCount] [int] NOT NULL,
	[StatusStartDateNeglectedOrDelinquentId] [int] NOT NULL,
	[StatusEndDateNeglectedOrDelinquentId] [int] NOT NULL,
	[CohortYearId] [int] NOT NULL,
	[CohortGraduationYearId] [int] NOT NULL,
	[EnrollmentEntryDateId] [int] NOT NULL,
	[EnrollmentExitDateId] [int] NOT NULL,
 CONSTRAINT [PK_FactStudentCounts] PRIMARY KEY CLUSTERED 
(
	[FactK12StudentCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_SchoolYearId]  DEFAULT ((-1)) FOR [SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_FactTypeId]  DEFAULT ((-1)) FOR [FactTypeId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_K12StudentId]  DEFAULT ((-1)) FOR [K12StudentId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_AgeId]  DEFAULT ((-1)) FOR [AgeId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_AttendanceId]  DEFAULT ((-1)) FOR [AttendanceId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_CohortStatusId]  DEFAULT ((-1)) FOR [CohortStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_CteStatusId]  DEFAULT ((-1)) FOR [CteStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_DisabilityStatusId]  DEFAULT ((-1)) FOR [DisabilityStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_EnglishLearnerStatusId]  DEFAULT ((-1)) FOR [EnglishLearnerStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_GradeLevelId]  DEFAULT ((-1)) FOR [GradeLevelId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_HomelessnessStatusId]  DEFAULT ((-1)) FOR [HomelessnessStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_EconomicallyDisadvantagedStatusId]  DEFAULT ((-1)) FOR [EconomicallyDisadvantagedStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_FosterCareStatusId]  DEFAULT ((-1)) FOR [FosterCareStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_IdeaStatusId]  DEFAULT ((-1)) FOR [IdeaStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_ImmigrantStatusId]  DEFAULT ((-1)) FOR [ImmigrantStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_K12Demographic]  DEFAULT ((-1)) FOR [K12DemographicId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_EnrollmentStatusId]  DEFAULT ((-1)) FOR [K12EnrollmentStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_K12AcademicAwardStatusId]  DEFAULT ((-1)) FOR [K12AcademicAwardStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_LanguageId]  DEFAULT ((-1)) FOR [LanguageId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_MigrantStatusId]  DEFAULT ((-1)) FOR [MigrantStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_NOrDStatusId]  DEFAULT ((-1)) FOR [NOrDStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_PrimaryDisabilityType]  DEFAULT ((-1)) FOR [PrimaryDisabilityTypeId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_RaceId]  DEFAULT ((-1)) FOR [RaceId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_SpecialEducationServicesExitDateId]  DEFAULT ((-1)) FOR [SpecialEducationServicesExitDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_TitleIStatusId]  DEFAULT ((-1)) FOR [TitleIStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_TitleIIIStatusId]  DEFAULT ((-1)) FOR [TitleIIIStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_StatusStartDateEnglishLearnerId]  DEFAULT ((-1)) FOR [StatusStartDateEnglishLearnerId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_StatusEndDateEnglishLearnerId]  DEFAULT ((-1)) FOR [StatusEndDateEnglishLearnerId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_StudentCount]  DEFAULT ((1)) FOR [StudentCount]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_StatusStartDateNeglectedOrDelinquentId]  DEFAULT ((-1)) FOR [StatusStartDateNeglectedOrDelinquentId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_StatusEndDateNeglectedOrDelinquentId]  DEFAULT ((-1)) FOR [StatusEndDateNeglectedOrDelinquentId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_CohortYearId]  DEFAULT ((-1)) FOR [CohortYearId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_CohortGraduationYearId]  DEFAULT ((-1)) FOR [CohortGraduationYearId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_EnrollmentEntryDateId]  DEFAULT ((-1)) FOR [EnrollmentEntryDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts] ADD  CONSTRAINT [DF_FactK12StudentCounts_EnrollmentExitDateId]  DEFAULT ((-1)) FOR [EnrollmentExitDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_AgeId] FOREIGN KEY([AgeId])
REFERENCES [RDS].[DimAges] ([DimAgeId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_AgeId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_AttendanceId] FOREIGN KEY([AttendanceId])
REFERENCES [RDS].[DimAttendances] ([DimAttendanceId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_AttendanceId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_CohortGraduationYearId] FOREIGN KEY([CohortGraduationYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_CohortGraduationYearId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_CohortStatusId] FOREIGN KEY([CohortStatusId])
REFERENCES [RDS].[DimCohortStatuses] ([DimCohortStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_CohortStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_CohortYearId] FOREIGN KEY([CohortYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_CohortYearId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_CteStatusId] FOREIGN KEY([CteStatusId])
REFERENCES [RDS].[DimCteStatuses] ([DimCteStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_CteStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_EconomicallyDisadvantagedStatusId] FOREIGN KEY([EconomicallyDisadvantagedStatusId])
REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_EconomicallyDisadvantagedStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_EnglishLearnerId] FOREIGN KEY([EnglishLearnerStatusId])
REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_EnglishLearnerId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_EnrollmentEntryDateId] FOREIGN KEY([EnrollmentEntryDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_EnrollmentEntryDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_EnrollmentExitDateId] FOREIGN KEY([EnrollmentExitDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_EnrollmentExitDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_FactTypeId] FOREIGN KEY([FactTypeId])
REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_FactTypeId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_FosterCareStatusId] FOREIGN KEY([FosterCareStatusId])
REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_FosterCareStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_GradeLevelId] FOREIGN KEY([GradeLevelId])
REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_GradeLevelId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_HomelessnessStatusId] FOREIGN KEY([HomelessnessStatusId])
REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_HomelessnessStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_IdeaStatusId] FOREIGN KEY([IdeaStatusId])
REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_IdeaStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_ImmigrantStatusId] FOREIGN KEY([ImmigrantStatusId])
REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_ImmigrantStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_K12AcademicAwardStatusId] FOREIGN KEY([K12AcademicAwardStatusId])
REFERENCES [RDS].[DimK12AcademicAwardStatuses] ([DimK12AcademicAwardStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_K12AcademicAwardStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_K12DemographicId] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_K12DemographicId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_K12EnrollmentStatusId] FOREIGN KEY([K12EnrollmentStatusId])
REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_K12EnrollmentStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_K12StudentId] FOREIGN KEY([K12StudentId])
REFERENCES [RDS].[DimPeople] ([DimPersonId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_K12StudentId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [RDS].[DimLanguages] ([DimLanguageId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_LanguageId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_LeaId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_MigrantStatusId] FOREIGN KEY([MigrantStatusId])
REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_MigrantStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_MigrantStudentQualifyingArrivalDateId] FOREIGN KEY([MigrantStudentQualifyingArrivalDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_MigrantStudentQualifyingArrivalDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_NOrDStatusId] FOREIGN KEY([NOrDStatusId])
REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_NOrDStatusId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_PrimaryDisabilityTypeId] FOREIGN KEY([PrimaryDisabilityTypeId])
REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_PrimaryDisabilityTypeId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_RaceId] FOREIGN KEY([RaceId])
REFERENCES [RDS].[DimRaces] ([DimRaceId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_RaceId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_SchoolYearId] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_SeaId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_SpecialEducationServicesExitDateId] FOREIGN KEY([SpecialEducationServicesExitDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_SpecialEducationServicesExitDateId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_StatusEndDateEnglishLearnerId] FOREIGN KEY([StatusEndDateEnglishLearnerId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_StatusEndDateEnglishLearnerId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_StatusEndDateNeglectedOrDelinquentId] FOREIGN KEY([StatusEndDateNeglectedOrDelinquentId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_StatusEndDateNeglectedOrDelinquentId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_StatusStartDateEnglishLearnerId] FOREIGN KEY([StatusStartDateEnglishLearnerId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_StatusStartDateEnglishLearnerId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH NOCHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_StatusStartDateNeglectedOrDelinquentId] FOREIGN KEY([StatusStartDateNeglectedOrDelinquentId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_StatusStartDateNeglectedOrDelinquentId]
GO

ALTER TABLE [RDS].[FactK12StudentCounts]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentCounts_TitleIIIStatusId] FOREIGN KEY([TitleIIIStatusId])
REFERENCES [RDS].[DimTitleIIIStatuses] ([DimTitleIIIStatusId])
GO

ALTER TABLE [RDS].[FactK12StudentCounts] CHECK CONSTRAINT [FK_FactK12StudentCounts_TitleIIIStatusId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day a child with disabilities (IDEA) ages 14 through 21 exited special education.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Services Exit Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000263' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21263' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SpecialEducationServicesExitDateId'
GO


