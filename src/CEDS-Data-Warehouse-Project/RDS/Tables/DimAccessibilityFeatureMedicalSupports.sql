CREATE TABLE [RDS].[DimAccessibilityFeatureMedicalSupports] (
    [DimAccessibilityFeatureMedicalSupportId] INT IDENTITY(1,1) NOT NULL,
    [MedicalSupportTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureMedicalSupports_MedicalSupportTypeCode] DEFAULT ('MISSING') NOT NULL,
    [MedicalSupportTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureMedicalSupports_MedicalSupportTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureMedicalSupports] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureMedicalSupportId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support for a person with a medical condition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Medical Support Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support for a person with a medical condition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Medical Support Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureMedicalSupports', @level2type=N'COLUMN',@level2name=N'MedicalSupportTypeDescription';
GO