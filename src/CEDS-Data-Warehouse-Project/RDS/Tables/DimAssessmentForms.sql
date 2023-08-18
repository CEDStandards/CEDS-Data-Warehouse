CREATE TABLE [RDS].[DimAssessmentForms] (
    [DimAssessmentFormId]  INT           IDENTITY (1, 1) NOT NULL,
    [AssessmentFormNumber] NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_DimAssessmentFormId] PRIMARY KEY CLUSTERED ([DimAssessmentFormId] ASC) WITH (FILLFACTOR = 80)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentForms', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of a given assessment form.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentForms', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Form Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentForms', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000366' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentForms', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21365' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentForms', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO