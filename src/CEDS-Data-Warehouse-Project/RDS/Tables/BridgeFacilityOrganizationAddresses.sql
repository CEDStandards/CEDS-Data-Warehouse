CREATE TABLE [RDS].[BridgeFacilityOrganizationAddresses]
(
	[BridgeFacilityOrganizationAddressId] int NOT NULL IDENTITY (1, 1),
	[FacilityId] int NULL,
	[OrganizationAddressId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeFacilityOrganizationAddresses] 
 ADD CONSTRAINT [PK_BridgeFacilityOrganizationAddresses]
	PRIMARY KEY CLUSTERED ([BridgeFacilityOrganizationAddressId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeFacilityOrganizationAddresses] ADD CONSTRAINT [FK_BridgeFacilityOrganizationAddresses_FacilityId]
	FOREIGN KEY ([FacilityId]) REFERENCES [RDS].[FactFacilities] ([FactFacilityId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeFacilityOrganizationAddresses] ADD CONSTRAINT [FK_BridgeFacilityOrganizationAddresses_OrganizationAddressId]
	FOREIGN KEY ([OrganizationAddressId]) REFERENCES [RDS].[DimOrganizationAddresses] ([DimOrganizationAddressId]) ON DELETE No Action ON UPDATE No Action
GO