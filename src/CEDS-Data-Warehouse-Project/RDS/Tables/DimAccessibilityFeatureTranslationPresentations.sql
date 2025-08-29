CREATE TABLE [RDS].[DimAccessibilityFeatureTranslationPresentations] (
    [DimAccessibilityFeatureTranslationPresentationId] INT IDENTITY(1,1) NOT NULL,
    [TranslationPresentationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureTranslationPresentations_TranslationPresentationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TranslationPresentationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureTranslationPresentations_TranslationPresentationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureTranslationPresentations] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureTranslationPresentationId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The presentation type for the translated language. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Translation Presentation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002166' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002166' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The presentation type for the translated language. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Translation Presentation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002166' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002166' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTranslationPresentations', @level2type=N'COLUMN',@level2name=N'TranslationPresentationTypeDescription';
GO