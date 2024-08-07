CREATE TABLE [RDS].[FactK12StaffCompensations]
(
	[FactK12StaffCompensationId] int NOT NULL IDENTITY (1, 1),
	[SchoolYearId] int NOT NULL,
	[CountDateId] int NOT NULL,
	[RecordStartDateTime] datetime NOT NULL,
	[RecordEndDateTime] datetime NULL,
	[K12StaffStatusId] int NOT NULL,
	[SeaId] int NOT NULL,
	[IeuId] int NOT NULL,
	[LeaID] int NOT NULL,
	[EmployerId] int NULL,
	[K12StaffId] bigint NOT NULL,
	[OnetSocOccupationTypeId] int NOT NULL,
	[StandardOccupationalClassificationId] int NOT NULL,
	[K12StaffCategoryId] int NOT NULL,
	[StaffCompensationTypeId] int NOT NULL,
	[StaffCompensation] decimal(10,2) NOT NULL,
	[StaffCompensationDescription] nvarchar(150) NULL,
	[FundingSourceAmount] decimal(10,2) NULL,
	[FundingSourcePercentage] decimal(10,2) NULL,
	[FundingSourceFinancialAccountId] int NOT NULL,
	[K12EmploymentStatusId] int NOT NULL,
	[K12JobPositionId] int NOT NULL,
	[K12JobId] int NOT NULL,
	[LeaJobClassificationId] int NOT NULL,
	[SeaJobClassificationId] int NOT NULL,
	[FullTimeEquivalency] decimal(3,2) NULL,
	[EmploymentStartDateId] int NOT NULL,
	[EmploymentEndDateId] int NOT NULL,
	[K12DemographicId] int NOT NULL,
	[DataCollectionId] int NOT NULL,
	[RecordStatusId] int NOT NULL,


	CONSTRAINT [PK_FactK12StaffCompensations] PRIMARY KEY CLUSTERED ([FactK12StaffCompensationId] ASC),
	CONSTRAINT [FK_FactK12StaffCompensations_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_LeaID] FOREIGN KEY ([LeaID]) REFERENCES [RDS].[DimLeas] ([DimLeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12StaffId] FOREIGN KEY ([K12StaffId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_OnetSocOccupationTypeId] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_StandardOccupationalClassificationId] FOREIGN KEY ([StandardOccupationalClassificationId]) REFERENCES [RDS].[DimStandardOccupationalClassifications] ([DimStandardOccupationalClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_StaffCompensationTypeId] FOREIGN KEY ([StaffCompensationTypeId]) REFERENCES [RDS].[DimStaffCompensationTypes] ([DimStaffCompensationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12JobPositionId] FOREIGN KEY ([K12JobPositionId]) REFERENCES [RDS].[DimK12JobPositions] ([DimK12JobPositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_EmploymentStartDateId] FOREIGN KEY ([EmploymentStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_EmploymentEndDateId] FOREIGN KEY ([EmploymentEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffCompensations_FundingSourceFinancialAccountId] FOREIGN KEY ([FundingSourceFinancialAccountId]) REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_DataCollectionId] 
 ON [RDS].[FactK12StaffCompensations] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_CountDateId] 
 ON [RDS].[FactK12StaffCompensations] ([CountDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_EmploymentEndDateId] 
 ON [RDS].[FactK12StaffCompensations] ([EmploymentEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_EmploymentStartDateId] 
 ON [RDS].[FactK12StaffCompensations] ([EmploymentStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_FundingSourceFinancialAccountId] 
 ON [RDS].[FactK12StaffCompensations] ([FundingSourceFinancialAccountId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12DemographicId] 
 ON [RDS].[FactK12StaffCompensations] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12EmploymentStatusId] 
 ON [RDS].[FactK12StaffCompensations] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12JobId] 
 ON [RDS].[FactK12StaffCompensations] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12JobPositionId] 
 ON [RDS].[FactK12StaffCompensations] ([K12JobPositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12StaffCategoryId] 
 ON [RDS].[FactK12StaffCompensations] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12StaffId] 
 ON [RDS].[FactK12StaffCompensations] ([K12StaffId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12StaffStatusId] 
 ON [RDS].[FactK12StaffCompensations] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_LeaID] 
 ON [RDS].[FactK12StaffCompensations] ([LeaID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_LeaJobClassificationId] 
 ON [RDS].[FactK12StaffCompensations] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_OnetSocOccupationTypeId] 
 ON [RDS].[FactK12StaffCompensations] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_RecordStatusId] 
 ON [RDS].[FactK12StaffCompensations] ([RecordStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_SeaId] 
 ON [RDS].[FactK12StaffCompensations] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_SeaJobClassificationId] 
 ON [RDS].[FactK12StaffCompensations] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_StaffCompensationTypeId] 
 ON [RDS].[FactK12StaffCompensations] ([StaffCompensationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_StandardOccupationalClassificationId] 
 ON [RDS].[FactK12StaffCompensations] ([StandardOccupationalClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactK12StaffCompensations_SchoolYearId] 
 ON [RDS].[FactK12StaffCompensations] ([SchoolYearId] ASC)
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourceAmount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of financial support contributed by a specific funding or revenue stream.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourceAmount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Funding Source Amount' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourceAmount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002059' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourceAmount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002059' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourceAmount';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourcePercentage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The proportion or percentage of financial support or resources contributed by a specific funding or revenue stream in relation to the total funding.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourcePercentage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Funding Source Percentage' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourcePercentage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002058' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourcePercentage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002058' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FundingSourcePercentage';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time a person is enrolled, employed, involved, or participates in the organization, divided by the time the organization defines as full-time for that role.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person began self-employment or employment with an organization or institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person ended self-employment or employment with an organization or institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000795' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000795' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StaffCompensations', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO





