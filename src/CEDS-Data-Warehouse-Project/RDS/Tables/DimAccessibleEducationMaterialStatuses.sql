CREATE TABLE [RDS].[DimAccessibleEducationMaterialStatuses]
(
	[DimAccessibleEducationMaterialStatusId] int NOT NULL IDENTITY (1, 1),
	[AccessibleFormatIssuedIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatIssuedIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatRequiredIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatRequiredIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimAccessibleEducationMaterialStatuses]	PRIMARY KEY CLUSTERED ([DimAccessibleEducationMaterialStatusId] ASC)
)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student was issued an accessible format according to their IEP or 504 Plan. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessible Format Issued Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student was issued an accessible format according to their IEP or 504 Plan. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessible Format Issued Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatIssuedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student requires an accessible format according to their IEP or 504 Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessible Format Required Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student requires an accessible format according to their IEP or 504 Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessible Format Required Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatRequiredIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An alternative manner or form that gives an eligible person access to the work when the copy or phonorecord in the accessible format is used exclusively by the eligible person to permit him or her to have access as feasibly and comfortably as a person without such disability (20 U.S.C. § 121(d)(1)).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessible Format Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002089' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002089' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An alternative manner or form that gives an eligible person access to the work when the copy or phonorecord in the accessible format is used exclusively by the eligible person to permit him or her to have access as feasibly and comfortably as a person without such disability (20 U.S.C. § 121(d)(1)).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Accessible Format Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002089' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002089' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAccessibleEducationMaterialStatuses', @level2type=N'COLUMN',@level2name=N'AccessibleFormatTypeDescription';
GO