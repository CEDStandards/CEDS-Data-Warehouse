CREATE TABLE [RDS].[DimAccessibilityFeatureReferenceSheets] (
    [DimAccessibilityFeatureReferenceSheetId] INT IDENTITY(1,1) NOT NULL,
    [ReferenceSheetTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureReferenceSheets_ReferenceSheetTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ReferenceSheetTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureReferenceSheets_ReferenceSheetTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureReferenceSheets] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureReferenceSheetId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of structured document specifically designed for providing reference materials.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reference Sheet Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002162' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002162' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of structured document specifically designed for providing reference materials.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reference Sheet Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002162' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002162' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReferenceSheets', @level2type=N'COLUMN',@level2name=N'ReferenceSheetTypeDescription';
GO