CREATE TABLE [RDS].[DimK12StaffAssignmentStatuses]
(
	[DimK12StaffAssignmentStatusId] int NOT NULL IDENTITY (1, 1),
	[ItinerantTeacherCode] varchar(50) NOT NULL,
	[ItinerantTeacherDescription] varchar(200) NOT NULL,
	[ClassroomPositionTypeCode] varchar(50) NOT NULL,
	[ClassroomPositionTypeDescription] varchar(200) NOT NULL,
	[PrimaryAssignmentIndicatorCode] varchar(50) NOT NULL,
	[PrimaryAssignmentIndicatorDescription] varchar(200) NOT NULL,
	CONSTRAINT [PK_DimK12StaffAssignmentStatuses] PRIMARY KEY CLUSTERED ([DimK12StaffAssignmentStatusId] ASC)
)
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a teacher provides instruction in more than one instructional site.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Itinerant Teacher' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a teacher provides instruction in more than one instructional site.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Itinerant Teacher' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ItinerantTeacherDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of position the staff member holds in the specific course section.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classroom Position Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000622' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000622' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of position the staff member holds in the specific course section.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classroom Position Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000622' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000622' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the assignment is the staff member''s primary assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Assignment Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000525' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000525' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the assignment is the staff member''s primary assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Assignment Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000525' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000525' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffAssignmentStatuses', @level2type=N'COLUMN',@level2name=N'PrimaryAssignmentIndicatorDescription';
GO



