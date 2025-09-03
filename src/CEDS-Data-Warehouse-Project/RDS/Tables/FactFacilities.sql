CREATE TABLE [RDS].[FactFacilities]
(
	[FactFacilityId] int NOT NULL IDENTITY (1, 1),
	[FacilityUtilizationStatusId] int NULL,
	[OrganizationId] int NULL,
	[CountDateId] int NULL,
	[SchoolYearId] int NULL,
	[FacilityId] int NULL,
	[FacilitySpaceStatusId] int NULL,
	[FacilityStatusId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[FactFacilities] 
 ADD CONSTRAINT [PK_FactFacilities]
	PRIMARY KEY CLUSTERED ([FactFacilityId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactFacilities_DimFacilityStatuses] 
 ON [RDS].[FactFacilities] ([FacilityStatusId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_CountDateId]
	FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_FacilityId]
	FOREIGN KEY ([FacilityId]) REFERENCES [RDS].[DimFacilities] ([DimFacilityId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_FacilitySpaceStatusId]
	FOREIGN KEY ([FacilitySpaceStatusId]) REFERENCES [RDS].[DimFacilitySpaceStatuses] ([DimFacilitySpaceStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_FacilityStatusId]
	FOREIGN KEY ([FacilityStatusId]) REFERENCES [RDS].[DimFacilityStatuses] ([DimFacilityStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_FacilityUtilizationStatusId]
	FOREIGN KEY ([FacilityUtilizationStatusId]) REFERENCES [RDS].[DimFacilityUtilization] ([DimFacilityUtilizationStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_OrganizationId]
	FOREIGN KEY ([OrganizationId]) REFERENCES [RDS].[DimOrganizations] ([DimOrganizationId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactFacilities] ADD CONSTRAINT [FK_FactFacilities_SchoolYearId]
	FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action
GO