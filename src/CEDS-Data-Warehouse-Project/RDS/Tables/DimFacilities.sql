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


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The sum of the areas at each floor level included within the principal outside faces of exterior walls, including roofed areas with finished floors that may not have exterior walls, but are connected to the main building. This sum should include all stories or areas having floor surfaces with clear standing head room (6.5 feet or 1.98 meters) but omit architectural setbacks or projections.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Area' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001764' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001764' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingNumberOfStories';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of stories in a building, excluding the basement if its ceiling is less than three feet above ground level.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingNumberOfStories';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Number of Stories' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingNumberOfStories';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001785' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingNumberOfStories';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001785' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingNumberOfStories';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearBuilt';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year a building was constructed, as indicated by cornerstone or official government records.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearBuilt';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Year Built' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearBuilt';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001788' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearBuilt';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001788' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearBuilt';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearOfLastModernization';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The most recent year that a comprehensive upgrade of ALL major building systems and components was completed, such that it functions as a modern building, as measured by a facility condition index not greater than 15%.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearOfLastModernization';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Year of Last Modernization' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearOfLastModernization';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001789' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearOfLastModernization';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001789' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'BuildingYearOfLastModernization';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitiesIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A locally assigned unique number or alphanumeric code used to capture precise information on locations specific to a school (e.g., building number, class number, hall number, school bus number, computer station number, or internet protocol (IP) address).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitiesIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facilities Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitiesIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000504' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitiesIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000504' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitiesIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBlockNumberArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The informal description of location sometimes used in rural areas, for example, "from the highway to the railroad tracks."' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBlockNumberArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Block Number Area' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBlockNumberArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001774' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBlockNumberArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001774' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBlockNumberArea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBuildingName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full, legally accepted or popularly accepted name of a building.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBuildingName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Building Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBuildingName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001205' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBuildingName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001205' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityBuildingName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityCensusTract';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The census tract number of the school site.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityCensusTract';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Census Tract' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityCensusTract';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityCensusTract';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityCensusTract';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month, day, and year on which construction of a building, addition, or improvement was completed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Construction Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year the building was first constructed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Construction Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001771' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001771' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityExpectedLife';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time, in years, of the expected useful life of a facility for the purposes of depreciation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityExpectedLife';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Expected Life' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityExpectedLife';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001783' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityExpectedLife';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001783' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityExpectedLife';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The total number of acres in a continuous piece of land, to the nearest tenth, including undeveloped areas as well as areas occupied by buildings, walks, drives, parking facilities, and other improvements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Site Area' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001773' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001773' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteArea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The lot and square number, or equivalent unique municipal number identification, of a parcel of land.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Site Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001786' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001786' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilitySiteIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'TemperatureControlledBuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The sum of the Building Area capable of being regulated and maintained within a specific temperature range for a designated purpose, employing heating, cooling, insulation, or climate control systems.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'TemperatureControlledBuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Temperature Controlled Building Area' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'TemperatureControlledBuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002024' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'TemperatureControlledBuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002024' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'TemperatureControlledBuildingArea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Designation of the nature of the construction completion date.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Construction Date Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001781' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001781' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Designation of the nature of the construction completion date.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Construction Date Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001781' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001781' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilities', @level2type=N'COLUMN',@level2name=N'FacilityConstructionDateTypeDescription';
GO