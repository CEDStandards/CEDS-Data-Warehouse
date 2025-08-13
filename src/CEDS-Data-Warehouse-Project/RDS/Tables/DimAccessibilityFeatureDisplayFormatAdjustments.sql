CREATE TABLE [RDS].[DimAccessibilityFeatureDisplayFormatAdjustments] (
    [DimAccessibilityFeatureDisplayFormatAdjustmentId] INT IDENTITY(1,1) NOT NULL,
    [DisplayFormatAdjustmentTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureDisplayFormatAdjustments_DisplayFormatAdjustmentTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DisplayFormatAdjustmentTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureDisplayFormatAdjustments_DisplayFormatAdjustmentTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureDisplayFormatAdjustments] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureDisplayFormatAdjustmentId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO