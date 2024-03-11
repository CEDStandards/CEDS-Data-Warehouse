CREATE TABLE [dbo].[BridgeK12SeaJobClassificationEndorsementCredentialDefinitions]
(
  [BridgeK12SeaJobClassificationEndorsementCredentialDefinitionId] INT NOT NULL IDENTITY(1,1),
  [FactK12SeaJobClassificationEndorsementRequirementId] INT NOT NULL,
  [CredentialDefinitionId] INT NOT NULL,
  CONSTRAINT [PK_BridgeK12SeaJobClassificationEndorsementCredentialDefinitions] PRIMARY KEY CLUSTERED ([BridgeK12SeaJobClassificationEndorsementCredentialDefinitionId] ASC),
  CONSTRAINT [FK_BridgeK12SeaJobClassificationEndorsementCredentialDefinitions_FactK12SeaJobClassificationEndorsementRequirements] FOREIGN KEY ([FactK12SeaJobClassificationEndorsementRequirementId]) REFERENCES [RDS].[FactK12SeaJobClassificationEndorsementRequirements] ([FactK12SeaJobClassificationEndorsementRequirementId]) ON DELETE No Action ON UPDATE No Action,
  CONSTRAINT [FK_BridgeK12SeaJobClassificationEndorsementCredentialDefinitions_CredentialDefinitions] FOREIGN KEY ([CredentialDefinitionId]) REFERENCES [RDS].[DimCredentialDefinitions] ([DimCredentialDefinitionId]) ON DELETE No Action ON UPDATE No Action
)
