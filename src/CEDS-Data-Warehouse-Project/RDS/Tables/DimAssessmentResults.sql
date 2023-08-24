CREATE TABLE [RDS].[DimAssessmentResults] (
    [DimAssessmentResultId]                INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentScoreMetricTypeCode]        NVARCHAR (100) NULL,
    [AssessmentScoreMetricTypeDescription] NVARCHAR (300) NULL,
    CONSTRAINT [PK_DimAssessmentResultId] PRIMARY KEY CLUSTERED ([DimAssessmentResultId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific method used to report the performance and achievement of the assessment. This is the metric that is being used to derive the scores.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Score Metric Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000369' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21368' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific method used to report the performance and achievement of the assessment. This is the metric that is being used to derive the scores.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Score Metric Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000369' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21368' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentResults', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricTypeDescription';
GO