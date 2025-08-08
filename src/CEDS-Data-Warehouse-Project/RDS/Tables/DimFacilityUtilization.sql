CREATE TABLE [RDS].[DimFacilityUtilization]
(
	[DimFacilityUtilizationStatusId] int NOT NULL IDENTITY (1, 1),
	[BuildingUseTypeCode] nvarchar(50) NOT NULL,
	[BuildingUseTypeDescription] nvarchar(300) NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilityUtilization] 
 ADD CONSTRAINT [PK_DimFacilityUtilization]
	PRIMARY KEY CLUSTERED ([DimFacilityUtilizationStatusId] ASC)
GO