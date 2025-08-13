CREATE TABLE [RDS].[DimAccessibilityFeatureBreaks] (
    [DimAccessibilityFeatureBreakId] INT IDENTITY(1,1) NOT NULL,
    [BreakLocationTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakLocationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BreakLocationTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakLocationTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [BreakTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BreakTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureBreaks_BreakTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureBreaks] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureBreakId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO