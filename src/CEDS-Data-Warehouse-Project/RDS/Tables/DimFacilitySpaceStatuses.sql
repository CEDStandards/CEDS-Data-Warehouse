CREATE TABLE [RDS].[DimFacilitySpaceStatuses]
(
	[DimFacilitySpaceStatusId] int NOT NULL IDENTITY (1, 1),
	[FacilitySpaceUseTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[FacilitySpaceUseTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING'
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilitySpaceStatuses] 
 ADD CONSTRAINT [PK_DimFacilitySpaceStatuses]
	PRIMARY KEY CLUSTERED ([DimFacilitySpaceStatusId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary use of a space, as determined by its physical layout and built-in systems and equipment, regardless of its original design.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Space Use Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001208' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001208' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary use of a space, as determined by its physical layout and built-in systems and equipment, regardless of its original design.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Space Use Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001208' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001208' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilitySpaceStatuses', @level2type=N'COLUMN',@level2name=N'FacilitySpaceUseTypeDescription';
GO