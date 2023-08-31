CREATE TABLE [RDS].[DimScedCodes] (
    [DimScedCodeId]                    INT             IDENTITY (1, 1) NOT NULL,
    [ScedCourseCode]                   NCHAR (5)       NOT NULL,
    [ScedCourseTitle]                  NVARCHAR (50)   NOT NULL,
    [ScedCourseCodeDescription]        NVARCHAR (2000) NOT NULL,
    [ScedCourseLevelCode]              NVARCHAR (50)   CONSTRAINT [DF_DimScedCodes_ScedCourseLevelCode] DEFAULT ('MISSING') NOT NULL,
    [ScedCourseLevelDescription]       NVARCHAR (200)  CONSTRAINT [DF_DimScedCodes_ScedCourseLevelDescription] DEFAULT ('MISSING') NOT NULL,
    [ScedCourseSubjectAreaCode]        NVARCHAR (50)   CONSTRAINT [DF_DimScedCodes_ScedCourseSubjectAreaCode] DEFAULT ('MISSING') NOT NULL,
    [ScedCourseSubjectAreaDescription] NVARCHAR (200)  CONSTRAINT [DF_DimScedCodes_ScedCourseSubjectAreaDescription] DEFAULT ('MISSING') NOT NULL,
    [ScedGradeSpan]                    NCHAR (4)       NOT NULL,
    [ScedSequenceOfCourse]             NCHAR (10)      NOT NULL,
    CONSTRAINT [PK_DimScedCodes] PRIMARY KEY CLUSTERED ([DimScedCodeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimScedCodes_Codes]
    ON [RDS].[DimScedCodes]([ScedCourseCode] ASC, [ScedCourseLevelCode] ASC, [ScedCourseSubjectAreaCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The five-digit SCED code. The first two-digits of the code represent the Course Subject Area and the next three digits identify the course number. These identifiers are fairly general but provide enough specificity to identify the course''s topic and to distinguish it from other courses in that subject area.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Course Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001517' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22490' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The five-digit SCED code. The first two-digits of the code represent the Course Subject Area and the next three digits identify the course number. These identifiers are fairly general but provide enough specificity to identify the course''s topic and to distinguish it from other courses in that subject area.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Course Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001517' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22490' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N' The course''s level of rigor.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Course Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001516' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22488' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N' The course''s level of rigor.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Course Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001516' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22488' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The intended major subject area of the education course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Course Subject Area' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001518' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22491' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The intended major subject area of the education course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Course Subject Area' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001518' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22491' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseSubjectAreaDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, and language arts).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000067' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21067' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedCourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedGradeSpan';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The grade span for which the course is appropriate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedGradeSpan';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Grade Span' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedGradeSpan';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001480' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedGradeSpan';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22452' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedGradeSpan';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedSequenceOfCourse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Where a specific course lies when it is part of a consecutive sequence of courses. This element should be interpreted as "part ''n'' of ''m'' parts.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedSequenceOfCourse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Courses for the Exchange of Data Sequence of Course' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedSequenceOfCourse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000250' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedSequenceOfCourse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21250' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimScedCodes', @level2type=N'COLUMN',@level2name=N'ScedSequenceOfCourse';
GO
