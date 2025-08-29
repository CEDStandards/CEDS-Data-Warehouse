CREATE TABLE [RDS].[BridgeK12SchoolGradeLevelsAuthorized]
(
	[BridgeK12SchoolGradeLevelAuthorizedId] int NOT NULL IDENTITY (1, 1),
	[K12SchoolId] int NULL,
	[GradeLevelId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeK12SchoolGradeLevelsAuthorized] 
 ADD CONSTRAINT [PK_BridgeK12SchoolGradeLevelsAuthorized]
	PRIMARY KEY CLUSTERED ([BridgeK12SchoolGradeLevelAuthorizedId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevelsAuthorized_DimGradeLevels] 
 ON [RDS].[BridgeK12SchoolGradeLevelsAuthorized] ([GradeLevelId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevelsAuthorized_DimK12Schools] 
 ON [RDS].[BridgeK12SchoolGradeLevelsAuthorized] ([K12SchoolId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeK12SchoolGradeLevelsAuthorized] ADD CONSTRAINT [FK_BridgeK12SchoolGradeLevelsAuthorized_GradeLevelId]
	FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeK12SchoolGradeLevelsAuthorized] ADD CONSTRAINT [FK_BridgeK12SchoolGradeLevelsAuthorized_K12SchoolId]
	FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action
GO