CREATE TABLE [RDS].[DimAccessibilityFeatures] (
    [DimAccessibilityFeatureId] INT IDENTITY(1,1) NOT NULL,
    [AccessibilityFeatureTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureApplicationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureApplicationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureApplicationDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureApplicationDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureCategoryCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureCategoryCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureCategoryDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureCategoryDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureDeliveryMethodCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureDeliveryMethodCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureDeliveryMethodDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureDeliveryMethodDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureEmbeddedIndicatorCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureEmbeddedIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureEmbeddedIndicatorDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureEmbeddedIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeaturePausesTheClockIndicatorCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeaturePausesTheClockIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeaturePausesTheClockIndicatorDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeaturePausesTheClockIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatures] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO