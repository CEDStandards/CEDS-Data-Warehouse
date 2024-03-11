CREATE TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions]
(
	[FactK12StaffProfessionalDevelopmentSessionId] int NOT NULL IDENTITY (1, 1),
	[SchoolYearId] int NOT NULL,
	[K12StaffId] bigint NOT NULL,
	[K12StaffStatusId] int NOT NULL,
	[K12EmploymentStatusId] int NOT NULL,
	[K12StaffAssignmentStatusId] int NOT NULL,
	[K12StaffCategoryId] int NOT NULL,
	[SeaId] int NOT NULL,
	[K12PositionId] int NOT NULL,
	[K12JobId] int NOT NULL,
	[ProfessionalDevelopmentActivityId] int NOT NULL,
	[LeaId] int NOT NULL,
	[K12SchoolId] int NOT NULL,
	[ProfessionalDevelopmentActivityCredits] decimal(5,2) NULL,
	[IeuId] int NULL,
	[SeaJobClassificationId] int NULL,
	[LeaJobClassificationId] int NULL,
	[DataCollectionId] int NULL,
	[EmployerId] int NULL,
	[K12DemographicId] int NULL,
	[ProfessionalDevelopmentSessionStartDate] int NULL,
	[ProfessionalDevelopmentSessionEndDate] int NULL
	CONSTRAINT [PK_FactK12StaffProfessionalDevelopmentSessionId] PRIMARY KEY CLUSTERED ([FactK12StaffProfessionalDevelopmentSessionId] ASC)
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12EmploymentStatusId] FOREIGN KEY ([K12EmploymentStatusId]) REFERENCES [RDS].[DimK12EmploymentStatuses] ([DimK12EmploymentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12JobId] FOREIGN KEY ([K12JobId]) REFERENCES [RDS].[DimK12Jobs] ([DimK12JobId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12PositionId] FOREIGN KEY ([K12PositionId]) REFERENCES [RDS].[DimK12Positions] ([DimK12PositionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12StaffAssignmentStatusId] FOREIGN KEY ([K12StaffAssignmentStatusId]) REFERENCES [RDS].[DimK12StaffAssignmentStatuses] ([DimK12StaffAssignmentStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12StaffCategoryId] FOREIGN KEY ([K12StaffCategoryId]) REFERENCES [RDS].[DimK12StaffCategories] ([DimK12StaffCategoryId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12StaffId] FOREIGN KEY ([K12StaffId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12StaffStatusId] FOREIGN KEY ([K12StaffStatusId]) REFERENCES [RDS].[DimK12StaffStatuses] ([DimK12StaffStatusId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_LeaJobClassificationId] FOREIGN KEY ([LeaJobClassificationId]) REFERENCES [RDS].[DimLeaJobClassifications] ([DimLeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_ProfessionalDevelopmentActivityId] FOREIGN KEY ([ProfessionalDevelopmentActivityId]) REFERENCES [RDS].[DimProfessionalDevelopmentActivities] ([DimProfessionalDevelopmentActivityId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_ProfessionalDevelopmentSessionEndDate] FOREIGN KEY ([ProfessionalDevelopmentSessionEndDate]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_ProfessionalDevelopmentSessionStartDate] FOREIGN KEY ([ProfessionalDevelopmentSessionStartDate]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_SeaJobClassificationId] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentActivities_ProfessionalDevelopmentActivityId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([ProfessionalDevelopmentActivityId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimDataCollections] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimDates] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([ProfessionalDevelopmentSessionStartDate] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimDates_02] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([ProfessionalDevelopmentSessionEndDate] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimEmployers] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimIeus] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimK12Demographics] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12DemographicId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimK12Schools] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimLeaJobClassifications] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([LeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimLeas] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([LeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_DimSeaJobClassifications] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([SeaJobClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12EmploymentStatusId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12EmploymentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12JobId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12JobId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12PositionId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12PositionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12StaffAssignmentStatusId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12StaffAssignmentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12StaffCategoryId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12StaffCategoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12StaffId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12StaffId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12StaffStatusId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([K12StaffStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_SchoolYearId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_SeaId] 
 ON [RDS].[FactK12StaffProfessionalDevelopmentSessions] ([SeaId] ASC)
GO