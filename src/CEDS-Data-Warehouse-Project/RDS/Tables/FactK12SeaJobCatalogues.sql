CREATE TABLE [RDS].[FactK12SeaJobCatalogues]
(
	[FactK12SeaJobCatalogueId] int NOT NULL IDENTITY (1, 1),
	[SchoolYearId] int NOT NULL,
	[CountDateId] int NOT NULL,
	[RecordStartDateTime] datetime NOT NULL,
	[RecordEndDateTime] datetime NULL,
	[OnetSocOccupationTypeId] int NOT NULL,
	[StandardOccupationalClassificationId] int NOT NULL,
	[K12StaffCategoryId] int NOT NULL,
	[K12JobId] int NOT NULL,
	[SeaJobClassificationId] int NOT NULL,
	[DataCollectionId] int NOT NULL,
	[RecordStatusId] int NOT NULL,


	CONSTRAINT [PK_FactK12SeaJobCatalogues] PRIMARY KEY CLUSTERED ([FactK12SeaJobCatalogueId] ASC),
	CONSTRAINT [FK_FactK12SeaJobCatalogues_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_OnetSocOccupationTypeId] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_StandardOccupationalClassificationId] FOREIGN KEY ([StandardOccupationalClassificationId]) REFERENCES [RDS].[DimStandardOccupationalClassifications] ([DimStandardOccupationalClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12SeaJobCatalogues_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12SeaJobCatalogues_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]) ON DELETE No Action ON UPDATE No Action,
	
)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_DataCollectionId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_CountDateId] 
 ON [RDS].[DimDates] ([DimDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_EmploymentEndDateId] 
 ON [RDS].[DimDates] ([DimDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_EmploymentStartDateId] 
 ON [RDS].[DimDates] ([DimDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_K12JobId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_K12StaffCategoryId]
    ON [RDS].[FactK12SeaJobCatalogues] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_OnetSocOccupationTypeId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_RecordStatusId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([RecordStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_SchoolYearId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_StandardOccupationalClassificationId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([StandardOccupationalClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_SeaJobClassificationId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_RecordStartDateTime] 
 ON [RDS].[FactK12SeaJobCatalogues] ([RecordStartDateTime] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_RecordEndDateTime] 
 ON [RDS].[FactK12SeaJobCatalogues] ([RecordEndDateTime] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12SeaJobCatalogues_FactK12SeaJobCatalogueId] 
 ON [RDS].[FactK12SeaJobCatalogues] ([FactK12SeaJobCatalogueId] ASC)   
GO


