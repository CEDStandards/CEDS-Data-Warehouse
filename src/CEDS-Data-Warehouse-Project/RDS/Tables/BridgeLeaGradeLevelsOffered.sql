CREATE TABLE [RDS].[BridgeLeaGradeLevelsOffered]
(
	[BridgeLeaGradeLevelId] int NOT NULL IDENTITY (1, 1),
	[LeaId] int NOT NULL DEFAULT -1,
	[GradeLevelOfferedId] int NOT NULL DEFAULT -1
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeLeaGradeLevelsOffered] 
 ADD CONSTRAINT [PK_BridgeLeaGradeLevelsOffered]
	PRIMARY KEY CLUSTERED ([BridgeLeaGradeLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeLeaGradeLevelsOffered_GradeLevelId] 
 ON [RDS].[BridgeLeaGradeLevelsOffered] ([GradeLevelOfferedId] ASC) 
 WITH FILLFACTOR = 80
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeLeaGradeLevelsOffered_LeaId] 
 ON [RDS].[BridgeLeaGradeLevelsOffered] ([LeaId] ASC) 
 WITH FILLFACTOR = 80
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeLeaGradeLevelsOffered] ADD CONSTRAINT [FK_BridgeLeaGradeLevelsOffered_GradeLevelId]
	FOREIGN KEY ([GradeLevelOfferedId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeLeaGradeLevelsOffered] ADD CONSTRAINT [FK_BridgeLeaGradeLevelsOffered_LeaId]
	FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaId]) ON DELETE No Action ON UPDATE No Action
GO