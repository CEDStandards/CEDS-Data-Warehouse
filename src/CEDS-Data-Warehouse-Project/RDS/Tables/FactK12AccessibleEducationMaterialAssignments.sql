CREATE TABLE [RDS].[FactK12AccessibleEducationMaterialAssignments]
(
	[FactK12AccessibleEducationMaterialAssignmentId] int NOT NULL IDENTITY (1, 1),
	[SchoolYearId] int NULL,
	[CountDateId] int NULL,
	[K12StudentId] bigint NULL,
	[SeaId] int NULL,
	[IeuId] int NULL,
	[LeaId] int NULL,
	[K12SchoolId] int NULL,
	[AccessibleEducationMaterialProviderId] int NULL,
	[AccessibleEducationMaterialId] int NULL,
	[DataCollectionId] int NULL,
	[DisabilityStatusId] int NULL,
	[EconomicallyDisadvantagedStatusId] int NULL,
	[EnglishLearnerStatusId] int NULL,
	[EntryGradeLevelId] int NULL,
	[FosterCareStatusId] int NULL,
	[HomelessnessStatusId] int NULL,
	[IdeaStatusId] int NULL,
	[ImmigrantStatusId] int NULL,
	[K12CourseId] int NULL,
	[K12DemographicId] int NULL,
	[K12EnrollmentStatusId] int NULL,
	[MigrantStatusId] int NULL,
	[MilitaryStatusId] int NULL,
	[PrimaryIdeaDisabilityTypeId] int NULL,
	[SecondaryIdeaDisabilityTypeId] int NULL,
	[ScedCodeId] int NULL,
	[EnrollmentEntryDateId] int NULL,
	[EnrollmentExitDateId] int NULL,
	[StatusStartDateEconomicallyDisadvantagedId(*)] int NULL,
	[StatusEndDateEconomicallyDisadvantagedId] int NULL,
	[StatusStartDateEnglishLearnerId] int NULL,
	[StatusEndDateEnglishLearnerId] int NULL,
	[StatusStartDateHomelessnessId] int NULL,
	[StatusEndDateHomelessnessId] int NULL,
	[StatusStartDateIdeaId] int NULL,
	[StatusEndDateIdeaId] int NULL,
	[StatusStartDateMigrantId] int NULL,
	[StatusEndDateMigrantId] int NULL,
	[StatusStartDateMilitaryId] int NULL,
	[StatusEndDateMilitaryId] int NULL,
	[StatusStartDatePerkinsEnglishLearnerId] int NULL,
	[StatusEndDatePerkinsEnglishLearnerId] int NULL,
	[LearningResourceIssuedDateId] int NULL,
	[LearningResourceOrderedDateId] int NULL,
	[LearningResourceReceivedDateId] int NULL,
	[CourseSectionStartDateId] int NULL,
	[CourseSectionEndDateId] int NULL,
	CONSTRAINT [PK_FactK12AccessibleEducationMaterialAssignments] PRIMARY KEY CLUSTERED ([FactK12AccessibleEducationMaterialAssignmentId] ASC),
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_AccessibleEducationMaterialId] FOREIGN KEY ([AccessibleEducationMaterialId]) REFERENCES [RDS].[DimAccessibleEducationMaterialStatuses] ([DimAccessibleEducationMaterialStatusesId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_AccessibleEducationMaterialProviderId]	FOREIGN KEY ([AccessibleEducationMaterialProviderId]) REFERENCES [RDS].[DimAccessibleEducationMaterialProviders] ([DimAccessibleEducationMaterialProviderId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_CourseSectionEndDateId] FOREIGN KEY ([CourseSectionEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_CourseSectionStartDateId] FOREIGN KEY ([CourseSectionStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_DisabilityStatusId] FOREIGN KEY ([DisabilityStatusId]) REFERENCES [RDS].[DimDisabilityStatuses] ([DimDisabilityStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_EconomicallyDisadvantagedStatusId] FOREIGN KEY ([EconomicallyDisadvantagedStatusId]) REFERENCES [RDS].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_EnglishLearnerStatusId] FOREIGN KEY ([EnglishLearnerStatusId]) REFERENCES [RDS].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_EnrollmentEntryDateId] FOREIGN KEY ([EnrollmentEntryDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_EnrollmentExitDateId] FOREIGN KEY ([EnrollmentExitDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_EntryGradeLevelId] FOREIGN KEY ([EntryGradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_FosterCareStatusId] FOREIGN KEY ([FosterCareStatusId]) REFERENCES [RDS].[DimFosterCareStatuses] ([DimFosterCareStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_HomelessnessStatusId] FOREIGN KEY ([HomelessnessStatusId]) REFERENCES [RDS].[DimHomelessnessStatuses] ([DimHomelessnessStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_IdeaStatusId] FOREIGN KEY ([IdeaStatusId]) REFERENCES [RDS].[DimIdeaStatuses] ([DimIdeaStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_ImmigrantStatusId] FOREIGN KEY ([ImmigrantStatusId]) REFERENCES [RDS].[DimImmigrantStatuses] ([DimImmigrantStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12CourseId] FOREIGN KEY ([K12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12EnrollmentStatusId] FOREIGN KEY ([K12EnrollmentStatusId]) REFERENCES [RDS].[DimK12EnrollmentStatuses] ([DimK12EnrollmentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_LearningResourceIssuedDateId] FOREIGN KEY ([LearningResourceIssuedDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_LearningResourceOrderedDateId] FOREIGN KEY ([LearningResourceOrderedDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_LearningResourceReceivedDateId] FOREIGN KEY ([LearningResourceReceivedDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_MigrantStatusId] FOREIGN KEY ([MigrantStatusId]) REFERENCES [RDS].[DimMigrantStatuses] ([DimMigrantStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_MilitaryStatusId] FOREIGN KEY ([MilitaryStatusId]) REFERENCES [RDS].[DimMilitaryStatuses] ([DimMilitaryStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_PrimaryIdeaDisabilityTypeId] FOREIGN KEY ([PrimaryIdeaDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_ScedCodeId] FOREIGN KEY ([ScedCodeId]) REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_SecondaryIdeaDisabilityTypeId] FOREIGN KEY ([SecondaryIdeaDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDateEconomicallyDisadvantagedId] FOREIGN KEY ([StatusEndDateEconomicallyDisadvantagedId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDateEnglishLearnerId] FOREIGN KEY ([StatusEndDateEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDateHomelessnessId] FOREIGN KEY ([StatusEndDateHomelessnessId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDateIdeaId] FOREIGN KEY ([StatusEndDateIdeaId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDateMigrantId] FOREIGN KEY ([StatusEndDateMigrantId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDateMilitaryId] FOREIGN KEY ([StatusEndDateMilitaryId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusEndDatePerkinsEnglishLearnerId] FOREIGN KEY ([StatusEndDatePerkinsEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDateEconomicallyDisadvantagedId] FOREIGN KEY ([StatusStartDateEconomicallyDisadvantagedId(*)]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDateEnglishLearnerId] FOREIGN KEY ([StatusStartDateEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDateHomelessnessId] FOREIGN KEY ([StatusStartDateHomelessnessId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDateIdeaId] FOREIGN KEY ([StatusStartDateIdeaId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDateMigrantId] FOREIGN KEY ([StatusStartDateMigrantId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDateMilitaryId] FOREIGN KEY ([StatusStartDateMilitaryId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_StatusStartDatePerkinsEnglishLearnerId] FOREIGN KEY ([StatusStartDatePerkinsEnglishLearnerId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimAccessibleEducationMaterialProviders] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([AccessibleEducationMaterialProviderId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimAccessibleEducationMaterials] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([AccessibleEducationMaterialId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDataCollections] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([CountDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_02] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([EnrollmentEntryDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_03] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([EnrollmentExitDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_04] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDateEconomicallyDisadvantagedId(*)] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_05] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDateEconomicallyDisadvantagedId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_06] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDateEnglishLearnerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_07] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDateEnglishLearnerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_08] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDateHomelessnessId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_09] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDateHomelessnessId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_10] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDateIdeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_11] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDateIdeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_12] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDateMigrantId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_13] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDateMigrantId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_14] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDateMilitaryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_15] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDateMilitaryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_16] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusStartDatePerkinsEnglishLearnerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_17] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([StatusEndDatePerkinsEnglishLearnerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_18] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([LearningResourceIssuedDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_19] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([LearningResourceOrderedDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_20] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([LearningResourceReceivedDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_21] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([CourseSectionStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDates_22] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([CourseSectionEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimDisabilityStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([DisabilityStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimEconomicallyDisadvantagedStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([EconomicallyDisadvantagedStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimEnglishLearnerStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([EnglishLearnerStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimFosterCareStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([FosterCareStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimGradeLevels] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([EntryGradeLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimHomelessnessStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([HomelessnessStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimIdeaDisabilityTypes] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([PrimaryIdeaDisabilityTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimIdeaDisabilityTypes_02] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([SecondaryIdeaDisabilityTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimIdeaStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([IdeaStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimIeus] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimImmigrantStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([ImmigrantStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimK12Courses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([K12CourseId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimK12Demographics] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimK12EnrollmentStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([K12EnrollmentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimK12Schools] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimLeas] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([LeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimMigrantStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([MigrantStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimMilitaryStatuses] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([MilitaryStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimPeople] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([K12StudentId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimScedCodes] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([ScedCodeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimSchoolYears] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_DimSeas] 
 ON [RDS].[FactK12AccessibleEducationMaterialAssignments] ([SeaId] ASC)
GO