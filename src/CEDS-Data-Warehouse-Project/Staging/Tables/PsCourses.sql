CREATE TABLE [Staging].[PsCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseIdentifier] [nvarchar](40) NOT NULL,
	[CourseCodeSystemCode] [nvarchar](50) NOT NULL,
	[CourseCodeSystemDescription] [nvarchar](200) NOT NULL,
	[CourseTitle] [nvarchar](60) NOT NULL,
	[CourseDescription] [nvarchar](1024) NOT NULL,
	[CourseSubjectAbbreviation] [nvarchar](10) NOT NULL,
	[CourseNumber] [nvarchar](30) NOT NULL,
	[CourseDepartmentName] [nvarchar](60) NOT NULL,
	[CourseCreditUnitsCode] [nvarchar](50) NOT NULL,
	[CourseCreditUnitsDescription] [nvarchar](200) NOT NULL,
	[CreditValue] [decimal](4, 2) NOT NULL,
	[RecordStartDateTime] [datetime] NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_PsCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000055' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000055' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Code System' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Code System' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCodeSystemDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, and language arts).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Title' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000067' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000067' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the course content and/or goals. Reference may be made to state or national content standards.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Description' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000517' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000517' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The alphabetic abbreviation of the academic department or discipline offering the course. It is one part of the total course identifier number.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseSubjectAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Subject Abbreviation' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseSubjectAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000066' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseSubjectAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000066' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseSubjectAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseSubjectAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The official reference number portion of a course identifier. This number normally designates the level of the course as well as the level of the individual expected to enroll in the course.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001314' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001314' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Department with jurisdiction over this course.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Department Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001549' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001549' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseDepartmentName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of credit (unit, semester, or quarter) associated with the credit hours earned for the course. ' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Units' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000057' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000057' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of credit (unit, semester, or quarter) associated with the credit hours earned for the course. ' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Credit Units' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000057' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000057' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CourseCreditUnitsDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of credit available to the student who successfully meets the objectives of the course or learning opportunity based on the units defined by Credit Unit Type.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CreditValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credit Value' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CreditValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000058' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CreditValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000058' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CreditValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsCourses', @level2type=N'COLUMN',@level2name=N'CreditValue'
GO


