CREATE TABLE [RDS].[DimK12CourseSections] (
    [DimK12CourseSectionId]          INT IDENTITY (1, 1) NOT NULL,
    [CourseSectionIdentifier]        NVARCHAR (40) NOT NULL,
    [ClassPeriod]                    NVARCHAR (30) NULL,
    [ClassMeetingDays]               NVARCHAR (60) NULL,
    [ClassroomIdentifier]            NVARCHAR (40) NULL,
    [GradeValueQualifier]            NVARCHAR (100) NULL,
    [CourseDescription]              NVARCHAR (1024)  NOT NULL,
    CONSTRAINT [PK_DimK12CourseSections] PRIMARY KEY CLUSTERED ([DimK12CourseSectionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);

GO

CREATE NONCLUSTERED INDEX [IX_DimK12CourseSections_CourseSectionIdentifier]
    ON [RDS].[DimK12CourseSections]([CourseSectionIdentifier] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned by an institution, school, school system, state, or other agency or entity for a particular course-section.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseSectionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassPeriod';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassPeriod';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Class Period' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassPeriod';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000522' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassPeriod';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000522' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassPeriod';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassMeetingDays';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The day(s) of the week (e.g., Monday, Wednesday) that the class meets or an indication that a class meets "out-of-school" or "self-paced".' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassMeetingDays';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Class Meeting Days' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassMeetingDays';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000521' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassMeetingDays';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000521' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassMeetingDays';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassroomIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a room by a school, school system, state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassroomIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classroom Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassroomIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000364' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassroomIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000364' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'ClassroomIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'GradeValueQualifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The scale of equivalents, if applicable, for grades awarded as indicators of performance in schoolwork. For example, numerical equivalents for letter grades used in determining a student''s Grade Point Average (A=4, B=3, C=2, D=1 in a four-point system) or letter equivalents for percentage grades (90-100%=A, 80-90%=B, etc.)' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'GradeValueQualifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Value Qualifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'GradeValueQualifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000616' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'GradeValueQualifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000616' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'GradeValueQualifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the course content and/or goals. Reference may be made to state or national content standards.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000517' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000517' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSections', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO


