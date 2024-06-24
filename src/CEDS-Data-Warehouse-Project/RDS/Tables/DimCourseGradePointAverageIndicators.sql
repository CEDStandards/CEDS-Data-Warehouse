CREATE TABLE [RDS].[DimCourseGradePointAverageIndicators] (
    [DimCourseGradePointAverageIndicatorId]                      INT IDENTITY (1, 1) NOT NULL,
    [CourseGradePointAverageApplicabilityCode]                 NVARCHAR (50)  NOT NULL,
    [CourseGradePointAverageApplicabilityDescription]         NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimCourseGradePointAverageIndicators] PRIMARY KEY CLUSTERED ([DimCourseGradePointAverageIndicatorId] ASC)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCourseGradePointAverageIndicators', @level2type=N'COLUMN',@level2name=N'CourseGradePointAverageApplicabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether or not this course being described is included in the computation of the student''s Grade Point Average (GPA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCourseGradePointAverageIndicators', @level2type=N'COLUMN',@level2name=N'CourseGradePointAverageApplicabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Grade Point Average Applicability' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCourseGradePointAverageIndicators', @level2type=N'COLUMN',@level2name=N'CourseGradePointAverageApplicabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000060' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCourseGradePointAverageIndicators', @level2type=N'COLUMN',@level2name=N'CourseGradePointAverageApplicabilityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000060' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCourseGradePointAverageIndicators', @level2type=N'COLUMN',@level2name=N'CourseGradePointAverageApplicabilityCode';
GO
