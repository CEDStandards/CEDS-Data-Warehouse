CREATE TABLE [RDS].[FactK12StaffEmployments]
(
	[FactK12StaffEmploymentId] int NOT NULL IDENTITY (1, 1),

	[SchoolYearId] int NOT NULL,
	[CountDateId] int NOT NULL,
	[RecordStartDateTime] datetime NOT NULL,
	[RecordEndDateTime] datetime NOT NULL,
	[K12StaffStatusId] int NOT NULL,
	[SeaId] int NOT NULL,
	[IeuId] int NOT NULL,
	[LeaID] int NOT NULL,
	[EmployerId] int NULL,
	[K12StaffId] bigint NOT NULL,
	[OnetSocOccupationTypeId] int NOT NULL,
	[StandardOccupationalClassificationId] int NOT NULL,
	[K12StaffCategoryId] int NOT NULL,
	[YearsOfPriorTeachingExperience] decimal(3,2) NOT NULL,
	[YearsOfPriorProfessionalExperience] decimal(3,2) NOT NULL,
	[YearsOfTotalExperience] decimal(3,2) NOT NULL,
	[YearsofPriorAdultEducationTeachingExperience] decimal(3,2) NOT NULL,
	[K12EmploymentStatusId] int NOT NULL,
	[K12JobPositionId] int NOT NULL,
	[K12JobId] int NOT NULL,
	[LeaJobClassificationId] int NULL,
	[SeaJobClassificationId] int NULL,
	[FullTimeEquivalency] decimal(3,2) NULL,
	[EmploymentStartDateId] int NOT NULL,
	[EmploymentEndDateId] int NOT NULL,
	[HireDateId] int NOT NULL,
	[K12DemographicId] int NULL,
	[ContractDaysOfServicePerYear] decimal(3,2) NOT NULL,
	[DataCollectionId] int NULL,
	[RecordStatusId] int NOT NULL,

	CONSTRAINT [PK_FactK12StaffEmployments] PRIMARY KEY CLUSTERED ([FactK12StaffEmploymentId] ASC),
	CONSTRAINT [FK_FactK12StaffEmployments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_LeaID] FOREIGN KEY ([LeaID]) REFERENCES [RDS].[DimLeas] ([DimLeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12StaffId] FOREIGN KEY ([K12StaffId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_OnetSocOccupationTypeId] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_StandardOccupationalClassificationId] FOREIGN KEY ([StandardOccupationalClassificationId]) REFERENCES [RDS].[DimStandardOccupationalClassifications] ([DimStandardOccupationalClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12JobPositionId] FOREIGN KEY ([K12JobPositionId]) REFERENCES [RDS].[DimK12JobPositions] ([DimK12JobPositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_EmploymentStartDateId] FOREIGN KEY ([EmploymentStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_EmploymentEndDateId] FOREIGN KEY ([EmploymentEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_HireDateId] FOREIGN KEY ([HireDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEmployments_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]) ON DELETE No Action ON UPDATE No Action

)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_SchoolYearId] 
 ON [RDS].[FactK12StaffEmployments] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_CountDateId] 
 ON [RDS].[FactK12StaffEmployments] ([CountDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12StaffStatusId] 
 ON [RDS].[FactK12StaffEmployments] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_SeaId] 
 ON [RDS].[FactK12StaffEmployments] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_IeuId] 
 ON [RDS].[FactK12StaffEmployments] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_LeaID] 
 ON [RDS].[FactK12StaffEmployments] ([LeaID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_EmployerId] 
 ON [RDS].[FactK12StaffEmployments] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12StaffId] 
 ON [RDS].[FactK12StaffEmployments] ([K12StaffId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_OnetSocOccupationTypeId] 
 ON [RDS].[FactK12StaffEmployments] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_StandardOccupationalClassificationId] 
 ON [RDS].[FactK12StaffEmployments] ([StandardOccupationalClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12StaffCategoryId] 
 ON [RDS].[FactK12StaffEmployments] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12EmploymentStatusId] 
 ON [RDS].[FactK12StaffEmployments] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12JobPositionId] 
 ON [RDS].[FactK12StaffEmployments] ([K12JobPositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12JobId] 
 ON [RDS].[FactK12StaffEmployments] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_LeaJobClassificationId] 
 ON [RDS].[FactK12StaffEmployments] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_SeaJobClassificationId] 
 ON [RDS].[FactK12StaffEmployments] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_EmploymentStartDateId] 
 ON [RDS].[FactK12StaffEmployments] ([EmploymentStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_EmploymentEndDateId] 
 ON [RDS].[FactK12StaffEmployments] ([EmploymentEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_HireDateId] 
 ON [RDS].[FactK12StaffEmployments] ([HireDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12DemographicId] 
 ON [RDS].[FactK12StaffEmployments] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_DataCollectionId] 
 ON [RDS].[FactK12StaffEmployments] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_RecordStatusId] 
 ON [RDS].[FactK12StaffEmployments] ([RecordStatusId] ASC)
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'ContractDaysOfServicePerYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of days per year that a person is expected to work as outlined specifically in his or her employment agreement.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'ContractDaysOfServicePerYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Contract Days of Service Per Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'ContractDaysOfServicePerYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000047' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'ContractDaysOfServicePerYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000047' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'ContractDaysOfServicePerYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time a person is enrolled, employed, involved, or participates in the organization, divided by the time the organization defines as full-time for that role.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorProfessionalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of years that an individual has previously held a similar professional position in one or more education institutions prior to the current school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorProfessionalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Years of Prior Professional Experience' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorProfessionalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002061' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorProfessionalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002061' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorProfessionalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorTeachingExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of years prior to this job that a person has previously held a teaching position in one or more education institutions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorTeachingExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Years of Prior Teaching Experience' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorTeachingExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000302' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorTeachingExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000302' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfPriorTeachingExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfTotalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of years that a person has held this position or a similar position in one or more organizations.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfTotalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Years of Total Experience' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfTotalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002060' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfTotalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002060' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'YearsOfTotalExperience';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person began self-employment or employment with an organization or institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person ended self-employment or employment with an organization or institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000795' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000795' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO