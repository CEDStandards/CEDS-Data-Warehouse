CREATE TABLE [RDS].[FactK12CourseEndorsementRequirements]
(
  [FactK12CourseEndorsementRequirementId] INT NOT NULL IDENTITY(1,1),
  [K12CourseId] INT NOT NULL,
  [RecordStartDateTime] DATETIME NOT NULL,
  [RecordEndDateTime] DATETIME NULL,
  [CourseEndorsementRequirementCount] INT NOT NULL,  
  CONSTRAINT [PK_FactK12CourseEndorsementRequirements] PRIMARY KEY CLUSTERED ([FactK12CourseEndorsementRequirementId] ASC),
	CONSTRAINT [FK_FactK12CourseEndorsementRequirements_K12Course] FOREIGN KEY ([K12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]) ON DELETE No Action ON UPDATE No Action,
 
)
