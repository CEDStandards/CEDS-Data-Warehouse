CREATE TABLE [RDS].[DimK12CourseSectionStatuses]
(
	[DimK12CourseSectionStatusId] int NOT NULL IDENTITY (1, 1),
	[BlendedLearningModelTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[BlendedLearningModelTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CourseInteractionModeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CourseInteractionModeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CourseSectionAssessmentReportingMethodCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CourseSectionAssessmentReportingMethodDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CourseSectionInstructionalDeliveryModeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CourseSectionInstructionalDeliveryModeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[ReceivingLocationOfInstructionCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[ReceivingLocationOfInstructionDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimK12CourseSectionStatuses] PRIMARY KEY CLUSTERED ([DimK12CourseSectionStatusId] ASC)
)
GO