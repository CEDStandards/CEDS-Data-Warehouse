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
