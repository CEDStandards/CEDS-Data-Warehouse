CREATE TABLE [RDS].[BridgeK12SchoolGradeLevelsOffered]
(
	[BridgeK12SchoolGradeLevelId] int NOT NULL IDENTITY (1, 1),
	[K12SchoolId] int NOT NULL,
	[GradeLevelId] int NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeK12SchoolGradeLevelsOffered] 
 ADD CONSTRAINT [PK_BridgeK12SchoolGradeLevelsOffered]
	PRIMARY KEY CLUSTERED ([BridgeK12SchoolGradeLevelId] ASC) WITH FILLFACTOR = 80
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevelsOffered_DimK12Schools] 
 ON [RDS].[BridgeK12SchoolGradeLevelsOffered] ([K12SchoolId] ASC) 
 WITH FILLFACTOR = 80
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevelsOffered_GradeLevelId] 
 ON [RDS].[BridgeK12SchoolGradeLevelsOffered] ([GradeLevelId] ASC) 
 WITH FILLFACTOR = 80
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeK12SchoolGradeLevelsOffered] ADD CONSTRAINT [FK_BridgeK12SchoolGradeLevelsOffered_GradeLevelId]
	FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeK12SchoolGradeLevelsOffered] ADD CONSTRAINT [FK_BridgeK12SchoolGradeLevelsOffered_K12SchoolId]
	FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action
GO