CREATE TABLE [RDS].[DimAccessibilityFeatureCalculators] (
    [DimAccessibilityFeatureCalculatorId] INT IDENTITY(1,1) NOT NULL,
    [AdaptiveCalculatorTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_AdaptiveCalculatorTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AdaptiveCalculatorTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_AdaptiveCalculatorTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CalculatorTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_CalculatorTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CalculatorTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureCalculators_CalculatorTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureCalculators] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureCalculatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific type of adaptive calculator used.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adaptive Calculator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002143' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002143' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific type of adaptive calculator used.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adaptive Calculator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002143' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002143' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'AdaptiveCalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific type of calculator used.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calculator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific type of calculator used.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calculator Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureCalculators', @level2type=N'COLUMN',@level2name=N'CalculatorTypeDescription';
GO