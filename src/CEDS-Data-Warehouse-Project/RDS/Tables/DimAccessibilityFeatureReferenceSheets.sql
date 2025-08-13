CREATE TABLE [RDS].[DimAccessibilityFeatureReferenceSheets] (
    [DimAccessibilityFeatureReferenceSheetId] INT IDENTITY(1,1) NOT NULL,
    [ReferenceSheetTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureReferenceSheets_ReferenceSheetTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ReferenceSheetTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureReferenceSheets_ReferenceSheetTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureReferenceSheets] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureReferenceSheetId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO