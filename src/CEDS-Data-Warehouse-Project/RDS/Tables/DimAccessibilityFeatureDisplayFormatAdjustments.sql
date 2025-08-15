CREATE TABLE [RDS].[DimAccessibilityFeatureDisplayFormatAdjustments] (
    [DimAccessibilityFeatureDisplayFormatAdjustmentId] INT IDENTITY(1,1) NOT NULL,
    [DisplayFormatAdjustmentTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureDisplayFormatAdjustments_DisplayFormatAdjustmentTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DisplayFormatAdjustmentTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureDisplayFormatAdjustments_DisplayFormatAdjustmentTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureDisplayFormatAdjustments] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureDisplayFormatAdjustmentId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of adjustment to the format of the content.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Display Format Adjustment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002154' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002154' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of adjustment to the format of the content.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Display Format Adjustment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002154' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002154' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureDisplayFormatAdjustments', @level2type=N'COLUMN',@level2name=N'DisplayFormatAdjustmentTypeDescription';
GO