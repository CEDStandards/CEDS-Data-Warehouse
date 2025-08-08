CREATE TABLE [RDS].[BridgeDirectoryOrganizationAddresses]
(
	[BridgeDirectoryAddressId] int NOT NULL IDENTITY (1, 1),
	[FactDirectoryId] int NULL,
	[OrganizationAddressId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryOrganizationAddresses] 
 ADD CONSTRAINT [PK_BridgeDirectoryAddresses]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryAddressId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryOrganizationAddresses_FactDirectory] 
 ON [RDS].[BridgeDirectoryOrganizationAddresses] ([FactDirectoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryOrganizationAddresses_OrganizationAddresseId] 
 ON [RDS].[BridgeDirectoryOrganizationAddresses] ([OrganizationAddressId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryOrganizationAddresses] ADD CONSTRAINT [FK_BridgeDirectoryOrganizationAddresses_FactDirectory]
	FOREIGN KEY ([FactDirectoryId]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryOrganizationAddresses] ADD CONSTRAINT [FK_BridgeDirectoryOrganizationAddresses_OrganizationAddressId]
	FOREIGN KEY ([OrganizationAddressId]) REFERENCES [RDS].[DimOrganizationAddresses] ([DimOrganizationAddressId]) ON DELETE No Action ON UPDATE No Action
GO