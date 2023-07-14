CREATE TABLE [RDS].[DimK12Courses] (
    [DimK12CourseId]                 INT            IDENTITY (1, 1) NOT NULL,
    [CourseIdentifier]               NVARCHAR (40)  NOT NULL,
    [CourseCodeSystemCode]           NVARCHAR (50)  NOT NULL,
    [CourseCodeSystemDescription]    NVARCHAR (200) NOT NULL,
    [CourseTitle]                    NVARCHAR (60)  NOT NULL,
    [CourseDescription]              NVARCHAR (60)  NOT NULL,
    [CourseDepartmentName]           NVARCHAR (60)  NOT NULL,
    [CourseCreditUnitsCode]          NVARCHAR (50)  NOT NULL,
    [CourseCreditUnitsDescription]   NVARCHAR (200) NOT NULL,
    [CreditValue]                    DECIMAL (4, 2) NOT NULL,
    [AdvancedPlacementCourseCode]    NVARCHAR (60)  NOT NULL,
    [CareerClusterCode]              NVARCHAR (50)  NOT NULL,
    [CareerClusterDescription]       NVARCHAR (200) NOT NULL,
    [CourseCertificationDescription] NVARCHAR (300) NOT NULL,
    [TuitionFunded]                  BIT            NOT NULL,
    [CourseFundingProgram]           NVARCHAR (30)  NULL,
    CONSTRAINT [PK_DimK12Courses] PRIMARY KEY CLUSTERED ([DimK12CourseId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Courses_CourseTitle]
    ON [RDS].[DimK12Courses]([CourseTitle] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'AdvancedPlacementCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Course areas for advanced placement or credit.  For a list of codes see http://apcentral.collegeboard.com/apc/public/courses/teachers_corner/index.html .' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'AdvancedPlacementCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Advanced Placement Course Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'AdvancedPlacementCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001278' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'AdvancedPlacementCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22244' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'AdvancedPlacementCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The career cluster that defines the industry or occupational focus which may be associated with a career pathways program, plan of study, or course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Cluster' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001288' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22254' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The career cluster that defines the industry or occupational focus which may be associated with a career pathways program, plan of study, or course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Cluster' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001288' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22254' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CareerClusterDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCertificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the certification or recognition associated with this course (ex. Networking, CAD, etc.)' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCertificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Certification Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCertificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001302' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCertificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22268' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCertificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Code System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000056' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21056' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Code System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000056' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21056' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of credit (unit, semester, or quarter) associated with the credit hours earned for the course. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Units' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000057' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21057' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of credit (unit, semester, or quarter) associated with the credit hours earned for the course. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Units' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000057' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21057' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Department with jurisdiction over this course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Department Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001549' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22525' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the course content and/or goals. Reference may be made to state or national content standards.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000517' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21508' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A program through which the course is funded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Funding Program' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001306' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22272' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000055' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21055' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, and language arts).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000067' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21067' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CourseTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CreditValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of credit available to the student who successfully meets the objectives of the course or learning opportunity based on the units defined by Credit Unit Type.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CreditValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credit Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CreditValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000058' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CreditValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21058' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'CreditValue';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'TuitionFunded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that tuition for person''s participation in a program, service, or course is funded or partially funded by an external grant program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'TuitionFunded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Tuition Funded' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'TuitionFunded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001575' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'TuitionFunded';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22554' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Courses', @level2type=N'COLUMN',@level2name=N'TuitionFunded';
GO