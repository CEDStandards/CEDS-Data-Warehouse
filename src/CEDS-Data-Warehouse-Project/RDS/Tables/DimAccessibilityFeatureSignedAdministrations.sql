CREATE TABLE [RDS].[DimAccessibilityFeatureSignedAdministrations] (
    [DimAccessibilityFeatureSignedAdministrationId] INT IDENTITY(1,1) NOT NULL,
    [SignedAdministrationDeliveryMethodCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationDeliveryMethodCode] DEFAULT ('MISSING') NOT NULL,
    [SignedAdministrationDeliveryMethodDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationDeliveryMethodDescription] DEFAULT ('MISSING') NOT NULL,
    [SignedAdministrationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [SignedAdministrationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureSignedAdministrations_SignedAdministrationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureSignedAdministrations] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureSignedAdministrationId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method in which the signed administration will be delivered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Signed Administration Delivery Method' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002164' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002164' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method in which the signed administration will be delivered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Signed Administration Delivery Method' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002164' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002164' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of sign language in which content is presented.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Signed Administration Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002145' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002145' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of sign language in which content is presented.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Signed Administration Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002145' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002145' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureSignedAdministrations', @level2type=N'COLUMN',@level2name=N'SignedAdministrationTypeDescription';
GO