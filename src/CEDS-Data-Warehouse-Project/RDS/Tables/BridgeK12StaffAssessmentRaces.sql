CREATE TABLE [RDS].[BridgeK12StaffAssessmentRaces]
(
	[BridgeK12StaffAssessmentRaceId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffAssessmentId] int NULL,
	[RaceId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffAssessmentRaces] PRIMARY KEY CLUSTERED ([BridgeK12StaffAssessmentRaceId] ASC),
	CONSTRAINT [FK_BridgeK12StaffAssessmentRaces_FactK12StaffAssignments] FOREIGN KEY ([FactK12StaffAssessmentId]) REFERENCES [RDS].[FactK12StaffAssessments] ([FactK12StaffAssessmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffAssessmentRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssessmentRaces_DimRaces] 
 ON [RDS].[BridgeK12StaffAssessmentRaces] ([RaceId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssessmentRaces_FactK12StaffAssignments] 
 ON [RDS].[BridgeK12StaffAssessmentRaces] ([FactK12StaffAssessmentId] ASC)
GO