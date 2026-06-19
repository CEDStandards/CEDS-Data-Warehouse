CREATE TABLE [RDS].[DimBuildingTypes](
	[DimBuildingTypeId]       INT            IDENTITY (1, 1) NOT NULL,
	[BuildingDesignTypeCode] [int] NOT NULL,
	[BuildingDesignTypeCode] [varchar](50) NULL,
	[BuildingDesignTypeDescription] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_BuildingTypeID] PRIMARY KEY NONCLUSTERED 
(
	[DimBuildingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]