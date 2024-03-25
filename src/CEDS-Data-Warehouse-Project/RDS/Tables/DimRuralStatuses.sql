CREATE TABLE [RDS].[DimRuralStatuses]
(
  [DimRuralStatusId]                            INT IDENTITY (1, 1) NOT NULL,
  [ERSRuralUrbanContinuumCodeCode]              NVARCHAR (50)  CONSTRAINT [DF_DimRuralStatuses_ERSRuralUrbanContinuumCodeCode] DEFAULT ('MISSING') NOT NULL,
  [ERSRuralUrbanContinuumCodeDescription]       NVARCHAR (200) CONSTRAINT [DF_DimRuralStatuses_ERSRuralUrbanContinuumCodeDescription] DEFAULT ('MISSING') NOT NULL,
  [RuralResidencyStatusCode]                    NVARCHAR (50)  CONSTRAINT [DF_DimRuralStatuses_RuralResidencyStatusCodeCode] DEFAULT ('MISSING') NOT NULL,
  [RuralResidencyStatusDescription]             NVARCHAR (200) CONSTRAINT [DF_DimRuralStatuses_RuralResidencyStatusCodeDescription] DEFAULT ('MISSING') NOT NULL,
  CONSTRAINT [PK_DimRuralStatuses] PRIMARY KEY CLUSTERED ([DimRuralStatusId] ASC)
)
