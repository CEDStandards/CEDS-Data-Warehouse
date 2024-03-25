CREATE TABLE [dbo].[DimPsCourses]
(
    [DimPsCourseId]                               INT               IDENTITY (1, 1) NOT NULL
  , [AgencyCourseIdentifier]                      NVARCHAR(40) NULL
  , [NCESCollegeCourseMapCodeCode]                NVARCHAR(7) NULL
  , [NCESCollegeCourseMapCodeDescription]         NVARCHAR(200) NULL
  , [CourseSubjectAbbreviation]                   NVARCHAR(10) NULL
  , [PostsecondaryCourseTitle]                    NVARCHAR(60) NULL
  , [CourseCreditUnitsCode]                       NVARCHAR(50) NULL
  , [CourseCreditUnitsDescription]                NVARCHAR(50) NULL
  , [CreditValue]                                 DECIMAL (10, 2) NULL
  , [CourseBeginDate]                             DATETIME NULL
  , [CourseEndDate]                               DATETIME NULL
    CONSTRAINT [PK_DimPsCourses] PRIMARY KEY CLUSTERED ([DimPsCourseId] ASC) WITH (DATA_COMPRESSION = PAGE)
)
