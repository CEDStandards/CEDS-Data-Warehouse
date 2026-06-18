CREATE TABLE [RDS].[DimFacilityUtilization]
(
	[DimFacilityUtilizationStatusId] int NOT NULL IDENTITY (1, 1),
	[BuildingUseTypeCode] nvarchar(50) NOT NULL CONSTRAINT [DF_DimFacilityUtilization_BuildingUseTypeCode] DEFAULT ('MISSING'),
	[BuildingUseTypeDescription] nvarchar(300) NOT NULL CONSTRAINT [DF_DimFacilityUtilization_BuildingUseTypeDescription] DEFAULT ('MISSING'),
	[BuildingCommunityUseSpaceTypeCode] nvarchar(50) NOT NULL CONSTRAINT [DF_DimFacilityUtilization_BuildingCommunityUseSpaceTypeCode] DEFAULT ('MISSING'),
	[BuildingCommunityUseSpaceTypeDescription] nvarchar(300) NOT NULL CONSTRAINT [DF_DimFacilityUtilization_BuildingCommunityUseSpaceTypeDescription] DEFAULT ('MISSING')
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilityUtilization] 
 ADD CONSTRAINT [PK_DimFacilityUtilization]
	PRIMARY KEY CLUSTERED ([DimFacilityUtilizationStatusId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'How a building is principally used, regardless of its original design.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Use Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001206' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001206' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'How a building is principally used, regardless of its original design.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Use Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001206' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001206' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The space designed primarily for community or shared use.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Community Use Space Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001855' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001855' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The space designed primarily for community or shared use.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Community Use Space Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001855' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001855' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityUtilization', @level2type=N'COLUMN',@level2name=N'BuildingCommunityUseSpaceTypeDescription';
GO