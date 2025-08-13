CREATE TABLE [RDS].[DimAccessibilityFeatureSettings] (
    [DimAccessibilityFeatureSettingId] INT IDENTITY(1,1) NOT NULL,
    [SettingTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureSettings_SettingTypeCode] DEFAULT ('MISSING') NOT NULL,
    [SettingTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureSettings_SettingTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureSettings] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureSettingId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO