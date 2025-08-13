CREATE TABLE [RDS].[DimAccessibilityFeatureAlternateResponseOptions] (
    [DimAccessibilityFeatureAlternateResponseOptionId] INT IDENTITY(1,1) NOT NULL,
    [AlternateResponseOptionTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureAlternateResponseOptions_AlternateResponseOptionTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AlternateResponseOptionTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureAlternateResponseOptions_AlternateResponseOptionTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureAlternateResponseOptions] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureAlternateResponseOptionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO