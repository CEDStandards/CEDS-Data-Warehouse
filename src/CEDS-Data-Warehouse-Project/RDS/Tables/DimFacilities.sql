CREATE TABLE [RDS].[DimFacilities]
(
	[DimFacilityId] int NOT NULL IDENTITY (1, 1),
	[FacilitiesIdentifier] nvarchar(40) NULL,
	[FacilityBuildingName] nvarchar(60) NULL,
	[BuilidingSiteNumber] nvarchar(60) NULL,
	[BuildingArea] nvarchar(30) NULL,
	[TemperatureControlledBuildingArea] nvarchar(30) NULL,
	[BuildingNumberOfStories] int NULL,
	[BuildingYearBuilt] smallint NULL,
	[BuildingYearOfLastModernization] smallint NULL,
	[FacilityBlockNumberArea] nvarchar(60) NULL,
	[FacilityCensusTract] nchar(11) NULL,
	[FacilityConstructionDate] date NULL,
	[FacilityConstructionDateTypeCode] nvarchar(50) NULL,
	[FacilityConstructionDateTypeDescription] nvarchar(200) NULL,
	[FacilityConstructionYear] smallint NULL,
	[FacilityExpectedLife] tinyint NULL,
	[FacilitySiteArea] decimal(4,1) NULL,
	[FacilitySiteIdentifier] nvarchar(20) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilities] 
 ADD CONSTRAINT [PK_DimFacilities]
	PRIMARY KEY CLUSTERED ([DimFacilityId] ASC)
GO