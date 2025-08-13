CREATE TABLE [RDS].[DimAccessibilityFeatureAssessmentExtendedTimes] (
    [DimAccessibilityFeatureAssessmentExtendedTimeId] INT IDENTITY(1,1) NOT NULL,
    [AssessmentExtendedTimeTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureAssessmentExtendedTimes_AssessmentExtendedTimeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentExtendedTimeTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureAssessmentExtendedTimes_AssessmentExtendedTimeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureAssessmentExtendedTimes] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureAssessmentExtendedTimeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO