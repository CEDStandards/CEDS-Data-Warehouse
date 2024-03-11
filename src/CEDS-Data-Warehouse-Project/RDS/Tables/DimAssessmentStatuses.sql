CREATE TABLE [RDS].[DimAssessmentStatuses] (
    [DimAssessmentStatusId]        INT            IDENTITY (1, 1) NOT NULL,
    [ProgressLevelCode]            NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentStatuses_ProgressLevelCode] DEFAULT ('MISSING') NOT NULL,
    [ProgressLevelDescription]     NVARCHAR (100) CONSTRAINT [DF_DimAssessmentStatuses_ProgressLevelDescription] DEFAULT ('MISSING') NOT NULL,
    [ProgressLevelEdFactsCode]     NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentStatuses_ProgressLevelEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [AssessedFirstTimeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentStatuses_AssessedFirstTimeCode] DEFAULT ('MISSING') NOT NULL,
    [AssessedFirstTimeDescription] NVARCHAR (100) CONSTRAINT [DF_DimAssessmentStatuses_AssessedFirstTimeDescription] DEFAULT ('MISSING') NOT NULL,
    [AssessedFirstTimeEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentStatuses_AssessedFirstTimeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAssessmentStatuses] PRIMARY KEY CLUSTERED ([DimAssessmentStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of progress shown in academic subjects.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000561' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21553' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of progress shown in academic subjects.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000561' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21553' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of progress shown in academic subjects.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000561' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21553' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentStatuses', @level2type=N'COLUMN',@level2name=N'ProgressLevelEdFactsCode';
GO