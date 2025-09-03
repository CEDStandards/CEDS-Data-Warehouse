CREATE TABLE [RDS].[DimK12CourseSectionEnrollmentStatuses]
(
	[DimK12CourseSectionEnrollmentStatusId] int NOT NULL IDENTITY (1, 1),
	[CourseSectionEnrollmentStatusTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CourseSectionEnrollmentStatusTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CourseSectionEntryTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CourseSectionEntryTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CourseSectionExitTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CourseSectionExitTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimK12CourseSectionEnrollmentStatuses] PRIMARY KEY CLUSTERED ([DimK12CourseSectionEnrollmentStatusId] ASC)
)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status related to a student enrollment in an instance of a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Enrollment Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000976' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000976' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status related to a student enrollment in an instance of a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Enrollment Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000976' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000976' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEnrollmentStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The process by which a student enters a school (Course Section) during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Entry Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000650' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000650' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The process by which a student enters a school (Course Section) during a given academic session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Entry Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000650' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000650' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionEntryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in a course section.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000652' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000652' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The circumstances under which the student exited from membership in a course section.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000652' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000652' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionEnrollmentStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionExitTypeDescription';
GO