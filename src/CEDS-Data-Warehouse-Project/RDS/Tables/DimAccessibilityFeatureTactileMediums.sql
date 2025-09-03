CREATE TABLE [RDS].[DimAccessibilityFeatureTactileMediums] (
    [DimAccessibilityFeatureTactileMediumId] INT IDENTITY(1,1) NOT NULL,
    [TactileMediumTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureTactileMediums_TactileMediumTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TactileMediumTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureTactileMediums_TactileMediumTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureTactileMediums] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureTactileMediumId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The tactile or textured medium used to convey visual information through touch.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Tactile Medium Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002165' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002165' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The tactile or textured medium used to convey visual information through touch.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Tactile Medium Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002165' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002165' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureTactileMediums', @level2type=N'COLUMN',@level2name=N'TactileMediumTypeDescription';
GO