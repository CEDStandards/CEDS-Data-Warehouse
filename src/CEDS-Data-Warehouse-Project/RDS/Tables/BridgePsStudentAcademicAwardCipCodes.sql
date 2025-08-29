CREATE TABLE [RDS].[BridgePsStudentAcademicAwardCipCodes](
	[BridgePsStudentAcademicAwardCipCodeId] [int] IDENTITY(1,1) NOT NULL,
	[FactPsStudentAcademicAwardId] [int] NULL,
	[CipCodeId] [int] NULL,
	[PostsecondaryProgramLevelCode] [nvarchar](50) NOT NULL,
	[PostsecondaryProgramLevelDescription] [nvarchar](200) NOT NULL,
    CONSTRAINT [PK_BridgePsStudentAcademicAwardCipCodes] PRIMARY KEY CLUSTERED ([BridgePsStudentAcademicAwardCipCodeId] ASC),
    CONSTRAINT [FK_BridgePsStudentAcademicAwardCipCodes_FactPsStudentAcademicAwardId] FOREIGN KEY ([FactPsStudentAcademicAwardId]) REFERENCES [RDS].[FactPsStudentAcademicAwards] ([FactPsStudentAcademicAwardId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_BridgePsStudentAcademicAwardCipCodes_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentAcademicAwardCipCodes_FactPsStudentAcademicAwardId] 
  ON [RDS].[BridgePsStudentAcademicAwardCipCodes] ([FactPsStudentAcademicAwardId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgePsStudentAcademicAwardCipCodes_CipCodeId] 
  ON [RDS].[BridgePsStudentAcademicAwardCipCodes] ([CipCodeId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The level describing the concentration of study for a postsecondary program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Postsecondary Program Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001616' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001616' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The level describing the concentration of study for a postsecondary program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Postsecondary Program Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001616' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001616' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'BridgePsStudentAcademicAwardCipCodes', @level2type=N'COLUMN',@level2name=N'PostsecondaryProgramLevelDescription';
GO