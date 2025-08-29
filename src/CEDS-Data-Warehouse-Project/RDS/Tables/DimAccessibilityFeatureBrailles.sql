CREATE TABLE [RDS].[DimAccessibilityFeatureBrailles] (
    [DimAccessibilityFeatureBrailleId] INT IDENTITY(1,1) NOT NULL,
    [BrailleAccessTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleAccessTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleAccessTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleAccessTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BrailleApplicationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleApplicationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleApplicationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleApplicationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BrailleCodeTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleCodeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleCodeTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleCodeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BrailleVersionTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleVersionTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BrailleVersionTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBrailles_BrailleVersionTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureBrailles] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureBrailleId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The way braille is accessed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Access Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The way braille is accessed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Access Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleAccessTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The way braille is applied.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Application Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The way braille is applied.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Application Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of braille code.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Code Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of braille code.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Code Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleCodeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A tactile system used by people with visual impairments, employing patterns of raised dots to represent letters, numbers, and symbols that can be read by touch.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Version Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A tactile system used by people with visual impairments, employing patterns of raised dots to represent letters, numbers, and symbols that can be read by touch.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Braille Version Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureBrailles', @level2type=N'COLUMN',@level2name=N'BrailleVersionTypeDescription';
GO