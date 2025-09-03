CREATE TABLE [RDS].[BridgeDirectoryActivities]
(
	[BridgeDirectoryActivities] int NOT NULL IDENTITY (1, 1),
	[FactDirectoryId] int NULL,
	[DimProfessionalDevelopmentActivityId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryActivities] 
 ADD CONSTRAINT [PK_BridgeDirectoryActivities]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryActivities] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryActivities_DimProfessionalDevelopmentActivities] 
 ON [RDS].[BridgeDirectoryActivities] ([DimProfessionalDevelopmentActivityId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryActivities_FactDirectory] 
 ON [RDS].[BridgeDirectoryActivities] ([FactDirectoryId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryActivities] ADD CONSTRAINT [FK_BridgeDirectoryActivities_DimProfessionalDevelopmentActivityId]
	FOREIGN KEY ([DimProfessionalDevelopmentActivityId]) REFERENCES [RDS].[DimProfessionalDevelopmentActivities] ([DimProfessionalDevelopmentActivityId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryActivities] ADD CONSTRAINT [FK_BridgeDirectoryActivities_FactDirectory]
	FOREIGN KEY ([FactDirectoryId]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO