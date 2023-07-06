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

