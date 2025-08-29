CREATE TABLE [RDS].[DimAccessibilityFeatureAlternateResponseOptions] (
    [DimAccessibilityFeatureAlternateResponseOptionId] INT IDENTITY(1,1) NOT NULL,
    [AlternateResponseOptionTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureAlternateResponseOptions_AlternateResponseOptionTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AlternateResponseOptionTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureAlternateResponseOptions_AlternateResponseOptionTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureAlternateResponseOptions] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureAlternateResponseOptionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of alternative method for inputting a response.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Alternate Response Option Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002144' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002144' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of alternative method for inputting a response.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Alternate Response Option Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002144' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002144' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAlternateResponseOptions', @level2type=N'COLUMN',@level2name=N'AlternateResponseOptionTypeDescription';
GO