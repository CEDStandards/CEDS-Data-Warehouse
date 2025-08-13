CREATE TABLE [RDS].[DimAccessibilityFeatureReadAlouds] (
    [DimAccessibilityFeatureReadAloudId] INT IDENTITY(1,1) NOT NULL,
    [ReadAloudTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureReadAlouds_ReadAloudTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ReadAloudTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureReadAlouds_ReadAloudTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureReadAlouds] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureReadAloudId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO