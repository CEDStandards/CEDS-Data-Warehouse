CREATE TABLE [RDS].[DimPersonAddresses] (
    [DimPersonAddressId]                         INT            IDENTITY (1, 1) NOT NULL,
    [AddressTypeForLearnerOrFamilyCode]          NVARCHAR (50)  NULL,
    [AddressTypeForLearnerOrFamilyDescription]   NVARCHAR (150) NULL,
    [AddressStreetNumberAndName]                 NVARCHAR (150) NULL,
    [AddressApartmentRoomOrSuiteNumber]          NVARCHAR (60)  NULL,
    [AddressCity]                                NVARCHAR (30)  NULL,
    [StateAbbreviationCode]                      NVARCHAR (50)  NULL,
    [StateAbbreviationDescription]               NVARCHAR (150) NULL,
    [AddressPostalCode]                          NVARCHAR (17)  NULL,
    [AddressCountyName]                          NVARCHAR (30)  NULL,
    [CountryCodeCode]                            NVARCHAR (50)  NULL,
    [CountryCodeDescription]                     NVARCHAR (150) NULL,
    [Latitude]                                   NVARCHAR (20)  NULL,
    [Longitude]                                  NVARCHAR (20)  NULL,
    [CountyAnsiCodeCode]                         NVARCHAR (50)  NULL,
    [CountyAnsiCodeDescription]                  NVARCHAR (150) NULL,
    [DoNotPublishIndicator]                      NVARCHAR (10)  NULL,
    [PersonalInformationVerificationCode]        NVARCHAR (50)  NULL,
    [PersonalInformationVerificationDescription] NVARCHAR (150) NULL,
    CONSTRAINT [PK_DimPersonAddresses] PRIMARY KEY CLUSTERED ([DimPersonAddressId] ASC)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The apartment, room, or suite number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Apartment Room or Suite Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the county, parish, borough, or comparable unit (within a state) in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address County Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000190' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21190' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressCountyName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The street number and street name or post office box number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Street Number and Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of address listed for a learner or a parent, guardian, family member or related person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Type for Learner or Family' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000010' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21358' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of address listed for a learner or a parent, guardian, family member or related person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Type for Learner or Family' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000010' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21358' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'AddressTypeForLearnerOrFamilyDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique two character International Organization for Standardization (ISO) code for the country in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Country Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000050' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21050' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique two character International Organization for Standardization (ISO) code for the country in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Country Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000050' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21050' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountryCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'County code as defined for the identification of counties and equivalent areas of the United States, Puerto Rico, and the insular areas as established by the American National Standards Institute (ANSI) Inter-National Committee for Information Technology Standards (INCITS) in specification BSR INCITS 31-200x or more current updates. See https://www.census.gov/library/reference/code-lists/ansi.html#par_statelist.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'County ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001209' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22176' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'County code as defined for the identification of counties and equivalent areas of the United States, Puerto Rico, and the insular areas as established by the American National Standards Institute (ANSI) Inter-National Committee for Information Technology Standards (INCITS) in specification BSR INCITS 31-200x or more current updates. See https://www.census.gov/library/reference/code-lists/ansi.html#par_statelist.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'County ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001209' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22176' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'CountyAnsiCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'DoNotPublishIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the record should not be published.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'DoNotPublishIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Do Not Publish Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'DoNotPublishIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'DoNotPublishIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22905' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'DoNotPublishIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The north or south angular distance from the equator that, when combined with longitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Latitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000606' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21599' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The east or west angular distance from the prime meridian that, when combined with latitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Longitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000607' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21600' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The evidence by which a persons name, address, date of birth, etc. is confirmed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Personal Information Verification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000618' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21611' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The evidence by which a persons name, address, date of birth, etc. is confirmed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Personal Information Verification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000618' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21611' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'PersonalInformationVerificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPersonAddresses', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO