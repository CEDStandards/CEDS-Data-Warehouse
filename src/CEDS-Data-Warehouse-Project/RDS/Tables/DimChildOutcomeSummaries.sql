CREATE TABLE [RDS].[DimChildOutcomeSummaries] (
    [DimChildOutcomeSummaryId]         INT            IDENTITY (1, 1) NOT NULL,
    [COSRatingACode]                   NVARCHAR (100) NOT NULL,
    [COSRatingADescription]            NVARCHAR (300) NOT NULL,
    [COSRatingBCode]                   NVARCHAR (100) NOT NULL,
    [COSRatingBDescription]            NVARCHAR (300) NOT NULL,
    [COSRatingCCode]                   NVARCHAR (100) NOT NULL,
    [COSRatingCDescription]            NVARCHAR (300) NOT NULL,
    [COSProgressAIndicatorCode]        NVARCHAR (100) NOT NULL,
    [COSProgressAIndicatorDescription] NVARCHAR (300) NOT NULL,
    [COSProgressBIndicatorCode]        NVARCHAR (100) NOT NULL,
    [COSProgressBIndicatorDescription] NVARCHAR (300) NOT NULL,
    [COSProgressCIndicatorCode]        NVARCHAR (100) NOT NULL,
    [COSProgressCIndicatorDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimChildOutcomeSummaryId] PRIMARY KEY CLUSTERED ([DimChildOutcomeSummaryId] ASC)
);


GO

