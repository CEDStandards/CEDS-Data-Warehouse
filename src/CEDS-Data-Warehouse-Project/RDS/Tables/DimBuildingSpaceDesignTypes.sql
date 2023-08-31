CREATE TABLE [RDS].[DimBuildingSpaceDesignTypes] (
    [DimBuildingSpaceDesignTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [BuildingSpaceDesignTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimBuildingSpaceDesignTypes_BuildingSpaceDesignTypeCode] DEFAULT ('MISSING') NOT NULL,
    [BuildingSpaceDesignTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimBuildingSpaceDesignTypes_BuildingSpaceDesignTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimBuildingSpaceDesignTypes] PRIMARY KEY CLUSTERED ([DimBuildingSpaceDesignTypeId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary design or purpose of a space, as determined by its physical layout and built-in systems and equipment, regardless of its current use.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Space Design Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001831' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22812' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary design or purpose of a space, as determined by its physical layout and built-in systems and equipment, regardless of its current use.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Space Design Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001831' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22812' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimBuildingSpaceDesignTypes', @level2type=N'COLUMN',@level2name=N'BuildingSpaceDesignTypeDescription';
GO