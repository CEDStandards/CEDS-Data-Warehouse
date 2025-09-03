CREATE TABLE [RDS].[DimAlternativeSchoolStatuses]
(
	[DimAlternativeSchoolStatusId] int NOT NULL IDENTITY (1, 1),
	[AlternativeSchoolFocusTypeCode] nvarchar(50) NOT NULL,
	[AlternativeSchoolFocusTypeDescription] nvarchar(1000) NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimAlternativeSchoolStatuses] 
 ADD CONSTRAINT [PK_DimAlternativeSchoolStatuses]
	PRIMARY KEY CLUSTERED ([DimAlternativeSchoolStatusId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the specific group of students whose needs the alternative school is designed to meet.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Alternative School Focus Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000015' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000015' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the specific group of students whose needs the alternative school is designed to meet.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Alternative School Focus Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000015' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000015' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAlternativeSchoolStatuses', @level2type=N'COLUMN',@level2name=N'AlternativeSchoolFocusTypeDescription';
GO