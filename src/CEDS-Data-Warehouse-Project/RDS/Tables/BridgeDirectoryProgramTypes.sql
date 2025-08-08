CREATE TABLE [RDS].[BridgeDirectoryProgramTypes]
(
	[BridgeDirectoryK12ProgramTypeId] int NOT NULL IDENTITY (1, 1),
	[FactDirectoryId] int NULL,
	[ProgramTypeId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[BridgeDirectoryProgramTypes] 
 ADD CONSTRAINT [PK_BridgeDirectoryProgramTypes]
	PRIMARY KEY CLUSTERED ([BridgeDirectoryK12ProgramTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryProgramTypes_DimProgramTypes] 
 ON [RDS].[BridgeDirectoryProgramTypes] ([ProgramTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeDirectoryProgramTypes_FactDirectory] 
 ON [RDS].[BridgeDirectoryProgramTypes] ([FactDirectoryId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[BridgeDirectoryProgramTypes] ADD CONSTRAINT [FK_BridgeDirectoryProgramTypes_FactDirectory]
	FOREIGN KEY ([FactDirectoryId]) REFERENCES [RDS].[FactDirectory] ([FactDirectoryId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[BridgeDirectoryProgramTypes] ADD CONSTRAINT [FK_BridgeDirectoryProgramTypes_ProgramTypeId]
	FOREIGN KEY ([ProgramTypeId]) REFERENCES [RDS].[DimProgramTypes] ([DimProgramTypeId]) ON DELETE No Action ON UPDATE No Action
GO