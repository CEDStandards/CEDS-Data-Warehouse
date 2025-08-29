CREATE TABLE [RDS].[BridgeK12StaffAssignmentCredentialAwards]
(
	[BridgeK12StaffAssignmentCredentialAwardId] int NOT NULL IDENTITY (1, 1),
	[CredentialAwardId] int NULL,
	[FactK12StaffAssignmentId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffAssignmentCredentialAwards] PRIMARY KEY CLUSTERED ([BridgeK12StaffAssignmentCredentialAwardId] ASC),
	CONSTRAINT [FK_BridgeK12StaffAssignmentCredentialAwards_CredentialAwardId] FOREIGN KEY ([CredentialAwardId]) REFERENCES [RDS].[DimCredentialAwards] ([DimCredentialAwardId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffAssignmentCredentialAwards_FactK12StaffAssignments] FOREIGN KEY ([FactK12StaffAssignmentId]) REFERENCES [RDS].[FactK12StaffAssignments] ([FactK12StaffAssignmentId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentCredentialAwards_DimCredentialAwards] 
 ON [RDS].[BridgeK12StaffAssignmentCredentialAwards] ([CredentialAwardId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentCredentialAwards_FactK12StaffAssignments] 
 ON [RDS].[BridgeK12StaffAssignmentCredentialAwards] ([FactK12StaffAssignmentId] ASC)
GO