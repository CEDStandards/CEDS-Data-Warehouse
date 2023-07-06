CREATE TABLE [RDS].[DimAssessmentResults] (
    [DimAssessmentResultId]                INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentScoreMetricTypeCode]        NVARCHAR (100) NULL,
    [AssessmentScoreMetricTypeDescription] NVARCHAR (300) NULL,
    CONSTRAINT [PK_DimAssessmentResultId] PRIMARY KEY CLUSTERED ([DimAssessmentResultId] ASC)
);


GO

