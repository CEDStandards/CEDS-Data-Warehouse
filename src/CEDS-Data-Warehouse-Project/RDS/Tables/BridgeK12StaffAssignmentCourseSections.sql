CREATE TABLE [RDS].[BridgeK12StaffAssignmentCourseSections]
(
	[BridgeK12StaffAssignmentCourseSectionId] int NOT NULL IDENTITY (1, 1),
	[K12CourseId] int NULL,
	[FactK12StaffAssignmentId] int NULL,
	CONSTRAINT [PK_BridgeK12StaffAssignmentCourseSections] PRIMARY KEY CLUSTERED ([BridgeK12StaffAssignmentCourseSectionId] ASC),
	CONSTRAINT [FK_BridgeK12StaffAssignmentCourseSections_FactK12StaffAssignmentId]	FOREIGN KEY ([FactK12StaffAssignmentId]) REFERENCES [RDS].[FactK12StaffAssignments] ([FactK12StaffAssignmentId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffAssignmentCourseSections_K12CourseId] FOREIGN KEY ([K12CourseId]) REFERENCES [RDS].[DimK12Courses] ([DimK12CourseId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentCourseSections_DimK12Courses] 
 ON [RDS].[BridgeK12StaffAssignmentCourseSections] ([K12CourseId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffAssignmentCourseSections_FactK12StaffAssignments] 
 ON [RDS].[BridgeK12StaffAssignmentCourseSections] ([FactK12StaffAssignmentId] ASC)
GO