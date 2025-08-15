CREATE TABLE [RDS].[DimAccessibilityFeatureAssessmentExtendedTimes] (
    [DimAccessibilityFeatureAssessmentExtendedTimeId] INT IDENTITY(1,1) NOT NULL,
    [AssessmentExtendedTimeTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAccessibilityFeatureAssessmentExtendedTimes_AssessmentExtendedTimeTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentExtendedTimeTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAccessibilityFeatureAssessmentExtendedTimes_AssessmentExtendedTimeTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAccessibilityFeatureAssessmentExtendedTimes] PRIMARY KEY CLUSTERED ([DimAccessibilityFeatureAssessmentExtendedTimeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of additional time provided to complete an assessment beyond the standard duration.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Extended Time Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of additional time provided to complete an assessment beyond the standard duration.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Extended Time Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibilityFeatureAssessmentExtendedTimes', @level2type=N'COLUMN',@level2name=N'AssessmentExtendedTimeTypeDescription';
GO