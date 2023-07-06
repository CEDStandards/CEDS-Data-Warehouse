CREATE TABLE [RDS].[DimAssessmentPerformanceLevels] (
    [DimAssessmentPerformanceLevelId]         INT           IDENTITY (1, 1) NOT NULL,
    [AssessmentPerformanceLevelIdentifier]    NVARCHAR (40) NOT NULL,
    [AssessmentPerformanceLevelLabel]         NVARCHAR (20) NOT NULL,
    [AssessmentPerformanceLevelScoreMetric]   NVARCHAR (30) NOT NULL,
    [AssessmentPerformanceLevelLowerCutScore] NVARCHAR (30) NOT NULL,
    [AssessmentPerformanceLevelUpperCutScore] NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_DimAssessmentPerformanceLevels] PRIMARY KEY CLUSTERED ([DimAssessmentPerformanceLevelId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessmentPerformanceLevels_AssessmentPerformanceLevelIdentifier]
    ON [RDS].[DimAssessmentPerformanceLevels]([AssessmentPerformanceLevelIdentifier] ASC);


GO

