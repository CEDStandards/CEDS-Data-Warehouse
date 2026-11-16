CREATE TABLE [RDS].[BridgeDirectoryActivities]
(
	[BridgeDirectoryActivitiesId] int NOT NULL IDENTITY (1, 1),
	[FactDirectoryId] int NULL,
	[ActivityId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryActivities] 
 ADD CONSTRAINT [PK_BridgeDirectoryActivities]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryActivitiesId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryActivities_DimActivities] 
 ON [RDS].[BridgeDirectoryActivities] ([ActivityId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryActivities_FactDirectory] 
 ON [RDS].[BridgeDirectoryActivities] ([FactDirectoryId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryActivities] ADD CONSTRAINT [FK_BridgeDirectoryActivities_ActivityId]
	FOREIGN KEY ([ActivityId]) REFERENCES [RDS].[DimActivities] ([DimActivityId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryActivities] ADD CONSTRAINT [FK_BridgeDirectoryActivities_FactDirectory]
	FOREIGN KEY ([FactDirectoryId]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO