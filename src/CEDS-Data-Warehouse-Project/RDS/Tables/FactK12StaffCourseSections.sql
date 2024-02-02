CREATE TABLE [RDS].[FactK12StaffCourseSections]
(
	[FactK12StaffCourseSections] int NOT NULL IDENTITY (1, 1),
	[SchoolYearId] int NOT NULL DEFAULT -1,
	[SeaId] int NOT NULL DEFAULT -1,
	[IeuId] int NOT NULL DEFAULT -1,
	[LeaId] int NOT NULL DEFAULT -1,
	[K12SchoolId] int NOT NULL DEFAULT -1,
	[CipCodeId] int NOT NULL DEFAULT -1,
	[CourseApplicableEducationLevelId] int NOT NULL DEFAULT -1,
	[K12CourseStatusId] int NOT NULL DEFAULT -1,
	[K12CourseId] int NOT NULL DEFAULT -1,
	[K12EmploymentStatusId] int NOT NULL DEFAULT -1,
	[K12JobId] int NOT NULL DEFAULT -1,
	[K12PositionId] int NOT NULL DEFAULT -1,
	[K12PositionStatusId] int NOT NULL DEFAULT -1,
	[K12StaffAssignmentStatusId] int NOT NULL DEFAULT -1,
	[K12StaffCategoryId] int NOT NULL DEFAULT -1,
	[K12StaffMemberId] bigint NOT NULL DEFAULT -1,
	[K12StaffStatusId] int NOT NULL DEFAULT -1,
	[ScedCodeId] int NOT NULL DEFAULT -1,
	[K12StaffMemberCount] int NOT NULL DEFAULT 1,
	[K12StudentCount] int NOT NULL DEFAULT 0,
	[OrganizationCalendarSessionId] int NULL,
	[CountDateId] int NULL,
	[EmployerId] int NULL,
	[K12CourseSectionStatusId] int NULL,
	[InstructionLanguageId] int NULL,
	[K12DemographicId] int NULL,
	[DataCollectionId] int NULL,
	[SeaJobClassificationId] int NULL,
	[LeaJobClassificationId] int NULL,
	CONSTRAINT [PK_FactK12StaffCourseSections] PRIMARY KEY CLUSTERED ([FactK12StaffCourseSections] ASC),
	CONSTRAINT [FK_FactK12StaffCourseSections_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_CourseApplicableEducationLevelId] FOREIGN KEY ([CourseApplicableEducationLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_InstructionLanguageId] FOREIGN KEY ([InstructionLanguageId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12CourseId] FOREIGN KEY ([K12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12CourseSectionStatusId] FOREIGN KEY ([K12CourseSectionStatusId]) REFERENCES [RDS].[DimK12CourseSectionStatuses] ([DimK12CourseSectionStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12CourseStatusId] FOREIGN KEY ([K12CourseStatusId]) REFERENCES [RDS].[DimK12CourseStatuses] ([DimK12CourseStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12PositionId]	FOREIGN KEY ([K12PositionId]) REFERENCES [RDS].[DimK12Positions] ([DimK12PositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12PositionStatusId] FOREIGN KEY ([K12PositionStatusId]) REFERENCES [RDS].[DimK12PositionStatuses] ([DimK12PositionStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffMemberId] FOREIGN KEY ([K12StaffMemberId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_OrganizationCalendarSessionId] FOREIGN KEY ([OrganizationCalendarSessionId]) REFERENCES [RDS].[DimOrganizationCalendarSessions] ([DimOrganizationCalendarSessionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_ScedCodeId] FOREIGN KEY ([ScedCodeId]) REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StffCourseSections_K12StaffAssignmentStatusId] FOREIGN KEY ([K12StaffAssignmentStatusId]) REFERENCES [RDS].[DimK12StaffAssignmentStatuses] ([DimK12StaffAssignmentStatusId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimCipCodes] 
 ON [RDS].[FactK12StaffCourseSections] ([CipCodeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimDataCollections] 
 ON [RDS].[FactK12StaffCourseSections] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimDates] 
 ON [RDS].[FactK12StaffCourseSections] ([CountDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimEmployers] 
 ON [RDS].[FactK12StaffCourseSections] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimGradeLevels] 
 ON [RDS].[FactK12StaffCourseSections] ([CourseApplicableEducationLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimIeus] 
 ON [RDS].[FactK12StaffCourseSections] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12Courses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12CourseId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12CourseSectionStatuses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12CourseSectionStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12CourseStatuses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12CourseStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12Demographics] 
 ON [RDS].[FactK12StaffCourseSections] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12EmploymentStatuses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12Jobs] 
 ON [RDS].[FactK12StaffCourseSections] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12Positions] 
 ON [RDS].[FactK12StaffCourseSections] ([K12PositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12PositionStatuses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12PositionStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12Schools] 
 ON [RDS].[FactK12StaffCourseSections] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12StaffAssignmentStatuses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffAssignmentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12StaffCategories] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12StaffStatuses] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimLanguages] 
 ON [RDS].[FactK12StaffCourseSections] ([InstructionLanguageId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimLeaJobClassifications] 
 ON [RDS].[FactK12StaffCourseSections] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimLeas] 
 ON [RDS].[FactK12StaffCourseSections] ([LeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimOrganizationCalendarSessions] 
 ON [RDS].[FactK12StaffCourseSections] ([OrganizationCalendarSessionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimPeople] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffMemberId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimScedCodes] 
 ON [RDS].[FactK12StaffCourseSections] ([ScedCodeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimSchoolYears] 
 ON [RDS].[FactK12StaffCourseSections] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimSeaJobClassifications] 
 ON [RDS].[FactK12StaffCourseSections] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimSeas] 
 ON [RDS].[FactK12StaffCourseSections] ([SeaId] ASC)
GO
