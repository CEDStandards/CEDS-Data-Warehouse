CREATE TABLE [RDS].[DimStaffEvaluationScales] (
    [DimStaffEvaluationScaleId] INT IDENTITY (1, 1) NOT NULL,
    [StaffEvaluationScaleCode] NVARCHAR(50) NOT NULL,
    [StaffEvaluationScaleDescription] NVARCHAR(200) NOT NULL,
    CONSTRAINT [PK_DimStaffEvaluationScales] PRIMARY KEY CLUSTERED ([DimStaffEvaluationScaleId] ASC)
);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quantitative or qualitative range of possible scores/rating for a person''s overall performance (e.g., 0 - 10; Poor, Fair, Average, Good, Excellent).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Evaluation Scale' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000103' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19103' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quantitative or qualitative range of possible scores/rating for a person''s overall performance (e.g., 0 - 10; Poor, Fair, Average, Good, Excellent).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Evaluation Scale' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000103' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19103' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStaffEvaluationScales', @level2type=N'COLUMN',@level2name=N'StaffEvaluationScaleDescription';
GO