CREATE TABLE [RDS].[DimAccessibilityFeatureGroupSizes] (
    [DimAccessibilityFeatureGroupSizeId] INT IDENTITY(1,1) NOT NULL,
    [GroupSizeTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureGroupSizes_GroupSizeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [GroupSizeTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureGroupSizes_GroupSizeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureGroupSizes] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureGroupSizeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO