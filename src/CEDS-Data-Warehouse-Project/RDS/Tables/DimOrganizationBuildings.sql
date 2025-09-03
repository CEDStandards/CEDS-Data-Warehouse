CREATE TABLE [RDS].[DimOrganizationBuildings](
    [DimOrganizationBuildingId]       INT            IDENTITY (1, 1) NOT NULL,
	[FacilitiesIdentifier] [int] NOT NULL,
	[FacilityBuildingName] [varchar](250) NULL,
	[AddressStreetNumberAndName] [varchar](50) NULL,
	[AddressApartmentRoomOrSuiteNumber] [varchar](50) NULL,
	[AddressCity] [varchar](50) NULL,
	[StateAbbreviation] [varchar](4) NULL,
	[AddressPostalCode] [varchar](10) NULL,
	[BuildingLocationId] [int] NULL,
	[BuildingStartDate] [datetime] NULL,
	[BuildingStopDate] [datetime] NULL,
	[BuildingDesignTypeCode] [int] NULL,
	[BuildingSpaceUtilizationArea] [int] NULL,

 CONSTRAINT [PK_DimOrganizationBuilding] PRIMARY KEY NONCLUSTERED 
(
	[DimOrganizationBuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]