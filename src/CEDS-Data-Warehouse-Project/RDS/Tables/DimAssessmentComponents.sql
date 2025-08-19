CREATE TABLE [RDS].[DimAssessmentComponents] (
    [DimAssessmentComponentId] INT IDENTITY(1,1) NOT NULL,
    [AssessmentComponentTypeCode] NVARCHAR(50) CONSTRAINT [DF_DimAssessmentComponents_AssessmentComponentTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentComponentTypeDescription] NVARCHAR(200) CONSTRAINT [DF_DimAssessmentComponents_AssessmentComponentTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAssessmentComponents] PRIMARY KEY CLUSTERED ([DimAssessmentComponentId] ASC) WITH (DATA_COMPRESSION = PAGE)
);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The various components of text that make up the whole of an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Component Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002174' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002174' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The various components of text that make up the whole of an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Component Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002174' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002174' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentComponents', @level2type=N'COLUMN',@level2name=N'AssessmentComponentTypeDescription';
GO