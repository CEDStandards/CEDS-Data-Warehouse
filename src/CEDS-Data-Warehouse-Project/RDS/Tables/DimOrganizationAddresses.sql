CREATE TABLE [RDS].[DimOrganizationAddresses]
(
	[DimOrganizationAddressId] INT NOT NULL IDENTITY (1, 1),
	[AddressStreetNumberAndName] NVARCHAR(150) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[AddressApartmentRoomOrSuiteNumber] VARCHAR(40) NULL,	-- See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.
	[BuildingSiteNumber] NVARCHAR(60) NULL,
	[AddressCity] NVARCHAR(30) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[AddressStateAbbreviation] NVARCHAR(50) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[AddressPostalCode] NVARCHAR(17) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[CountyAnsiCodeCode] CHAR(5) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[AddressCountyName] NVARCHAR(30) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[Latitude] NVARCHAR(20) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[Longitude] NVARCHAR(20) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[AddressTypeForOrganizationCode] NVARCHAR(50) NOT NULL,
	[AddressTypeForOrganizationDescription] NVARCHAR(300) NOT NULL,
	[RecordStartDateTime] DATETIME NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[RecordEndDateTime] DATETIME NULL	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimOrganizationAddresses] 
 ADD CONSTRAINT [PK_DimOrganizationAddresses]
	PRIMARY KEY CLUSTERED ([DimOrganizationAddressId] ASC)
GO

/* Create Table Comments */

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of address listed for an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Type for Organization' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001066' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001066' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of address listed for an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Type for Organization' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001066' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001066' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForOrganizationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'County code as defined for the identification of counties and equivalent areas of the United States, Puerto Rico, and the insular areas as established by the American National Standards Institute (ANSI) Inter-National Committee for Information Technology Standards (INCITS) in specification BSR INCITS 31-200x or more current updates. See https://www.census.gov/library/reference/code-lists/ansi.html#par_statelist.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'County ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001209' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001209' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The apartment, room, or suite number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Apartment Room or Suite Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the county, parish, borough, or comparable unit (within a state) in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address County Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000190' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000190' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The street number and street name or post office box number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Street Number and Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'BuildingSiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of the building on the site, if more than one building shares the same address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'BuildingSiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Building Site Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'BuildingSiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000602' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'BuildingSiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000602' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'BuildingSiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The north or south angular distance from the equator that, when combined with longitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Latitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000606' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000606' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The east or west angular distance from the prime meridian that, when combined with latitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Longitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000607' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000607' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimOrganizationAddresses', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
