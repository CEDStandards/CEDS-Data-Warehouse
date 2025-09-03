CREATE TABLE [RDS].[BridgeDirectoryContacts]
(
	[BridgeDirectoryContactId] int NOT NULL IDENTITY (1, 1),
	[FactDirectoryId] int NULL,
	[ContactId] int NULL,
	[PrimaryContactIndicatorCode] nvarchar(50) NULL,
	[PrimaryContactIndicatorDescription] nvarchar(200) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryContacts] 
 ADD CONSTRAINT [PK_BridgeDirectoryContacts]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryContactId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryContacts] ADD CONSTRAINT [FK_BridgeDirectoryContacts_ContactId]
	FOREIGN KEY ([ContactId]) REFERENCES [RDS].[DimContacts] ([DimContactId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryContacts] ADD CONSTRAINT [FK_BridgeDirectoryContacts_FactDirectoryId]
	FOREIGN KEY ([FactDirectoryId]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO