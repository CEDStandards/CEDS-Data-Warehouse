CREATE TABLE [RDS].[DimFacilitySpaceStatuses]
(
	[DimFacilitySpaceStatusId] int NOT NULL IDENTITY (1, 1),
	[FacilitySpaceUseTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[FacilitySpaceUseTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING'
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilitySpaceStatuses] 
 ADD CONSTRAINT [PK_DimFacilitySpaceStatuses]
	PRIMARY KEY CLUSTERED ([DimFacilitySpaceStatusId] ASC)
GO