CREATE TABLE [RDS].[BridgeDirectoryStudentSupportServiceTypes]
(
	[BridgeDirectoryStudentSupportServiceTypeId] int NOT NULL IDENTITY (1, 1),
	[FactDirectoryId] int NULL,
	[StudentSupportServiceTypeId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryStudentSupportServiceTypes] 
 ADD CONSTRAINT [PK_BridgeDirectoryStudentSupportServiceTypes]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryStudentSupportServiceTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryStudentSupportServiceTypes_DimStudentSupportServiceTypes] 
 ON [RDS].[BridgeDirectoryStudentSupportServiceTypes] ([StudentSupportServiceTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryStudentSupportServiceTypes_FactDirectory] 
 ON [RDS].[BridgeDirectoryStudentSupportServiceTypes] ([FactDirectoryId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryStudentSupportServiceTypes] ADD CONSTRAINT [FK_BridgeDirectoryStudentSupportServiceTypes_FactDirectory]
	FOREIGN KEY ([FactDirectoryId]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryStudentSupportServiceTypes] ADD CONSTRAINT [FK_BridgeDirectoryStudentSupportServiceTypes_StudentSupportServiceTypeId]
	FOREIGN KEY ([StudentSupportServiceTypeId]) REFERENCES [RDS].[DimStudentSupportServiceTypes] ([DimStudentSupportServiceTypeId]) ON DELETE No Action ON UPDATE No Action
GO