CREATE TABLE [RDS].[DimAccessibilityFeatureBreaks] (
    [DimAccessibilityFeatureBreakId] INT IDENTITY(1,1) NOT NULL,
    [BreakLocationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakLocationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BreakLocationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakLocationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BreakTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BreakTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureBreaks] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureBreakId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The location where the individual is allowed to temporarily suspend activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Break Location Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The location where the individual is allowed to temporarily suspend activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Break Location Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakLocationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of designated pause allowing the individual to temporarily suspend activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Break Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002152' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002152' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of designated pause allowing the individual to temporarily suspend activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Break Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002152' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002152' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBreaks', @level2type=N'COLUMN',@level2name=N'BreakTypeDescription';
GO