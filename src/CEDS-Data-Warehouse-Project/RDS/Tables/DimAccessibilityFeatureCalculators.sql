CREATE TABLE [RDS].[DimAccessibilityFeatureCalculators] (
    [DimAccessibilityFeatureCalculatorId] INT IDENTITY(1,1) NOT NULL,
    [AdaptiveCalculatorTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_AdaptiveCalculatorTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AdaptiveCalculatorTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_AdaptiveCalculatorTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CalculatorTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_CalculatorTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CalculatorTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_CalculatorTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureCalculators] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureCalculatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
