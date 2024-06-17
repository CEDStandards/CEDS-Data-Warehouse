CREATE TABLE [RDS].[FactK12StaffCourseSections]
(
	[FactK12StaffCourseSectionId] BIGINT IDENTITY (1, 1) NOT NULL,
	[SchoolYearId] int NOT NULL DEFAULT -1,
	[SeaId] int NOT NULL DEFAULT -1,
	[IeuId] int NOT NULL DEFAULT -1,
	[LeaId] int NOT NULL DEFAULT -1,
	[LeaInstructionId] int NOT NULL DEFAULT -1,
	[K12SchoolId] int NOT NULL DEFAULT -1,
	[K12SchoolInstructionId] int NOT NULL DEFAULT -1,
	[CipCodeId] int NOT NULL DEFAULT -1,
	[CourseApplicableEducationLevelId] int NOT NULL DEFAULT -1,
	[K12CourseStatusId] int NOT NULL DEFAULT -1,
	[StateK12CourseId] int NOT NULL DEFAULT -1,
	[LeaK12CourseId] int NOT NULL DEFAULT -1,
	[K12CourseSectionId] int NOT NULL DEFAULT -1,
	[ClassBeginningTimeId] int NOT NULL DEFAULT -1,
	[ClassEndingTimeId]	int NOT NULL DEFAULT -1,
	[K12EmploymentStatusId] int NOT NULL DEFAULT -1,
	[K12JobId] int NOT NULL DEFAULT -1,
	[K12JobPositionId] int NOT NULL DEFAULT -1,
	[K12StaffAssignmentStatusId] int NOT NULL DEFAULT -1,
	[K12StaffAssignmentStartDateId] int NOT NULL DEFAULT -1,
	[K12StaffAssignmentEndDateId] int NOT NULL DEFAULT -1,
	[K12StaffCategoryId] int NOT NULL DEFAULT -1,
	[K12StaffMemberId] bigint NOT NULL DEFAULT -1,
	[K12StaffStatusId] int NOT NULL DEFAULT -1,
	[ScedCodeId] int NOT NULL DEFAULT -1,
	[K12StaffMemberCount] int NOT NULL DEFAULT 1,
	[K12StudentCount] int NOT NULL DEFAULT 0,
	[CalendarSessionId] int NOT NULL DEFAULT -1,
	[CountDateId] int NULL,
	[EmployerId] int NULL,
	[K12CourseSectionStatusId] int NULL,
	[InstructionLanguageId] int NULL,
	[K12DemographicId] int NULL,
	[DataCollectionId] int NULL,
	[SeaJobClassificationId] int NULL,
	[LeaJobClassificationId] int NULL,
	[AvailableCarnegieUnitCredit] decimal(9,2) NULL,
	[InstructionalMinutes] int NULL,
	[RecordStatusId] int NOT NULL DEFAULT -1,
	[RecordStartDateTime] DATETIME NULL,
	[RecordEndDateTime] DATETIME NULL,
	CONSTRAINT [PK_FactK12StaffCourseSections] PRIMARY KEY CLUSTERED ([FactK12StaffCourseSectionId] ASC),
	CONSTRAINT [FK_FactK12StaffCourseSections_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_CourseApplicableEducationLevelId] FOREIGN KEY ([CourseApplicableEducationLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_InstructionLanguageId] FOREIGN KEY ([InstructionLanguageId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_StateK12CourseId] FOREIGN KEY ([StateK12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_LeaK12CourseId] FOREIGN KEY ([LeaK12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_ClassBeginningTimeId] FOREIGN KEY ([ClassBeginningTimeId]) REFERENCES [RDS].[DimTimes] ([DimTimeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_ClassEndingTimeId] FOREIGN KEY ([ClassEndingTimeId]) REFERENCES [RDS].[DimTimes] ([DimTimeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12CourseSectionStatusId] FOREIGN KEY ([K12CourseSectionStatusId]) REFERENCES [RDS].[DimK12CourseSectionStatuses] ([DimK12CourseSectionStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12CourseStatusId] FOREIGN KEY ([K12CourseStatusId]) REFERENCES [RDS].[DimK12CourseStatuses] ([DimK12CourseStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12JobPositionId]	FOREIGN KEY ([K12JobPositionId]) REFERENCES [RDS].[DimK12JobPositions] ([DimK12JobPositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12SchoolInstructionId] FOREIGN KEY ([K12SchoolInstructionId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffMemberId] FOREIGN KEY ([K12StaffMemberId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_LeaInstructionId] FOREIGN KEY ([LeaInstructionId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_CalendarSessionId] FOREIGN KEY ([CalendarSessionId]) REFERENCES [RDS].[DimCalendarSessions] ([DimCalendarSessionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_ScedCodeId] FOREIGN KEY ([ScedCodeId]) REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StffCourseSections_K12StaffAssignmentStartDateId] FOREIGN KEY ([K12StaffAssignmentStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StffCourseSections_K12StaffAssignmentEndDateId] FOREIGN KEY ([K12StaffAssignmentEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StffCourseSections_K12StaffAssignmentStatusId] FOREIGN KEY ([K12StaffAssignmentStatusId]) REFERENCES [RDS].[DimK12StaffAssignmentStatuses] ([DimK12StaffAssignmentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12CourseSections_K12CourseSectionId] FOREIGN KEY ([K12CourseSectionId]) REFERENCES [RDS].[DimK12CourseSections] ([DimK12CourseSectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCourseSections_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]) ON DELETE No Action ON UPDATE No Action
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

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_StateK12CourseId] 
 ON [RDS].[FactK12StaffCourseSections] ([StateK12CourseId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_LeaK12CourseId] 
 ON [RDS].[FactK12StaffCourseSections] ([LeaK12CourseId] ASC)
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

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12JobPositions] 
 ON [RDS].[FactK12StaffCourseSections] ([K12JobPositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimK12Schools] 
 ON [RDS].[FactK12StaffCourseSections] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_K12SchoolInstructionId] 
 ON [RDS].[FactK12StaffCourseSections] ([K12SchoolInstructionId] ASC)
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

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_LeaInstructionId] 
 ON [RDS].[FactK12StaffCourseSections] ([LeaInstructionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_DimCalendarSessions] 
 ON [RDS].[FactK12StaffCourseSections] ([CalendarSessionId] ASC)
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

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_K12StaffAssignmentStartDateId] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffAssignmentStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_K12StaffAssignmentEndDateId] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffAssignmentEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_K12StaffAssignmentStatusId] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffAssignmentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_K12CourseSectionId] 
 ON [RDS].[FactK12StaffCourseSections] ([K12CourseSectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactK12StaffCourseSections_K12StaffMemberId] 
 ON [RDS].[FactK12StaffCourseSections] ([K12StaffMemberId] ASC)
GO




EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the time of day the class begins.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Class Beginning Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000519' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000519' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassBeginningTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the time of day the class ends.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Class Ending Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000520' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000520' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'ClassEndingTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'AvailableCarnegieUnitCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Measured in Carnegie units, the amount of credit available to a student who successfully meets the objectives of the course. A course meeting every day for one period of the school day over the span of a school year offers one Carnegie unit. A Carnegie unit is thus a measure of "seat time" rather than a measure of attainment of the course objectives.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'AvailableCarnegieUnitCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Available Carnegie Unit Credit' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'AvailableCarnegieUnitCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000030' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'AvailableCarnegieUnitCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000030' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'AvailableCarnegieUnitCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'LeaInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of responsibility the district has for the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'LeaInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible District Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'LeaInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatendateOptionCode', @value=N'Instruction' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'LeaInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000594' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'LeaInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000594' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'LeaInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12SchoolInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12SchoolInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12SchoolInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatendatedOptionCode', @value=N'Instruction' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12SchoolInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12SchoolInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12SchoolInstructionId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day from which the assignment is valid.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assignment Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000526' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000526' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day on which the assignment is valid.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assignment End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'K12StaffAssignmentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of instruction minutes in a given session, as determined by time in class, time on task (e.g., engaged in a class), or as estimated by a qualified course designer.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'AssigInstructional Minutes' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000499' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000499' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'InstructionalMinutes';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCourseSections', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO


