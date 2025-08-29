CREATE TABLE [RDS].[BridgeK12StaffAssignmentsCompetencyDefinitions]
(
	[BrideK12StaffAssignmentsCompetencyDefinitions] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffAssessmentId] int NULL,
	[CompetencyDefinitionId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffAssignmentsCompetencyDefinitions] PRIMARY KEY CLUSTERED ([BrideK12StaffAssignmentsCompetencyDefinitions] ASC),
	CONSTRAINT [FK_BridgeK12StaffAssignmentsCompetencyDefinitions_CompetencyDefinitionId] FOREIGN KEY ([CompetencyDefinitionId]) REFERENCES [RDS].[DimCompetencyDefinitions] ([DimCompetencyDefinitionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffAssignmentsCompetencyDefinitions_FactK12StaffAssignments] FOREIGN KEY ([FactK12StaffAssessmentId]) REFERENCES [RDS].[FactK12StaffAssessments] ([FactK12StaffAssessmentId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentsCompetencyDefinitions_DimCompetencyDefinitions] 
 ON [RDS].[BridgeK12StaffAssignmentsCompetencyDefinitions] ([CompetencyDefinitionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentsCompetencyDefinitions_FactK12StaffAssignments] 
 ON [RDS].[BridgeK12StaffAssignmentsCompetencyDefinitions] ([FactK12StaffAssessmentId] ASC)
GO

