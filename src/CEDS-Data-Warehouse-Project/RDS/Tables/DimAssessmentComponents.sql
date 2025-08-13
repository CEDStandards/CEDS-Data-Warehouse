CREATE TABLE [RDS].[DimAssessmentComponents] (
    [DimAssessmentComponentId] INT IDENTITY(1,1) NOT NULL,
    [AssessmentComponentTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAssessmentComponents_AssessmentComponentTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentComponentTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAssessmentComponents_AssessmentComponentTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAssessmentComponents] PRIMARY KEY CLUSTERED ([DimAssessmentComponentId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
