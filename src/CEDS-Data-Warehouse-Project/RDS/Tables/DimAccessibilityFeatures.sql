CREATE TABLE [RDS].[DimAccessibilityFeatures] (
    [DimAccessibilityFeatureId] INT IDENTITY(1,1) NOT NULL,
    [AccessibilityFeatureTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureApplicationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureApplicationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureApplicationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureApplicationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureCategoryCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureCategoryCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureCategoryDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureCategoryDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureDeliveryMethodCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureDeliveryMethodCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureDeliveryMethodDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureDeliveryMethodDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureEmbeddedIndicatorCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureEmbeddedIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeatureEmbeddedIndicatorDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeatureEmbeddedIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeaturePausesTheClockIndicatorCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeaturePausesTheClockIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AccessibilityFeaturePausesTheClockIndicatorDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatures_AccessibilityFeaturePausesTheClockIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatures] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how this accessibility feature can be applied.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Application Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002167' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002167' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how this accessibility feature can be applied.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Application Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002167' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002167' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureApplicationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of features implemented to enhance accessibility.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002168' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002168' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of features implemented to enhance accessibility.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002168' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002168' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The distinct methods or formats through which accessibility features, such as resources or tools, are provided to a person based on their preferences, requirements, or needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Delivery Method' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002169' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002169' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The distinct methods or formats through which accessibility features, such as resources or tools, are provided to a person based on their preferences, requirements, or needs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Delivery Method' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002169' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002169' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureDeliveryMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication whether this accessibility feature is embedded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Embedded Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002170' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002170' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication whether this accessibility feature is embedded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Embedded Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002170' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002170' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureEmbeddedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the accessibility feature stops the predetermined amount of time for the assessment or instruction activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Pauses the Clock Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the accessibility feature stops the predetermined amount of time for the assessment or instruction activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Pauses the Clock Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeaturePausesTheClockIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of design elements or functionalities integrated into products, services, or environments to ensure equitable access for all individuals, aiming to eliminate barriers and facilitate ease of use.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000385' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000385' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of design elements or functionalities integrated into products, services, or environments to ensure equitable access for all individuals, aiming to eliminate barriers and facilitate ease of use.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessibility Feature Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000385' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000385' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatures', @level2type=N'COLUMN',@level2name=N'AccessibilityFeatureTypeDescription';
GO