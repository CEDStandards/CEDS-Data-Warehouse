CREATE TABLE [RDS].[FactK12StaffEvaluationParts]
(
	[FactK12StaffEvaluationPartId] int NOT NULL IDENTITY (1, 1),
	[SeaId] int NULL,
	[LeaId] int NULL,
	[K12SchoolId] int NULL,
	[SchoolYearId] int NULL,
	[K12StaffCategoryId] int NULL,
	[K12StaffStatusId] int NULL,
	[K12EmploymentStatusId] int NULL,
	[IeuId] int NULL,
	[EmployerId] int NULL,
	[K12StaffId] bigint NULL,
	[K12JobId] int NULL,
	[K12PositionId] int NULL,
	[K12DemographicId] int NULL,
	[StaffEvaluationOutcome] nvarchar(80) NULL,
	[StaffEvaluationPartScale] nvarchar(80) NULL,
	[StaffEvaluationPartScoreOrRating] nvarchar(60) NULL,
	[StaffEvaluationScale] nvarchar(80) NULL,
	[StaffEvaluationScoreOrRating] nvarchar(60) NULL,
	[StaffEvaluationPartStatusId] int NULL,
	[OnetSocOccupationTypeId] int NULL,
	[DataCollectionId] int NULL,
	[SeaJobClassificationId] int NULL,
	[LeaJobClassificationId] int NULL,
	CONSTRAINT [PK_FactK12StaffEvaluationParts] PRIMARY KEY CLUSTERED ([FactK12StaffEvaluationPartId] ASC),
	CONSTRAINT [FK_FactK12StaffEvaluationParts_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12StaffId] FOREIGN KEY ([K12StaffId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_OnetSocOccupationTypeId] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffEvaluationParts_StaffEvaluationPartStatusId] FOREIGN KEY ([StaffEvaluationPartStatusId]) REFERENCES [RDS].[DimStaffEvaluationPartStatuses] ([DimStaffEvaluationPartStatusId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimDataCollections] 
 ON [RDS].[FactK12StaffEvaluationParts] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimEmployers] 
 ON [RDS].[FactK12StaffEvaluationParts] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimIeus] 
 ON [RDS].[FactK12StaffEvaluationParts] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12Demographics] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12EmploymentStatuses] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12Jobs] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12Positions] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12PositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12Schools] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12StaffCategories] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimK12StaffStatuses] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimLeaJobClassifications] 
 ON [RDS].[FactK12StaffEvaluationParts] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimLeas] 
 ON [RDS].[FactK12StaffEvaluationParts] ([LeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimOnetSocOccupationTypes] 
 ON [RDS].[FactK12StaffEvaluationParts] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimPeople] 
 ON [RDS].[FactK12StaffEvaluationParts] ([K12StaffId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimSchoolYears] 
 ON [RDS].[FactK12StaffEvaluationParts] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimSeaJobClassifications] 
 ON [RDS].[FactK12StaffEvaluationParts] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimSeas] 
 ON [RDS].[FactK12StaffEvaluationParts] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_DimStaffEvaluationPartStatuses] 
 ON [RDS].[FactK12StaffEvaluationParts] ([StaffEvaluationPartStatusId] ASC)
GO