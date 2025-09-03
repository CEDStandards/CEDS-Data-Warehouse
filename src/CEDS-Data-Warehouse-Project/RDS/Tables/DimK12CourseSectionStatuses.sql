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
	[VirtualIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[VirtualIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimK12CourseSectionStatuses] PRIMARY KEY CLUSTERED ([DimK12CourseSectionStatusId] ASC)
)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A type of formal education program in which a student learns at least in part through online learning, with some element of student control over time, place, path, and/or pace; at least in part in a supervised brick-and-mortar location away from home; and the modalities along each students learning path within a course or subject are connected to provide an integrated learning experience.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Blended Learning Model Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A type of formal education program in which a student learns at least in part through online learning, with some element of student control over time, place, path, and/or pace; at least in part in a supervised brick-and-mortar location away from home; and the modalities along each students learning path within a course or subject are connected to provide an integrated learning experience.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Blended Learning Model Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'BlendedLearningModelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary type of interaction, synchronous or asynchronous, defined for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Interaction Mode' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001311' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001311' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary type of interaction, synchronous or asynchronous, defined for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Interaction Mode' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001311' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001311' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseInteractionModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method that the instructor of the course uses to report the performance and achievement of all students. It may be a qualitative method such as individualized teacher comments or a quantitative method such as a letter or a numerical grade. In some cases, more than one type of reporting method may be used.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Assessment Reporting Method' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000027' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000027' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method that the instructor of the course uses to report the performance and achievement of all students. It may be a qualitative method such as individualized teacher comments or a quantitative method such as a letter or a numerical grade. In some cases, more than one type of reporting method may be used.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Assessment Reporting Method' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000027' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000027' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionAssessmentReportingMethodDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary setting or medium of delivery for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Instructional Delivery Mode' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary setting or medium of delivery for the course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Section Instructional Delivery Mode' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001161' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'CourseSectionInstructionalDeliveryModeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of location at which instruction or service takes place.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Receiving Location Of Instruction' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000524' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000524' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of location at which instruction or service takes place.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Receiving Location Of Instruction' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000524' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000524' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'ReceivingLocationOfInstructionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a childcare, early education, or early learning program, school, institution, program, or course section focuses primarily on instruction in which children and teachers are separated by time and/or location and interact through the use of computers and/or telecommunications technology.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a childcare, early education, or early learning program, school, institution, program, or course section focuses primarily on instruction in which children and teachers are separated by time and/or location and interact through the use of computers and/or telecommunications technology.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001160' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12CourseSectionStatuses', @level2type=N'COLUMN',@level2name=N'VirtualIndicatorDescription';
GO




