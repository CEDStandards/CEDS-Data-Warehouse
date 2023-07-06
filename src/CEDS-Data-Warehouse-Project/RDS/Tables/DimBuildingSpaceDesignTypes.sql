CREATE TABLE [RDS].[DimBuildingSpaceDesignTypes] (
    [DimBuildingSpaceDesignTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [BuildingSpaceDesignTypeCode]        NVARCHAR (100) NOT NULL,
    [BuildingSpaceDesignTypeDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimBuildingSpaceDesignTypes] PRIMARY KEY CLUSTERED ([DimBuildingSpaceDesignTypeId] ASC)
);


GO

