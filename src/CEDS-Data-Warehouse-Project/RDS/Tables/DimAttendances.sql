CREATE TABLE [RDS].[DimAttendances] (
    [DimAttendanceId]        INT            IDENTITY (1, 1) NOT NULL,
    [ChronicStudentAbsenteeismIndicatorCode]        NVARCHAR (50)  NULL,
    [ChronicStudentAbsenteeismIndicatorDescription] NVARCHAR (200) NULL,
    [ChronicStudentAbsenteeismIndicatorEdFactsCode] NVARCHAR (50)  NULL,
    [AttendanceEventTypeCode] NVARCHAR (50) NULL,
    [AttendanceEventTypeDescription] NVARCHAR (200) NULL,
    [AttendanceStatusCode] NVARCHAR (50) NULL,
    [AttendanceStatusDescription] NVARCHAR (200) NULL,
    [PresentAttendanceCategoryCode] NVARCHAR (50) NULL,
    [PresentAttendanceCategoryDescription] NVARCHAR (200) NULL,
    [AbsentAttendanceCategoryCode] NVARCHAR (50) NULL,
    [AbsentAttendanceCategoryDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimAttendances] PRIMARY KEY CLUSTERED ([DimAttendanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a student was absent 10% or more school days during the school year with an absence being defined as a student not physically on school grounds and was not participating in instruction or instruction-related activities at an approved off-grounds location for at least half the school day.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Chronic Student Absenteeism Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002022' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002022' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a student was absent 10% or more school days during the school year with an absence being defined as a student not physically on school grounds and was not participating in instruction or instruction-related activities at an approved off-grounds location for at least half the school day.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Chronic Student Absenteeism Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002022' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002022' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a student was absent 10% or more school days during the school year with an absence being defined as a student not physically on school grounds and was not participating in instruction or instruction-related activities at an approved off-grounds location for at least half the school day.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Chronic Student Absenteeism Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002022' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002022' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'ChronicStudentAbsenteeismIndicatorEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of attendance event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000601' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000601' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of attendance event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000601' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000601' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of a person''s attendance associated with an Attendance Event Type and Attendance Event Date in an organization-person-role context.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of a person''s attendance associated with an Attendance Event Type and Attendance Event Date in an organization-person-role context.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category that describes how the student spends his or her time when attending an instructional program approved by the state and/or school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Present Attendance Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000600' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000600' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category that describes how the student spends his or her time when attending an instructional program approved by the state and/or school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Present Attendance Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000600' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000600' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'PresentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category that describes how the student spends his or her time not physically present on school grounds and not participating in instruction or instruction-related activities at an approved off-grounds location.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Absent Attendance Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000599' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000599' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category that describes how the student spends his or her time not physically present on school grounds and not participating in instruction or instruction-related activities at an approved off-grounds location.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Absent Attendance Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000599' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000599' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAttendances', @level2type=N'COLUMN',@level2name=N'AbsentAttendanceCategoryDescription';
GO