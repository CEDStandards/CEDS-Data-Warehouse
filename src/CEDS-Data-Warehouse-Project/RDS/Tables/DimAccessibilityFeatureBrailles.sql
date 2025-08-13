CREATE TABLE [RDS].[DimAccessibilityFeatureBrailles] (
    [DimAccessibilityFeatureBrailleId] INT IDENTITY(1,1) NOT NULL,
    [BrailleAccessTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleAccessTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleAccessTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleAccessTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BrailleApplicationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleApplicationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleApplicationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleApplicationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BrailleCodeTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleCodeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleCodeTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleCodeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BrailleVersionTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleVersionTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleVersionTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleVersionTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureBrailles] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureBrailleId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO