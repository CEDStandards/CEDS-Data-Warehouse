CREATE TABLE [dbo].[BridgeK12CourseEndorsementRequirementCredentialDefinitions]
(
  [BridgeK12CourseEndorsementRequirementCredentialDefinitionId] INT NOT NULL IDENTITY(1,1),
  [FactK12CourseEndorsementRequirementId] INT NOT NULL,
  [CredentialDefinitionId] INT NOT NULL,
  CONSTRAINT [PK_BridgeK12CourseEndorsementRequirementCredentialDefinitions] PRIMARY KEY CLUSTERED ([BridgeK12CourseEndorsementRequirementCredentialDefinitionId] ASC),
  CONSTRAINT [FK_BridgeK12CourseEndorsementRequirementCredentialDefinitions_FactK12CourseEndorsementRequirements] FOREIGN KEY ([FactK12CourseEndorsementRequirementId]) REFERENCES [RDS].[FactK12CourseEndorsementRequirements] ([FactK12CourseEndorsementRequirementId]) ON DELETE No Action ON UPDATE No Action,
  CONSTRAINT [FK_BridgeK12CourseEndorsementRequirementCredentialDefinitions_CredentialDefinitions] FOREIGN KEY ([CredentialDefinitionId]) REFERENCES [RDS].[DimCredentialDefinitions] ([DimCredentialDefinitionId]) ON DELETE No Action ON UPDATE No Action
)
