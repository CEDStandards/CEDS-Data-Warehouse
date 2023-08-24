CREATE TABLE [RDS].[ToggleAssessments] (
    [ToggleAssessmentId]     INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentName]         NVARCHAR (100) NOT NULL,
    [AssessmentType]         NVARCHAR (200) NOT NULL,
    [AssessmentTypeCode]     NVARCHAR (100) NOT NULL,
    [EOG]                    NVARCHAR (50)  NOT NULL,
    [Grade]                  NVARCHAR (2)   NOT NULL,
    [PerformanceLevels]      NVARCHAR (2)   NOT NULL,
    [ProficientOrAboveLevel] NVARCHAR (2)   NOT NULL,
    [Subject]                NVARCHAR (50)  DEFAULT (N'') NOT NULL,
    CONSTRAINT [PK_ToggleAssessments] PRIMARY KEY CLUSTERED ([ToggleAssessmentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of an assessment based on format and content.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000029' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21029' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of an assessment based on format and content.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000029' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21029' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ToggleAssessments', @level2type=N'COLUMN',@level2name=N'AssessmentTypeCode';
GO