CREATE TABLE [RDS].[DimPsCourseStatuses] (
    [DimPsCourseStatusId]              INT            NOT NULL,
    [CourseLevelTypeCode]              NVARCHAR (50)  CONSTRAINT [DF_DimPsCourseStatuses_CourseLevelTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CourseLevelTypeDescription]       NVARCHAR (200) CONSTRAINT [DF_DimPsCourseStatuses_CourseLevelTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CourseHonorsTypeCode]             NVARCHAR (50)  CONSTRAINT [DF_DimPsCourseStatuses_CourseHonorsTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CourseHonorsTypeDescription]      NVARCHAR (200) CONSTRAINT [DF_DimPsCourseStatuses_CourseHonorsTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CourseCreditBasisTypeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimPsCourseStatuses_CourseCreditBasisTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CourseCreditBasisTypeDescription] NVARCHAR (200) CONSTRAINT [DF_DimPsCourseStatuses_CourseCreditBasisTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [CourseCreditLevelTypeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimPsCourseStatuses_CourseCreditLevelTypeCode] DEFAULT ('MISSING') NOT NULL,
    [CourseCreditLevelTypeDescription] NVARCHAR (200) CONSTRAINT [DF_DimPsCourseStatuses_CourseCreditLevelTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimPsCourse] PRIMARY KEY CLUSTERED ([DimPsCourseStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsCourseStatuses_Codes]
    ON [RDS].[DimPsCourseStatuses]([CourseLevelTypeCode] ASC, [CourseHonorsTypeCode] ASC, [CourseCreditBasisTypeCode] ASC, [CourseCreditLevelTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of enrollment associated with the credit hours for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Basis Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001303' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of enrollment associated with the credit hours for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Basis Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001303' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditBasisTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The level of credit associated with the credit hours earned for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001304' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22270' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The level of credit associated with the credit hours earned for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001304' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22270' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseCreditLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the course is or can be counted as an honors course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Honors Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001307' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the course is or can be counted as an honors course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Honors Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001307' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseHonorsTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The level of work which is reflected in the credits associated with the academic course being described or the level of the typical individual taking the academic course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001312' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The level of work which is reflected in the credits associated with the academic course being described or the level of the typical individual taking the academic course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001312' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPsCourseStatuses', @level2type=N'COLUMN',@level2name=N'CourseLevelTypeDescription';
GO