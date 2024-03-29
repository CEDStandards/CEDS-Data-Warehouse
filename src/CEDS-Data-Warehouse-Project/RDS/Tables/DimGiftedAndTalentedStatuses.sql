CREATE TABLE [RDS].[DimGiftedAndTalentedStatuses]
(
  [DimGiftedAndTalentedStatusId] int NOT NULL IDENTITY (1, 1),
  [GiftedAndTalentedIndicatorCode] nvarchar(50) NOT NULL,
  [GiftedAndTalentedIndicatorDescription] nvarchar(200) NOT NULL,
  [ProgramGiftedEligibilityCriteriaCode] nvarchar(50) NOT NULL,
  [ProgramGiftedEligibilityCriteriaDescription] nvarchar(200) NOT NULL,
  CONSTRAINT [PK_DimGiftedAndTalentedStatuses] PRIMARY KEY CLUSTERED ([DimGiftedAndTalentedStatusId] ASC)
)
