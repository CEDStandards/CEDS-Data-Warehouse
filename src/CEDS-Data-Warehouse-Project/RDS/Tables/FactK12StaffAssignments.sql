CREATE TABLE [RDS].[FactK12StaffAssignments]
(
	[FactK12StaffAssignmentId] int NOT NULL IDENTITY (1, 1),
	[LeaId] int NOT NULL,
	[SchoolYearId] int NOT NULL,
	[K12SchoolId] int NOT NULL,
	[K12StaffStatusId] int NOT NULL,
	[K12StaffCategoryId] int NOT NULL,
	[SeaId] int NOT NULL,
	[K12StaffId] bigint NOT NULL,
	[K12Staff_CurrentId] bigint CONSTRAINT [DF_FactK12StaffAssignments_K12Staff_CurrentId] DEFAULT ((-1)) NOT NULL,
	[IeuId] int NOT NULL,
	[LeaEmployerId] int NOT NULL,
	[IeuEmployerId] int NOT NULL,
	[ScedCodeId] int NOT NULL,
	[OnetSocOccupationTypeId] int NOT NULL,
	[K12EmploymentStatusId] int NOT NULL,
	[K12PositionId] int NOT NULL,
	[K12JobId] int NOT NULL,
	[AssignmentStartDateId] int NOT NULL,
	[AssignmentEndDateId] int NOT NULL,
	[EmploymentStartDateId] int NOT NULL,
	[EmploymentEndDateId] int NOT NULL,
	[HireDateId] int NOT NULL,
	[InstructionLanguageId] int NOT NULL,
	[K12StaffAssignmentStatusId] int NOT NULL,
	[K12DemographicId] int NULL,
	[EmployerId] int NULL,
	[DataCollectionId] int NULL,
	[LeaJobClassificationId] int NULL,
	[SeaJobClassificationId] int NULL,
	[FullTimeEquivalency] decimal(3,2) NOT NULL,
	[K12StaffAssignmentCount] int NOT NULL,
	CONSTRAINT [PK_FactK12StaffAssignments] PRIMARY KEY CLUSTERED ([FactK12StaffAssignmentId] ASC),
	CONSTRAINT [FK_FactK12StaffAssignments_AssignmentEndDateId] FOREIGN KEY ([AssignmentEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_AssignmentStartDateId] FOREIGN KEY ([AssignmentStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_DimOnetSocOccupationTypes] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_DimScedCodes] FOREIGN KEY ([ScedCodeId]) REFERENCES [RDS].[DimScedCodes] ([DimScedCodeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_EmploymentEndDateId] FOREIGN KEY ([EmploymentEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_EmploymentStartDateId] FOREIGN KEY ([EmploymentStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_HireDateId] FOREIGN KEY ([HireDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_InstructionLanguageId] FOREIGN KEY ([InstructionLanguageId]) REFERENCES [RDS].[DimLanguages] ([DimLanguageId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12PositionId] FOREIGN KEY ([K12PositionId]) REFERENCES [RDS].[DimK12JobPositions] ([DimK12JobPositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12StaffAssignmentStatusId] FOREIGN KEY ([K12StaffAssignmentStatusId]) REFERENCES [RDS].[DimK12StaffAssignmentStatuses] ([DimK12StaffAssignmentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_Ieus] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12StaffId] FOREIGN KEY ([K12StaffId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_IeuEmployerId] FOREIGN KEY ([IeuEmployerId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffAssignments_LeaEmployerId] FOREIGN KEY ([LeaEmployerId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_DataCollectionId] 
 ON [RDS].[FactK12StaffAssignments] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_AssignmentStartDateId] 
 ON [RDS].[FactK12StaffAssignments] ([AssignmentStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_AssignmentEndDateId] 
 ON [RDS].[FactK12StaffAssignments] ([AssignmentEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_EmploymentStartDateId] 
 ON [RDS].[FactK12StaffAssignments] ([EmploymentStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_EmploymentEndDateId] 
 ON [RDS].[FactK12StaffAssignments] ([EmploymentEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_HireDateId] 
 ON [RDS].[FactK12StaffAssignments] ([HireDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_EmployerId] 
 ON [RDS].[FactK12StaffAssignments] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12DemographicId] 
 ON [RDS].[FactK12StaffAssignments] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12EmploymentStatusId] 
 ON [RDS].[FactK12StaffAssignments] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12JobId] 
 ON [RDS].[FactK12StaffAssignments] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12PositionId] 
 ON [RDS].[FactK12StaffAssignments] ([K12PositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12StaffAssignmentStatusId] 
 ON [RDS].[FactK12StaffAssignments] ([K12StaffAssignmentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_InstructionLanguageId] 
 ON [RDS].[FactK12StaffAssignments] ([InstructionLanguageId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_LeaJobClassificationId] 
 ON [RDS].[FactK12StaffAssignments] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_OnetSocOccupationTypeId] 
 ON [RDS].[FactK12StaffAssignments] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_ScedCodeId] 
 ON [RDS].[FactK12StaffAssignments] ([ScedCodeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_SeaJobClassificationId] 
 ON [RDS].[FactK12StaffAssignments] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_IeuId] 
 ON [RDS].[FactK12StaffAssignments] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_IeuEmployerId] 
 ON [RDS].[FactK12StaffAssignments] ([IeuEmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_LeaEmployerId] 
 ON [RDS].[FactK12StaffAssignments] ([LeaEmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12SchoolId] 
 ON [RDS].[FactK12StaffAssignments] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12StaffCategoryId] 
 ON [RDS].[FactK12StaffAssignments] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12StaffStatusId] 
 ON [RDS].[FactK12StaffAssignments] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12StaffId] 
 ON [RDS].[FactK12StaffAssignments] ([K12StaffId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12Staff_CurrentId] 
 ON [RDS].[FactK12StaffAssignments] ([K12Staff_CurrentId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_SchoolYearId] 
 ON [RDS].[FactK12StaffAssignments] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_SeaId] 
 ON [RDS].[FactK12StaffAssignments] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_LeaId] 
 ON [RDS].[FactK12StaffAssignments] ([LeaId] ASC)
GO

