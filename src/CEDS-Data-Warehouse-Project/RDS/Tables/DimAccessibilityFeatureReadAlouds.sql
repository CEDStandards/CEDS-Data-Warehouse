CREATE TABLE [RDS].[DimAccessibilityFeatureReadAlouds] (
    [DimAccessibilityFeatureReadAloudId] INT IDENTITY(1,1) NOT NULL,
    [ReadAloudTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureReadAlouds_ReadAloudTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ReadAloudTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureReadAlouds_ReadAloudTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureReadAlouds] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureReadAloudId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method in which the text is read aloud to the person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Read Aloud Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method in which the text is read aloud to the person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Read Aloud Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureReadAlouds', @level2type=N'COLUMN',@level2name=N'ReadAloudTypeDescription';
GO