CREATE TABLE [RDS].[DimAccessibilityFeatureTranslationPresentations] (
    [DimAccessibilityFeatureTranslationPresentationId] INT IDENTITY(1,1) NOT NULL,
    [TranslationPresentationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureTranslationPresentations_TranslationPresentationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TranslationPresentationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureTranslationPresentations_TranslationPresentationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureTranslationPresentations] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureTranslationPresentationId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO