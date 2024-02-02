CREATE TABLE [RDS].[BridgeK12StaffCourseSectionRaces]
(
	[BridgeK12StaffCourseSectionRaceId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffCourseSectionId] int NULL,
	[RaceId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffCourseSectionRaces] PRIMARY KEY CLUSTERED ([BridgeK12StaffCourseSectionRaceId] ASC),
	CONSTRAINT [FK_BridgeK12StaffCourseSectionRaces_FactK12StaffCourseSectionId] FOREIGN KEY ([FactK12StaffCourseSectionId]) REFERENCES [RDS].[FactK12StaffCourseSections] ([FactK12StaffCourseSections]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffCourseSectionRaces_RaceId]	FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCourseSectionRaces_DimRaces] 
 ON [RDS].[BridgeK12StaffCourseSectionRaces] ([RaceId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCourseSectionRaces_FactK12StaffCourseSections] 
 ON [RDS].[BridgeK12StaffCourseSectionRaces] ([FactK12StaffCourseSectionId] ASC)
GO
