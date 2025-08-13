CREATE TABLE [RDS].[DimAccessibilityFeatureTactileMediums] (
    [DimAccessibilityFeatureTactileMediumId] INT IDENTITY(1,1) NOT NULL,
    [TactileMediumTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureTactileMediums_TactileMediumTypeCode] DEFAULT ('MISSING') NOT NULL,
    [TactileMediumTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureTactileMediums_TactileMediumTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureTactileMediums] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureTactileMediumId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO