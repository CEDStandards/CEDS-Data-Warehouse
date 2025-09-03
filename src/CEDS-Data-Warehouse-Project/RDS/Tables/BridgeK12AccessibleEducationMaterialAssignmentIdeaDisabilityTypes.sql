CREATE TABLE [RDS].[BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes]
(
	[BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypeId] int NOT NULL IDENTITY (1, 1),
	[FactK12AccessibleEducationMaterialAssignmentId] int NULL,
	[IdeaDisabilityTypeId] int NULL,
	CONSTRAINT [PK_BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes] PRIMARY KEY CLUSTERED ([BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypeId] ASC),
	CONSTRAINT [FK_BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes_FactK12AccessibleEducationMaterialAssignments] FOREIGN KEY ([FactK12AccessibleEducationMaterialAssignmentId]) REFERENCES [RDS].[FactK12AccessibleEducationMaterialAssignments] ([FactK12AccessibleEducationMaterialAssignmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes_IdeaDisabilityTypeId] FOREIGN KEY ([IdeaDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId]) ON DELETE No Action ON UPDATE No Action
);
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes_DimIdeaDisabilityTypes] 
 ON [RDS].[BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes] ([IdeaDisabilityTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes_FactK12AccessibleEducationMaterialAssignments] 
 ON [RDS].[BridgeK12AccessibleEducationMaterialAssignmentIdeaDisabilityTypes] ([FactK12AccessibleEducationMaterialAssignmentId] ASC)
GO
