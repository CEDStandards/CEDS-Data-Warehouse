CREATE TABLE [RDS].[BridgeDirectoryOrganizationRelationships]
(
	[BridgeDirectoryOrganizationRelationshipId] int NOT NULL IDENTITY (1, 1),
	[SubjectOrganization] int NULL,
	[ObjectOrganization] int NULL,
	[RelationshipTypeCode] nvarchar(50) NOT NULL,
	[RelationshipTypeDescription] nvarchar(300) NOT NULL,
	[RecordStartDateTime] datetime NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[RecordEndDateTime] datetime NULL	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryOrganizationRelationships] 
 ADD CONSTRAINT [PK_BridgeDirectoryOrganizationRelationships]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryOrganizationRelationshipId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryOrganizationRelationships_FactDirectory] 
 ON [RDS].[BridgeDirectoryOrganizationRelationships] ([SubjectOrganization] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryOrganizationRelationships_FactDirectory_02] 
 ON [RDS].[BridgeDirectoryOrganizationRelationships] ([ObjectOrganization] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryOrganizationRelationships] ADD CONSTRAINT [FK_BridgeDirectoryOrganizationRelationships_ObjectOrganizationId]
	FOREIGN KEY ([ObjectOrganization]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryOrganizationRelationships] ADD CONSTRAINT [FK_BridgeDirectoryOrganizationRelationships_SubjectOrganization]
	FOREIGN KEY ([SubjectOrganization]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO

/* Create Table Comments */

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [BridgeDirectoryOrganizationRelationships], 'column', [RecordStartDateTime]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [BridgeDirectoryOrganizationRelationships], 'column', [RecordEndDateTime]
GO