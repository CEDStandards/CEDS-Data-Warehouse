CREATE TABLE [RDS].[BridgeK12StaffCourseSectionSeaFinancialAccountClassifications]
(
	[BridgeK12StaffCourseSectionSeaFinancialAccountClassificationId] int NOT NULL IDENTITY (1, 1),
	[FactK12StaffCourseSectionId] BIGINT NULL,
	[SeaFinancialAccountClassificationId] int NULL,
    [CourseFundingProgram]           NVARCHAR (40)  NOT NULL,
    [CourseFundingProgramAllowed]    NVARCHAR (50)  NOT NULL,
	CONSTRAINT [PK_BridgeK12StaffCourseSectionSeaFinancialAccountClassifications] PRIMARY KEY CLUSTERED ([BridgeK12StaffCourseSectionSeaFinancialAccountClassificationId] ASC),
	CONSTRAINT [FK_BridgeK12StaffCourseSectionSeaFinancialAccountClassifications_FactK12StaffCourseSectionId] FOREIGN KEY ([FactK12StaffCourseSectionId]) REFERENCES [RDS].[FactK12StaffCourseSections] ([FactK12StaffCourseSectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeK12StaffCourseSectionSeaFinancialAccountClassifications_SeaFinancialAccountClassificationId] FOREIGN KEY ([SeaFinancialAccountClassificationId]) REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCourseSectionSeaFinancialAccountClassifications_DimSeaFinancialAccountClassifications] 
 ON [RDS].[BridgeK12StaffCourseSectionSeaFinancialAccountClassifications] ([SeaFinancialAccountClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StaffCourseSectionSeaFinancialAccountClassifications_FactK12StaffCourseSections] 
 ON [RDS].[BridgeK12StaffCourseSectionSeaFinancialAccountClassifications] ([FactK12StaffCourseSectionId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A program through which the course is funded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Funding Program' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001306' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001306' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of permission for allocation of a course funding program''s funds for the support of a course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Funding Program Allowed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002065' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002065' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgeK12StaffCourseSectionSeaFinancialAccountClassifications', @level2type=N'COLUMN',@level2name=N'CourseFundingProgramAllowed';
GO