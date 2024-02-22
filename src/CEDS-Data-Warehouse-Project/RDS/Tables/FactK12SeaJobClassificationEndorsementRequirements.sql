CREATE TABLE [RDS].[FactK12SeaJobClassificationEndorsementRequirements]
(
  [FactK12SeaJobClassificationEndorsementRequirementId] INT NOT NULL IDENTITY(1,1),
  [SeaJobClassificationId] INT NOT NULL,
  [RecordStartDateTime] DATETIME NOT NULL,
  [RecordEndDateTime] DATETIME NULL,
  [SeaJobClassificationEndorsementRequirementCount] INT NOT NULL,  
  CONSTRAINT [PK_FactK12SeaJobClassificationEndorsementRequirements] PRIMARY KEY CLUSTERED ([FactK12SeaJobClassificationEndorsementRequirementId] ASC),
	CONSTRAINT [FK_FactK12SeaJobClassificationEndorsementRequirements_K12Course] FOREIGN KEY ([SeaJobClassificationId]) REFERENCES [RDS].[DimSeaJobClassifications] ([DimSeaJobClassificationId]) ON DELETE No Action ON UPDATE No Action,
 
)
