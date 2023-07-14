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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an assessment performance level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000717' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21693' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A label representing the performance level appropriate for use on a report.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Label' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000718' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21694' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLowerCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Lowest possible score for the performance level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLowerCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Lower Cut Score' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLowerCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000418' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLowerCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21408' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLowerCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelScoreMetric';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The metric or scale used for score reporting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelScoreMetric';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Score Metric' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelScoreMetric';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000417' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelScoreMetric';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21407' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelScoreMetric';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelUpperCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Highest possible score for the performance level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelUpperCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Upper Cut Score' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelUpperCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000419' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelUpperCutScore';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21409' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentPerformanceLevels', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelUpperCutScore';
GO