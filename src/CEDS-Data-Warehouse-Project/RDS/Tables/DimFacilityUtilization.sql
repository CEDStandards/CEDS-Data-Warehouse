CREATE TABLE [RDS].[DimFacilityUtilization]
(
	[DimFacilityUtilizationStatusId] int NOT NULL IDENTITY (1, 1),
	[BuildingUseTypeCode] nvarchar(50) NOT NULL,
	[BuildingUseTypeDescription] nvarchar(300) NOT NULL
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