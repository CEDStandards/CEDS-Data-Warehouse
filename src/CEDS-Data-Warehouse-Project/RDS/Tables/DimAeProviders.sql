CREATE TABLE [RDS].[DimAeProviders] (
    [DimAeProviderId]                           INT             IDENTITY (1, 1) NOT NULL,
    [AeServiceProviderIdentifierSea]            NVARCHAR (50)   NULL,
    [NameOfInstitution]                         NVARCHAR (1000) NULL,
    [ShortNameOfInstitution]                    NVARCHAR (30)   NULL,
    [AdultEducationProviderTypeCode]            NVARCHAR (50)   NULL,
    [AdultEducationProviderTypeDescription]     NVARCHAR (150)  NULL,
    [LevelOfInstitutionCode]                    NVARCHAR (50)   NULL,
    [LevelOfInstitutionDescription]             NVARCHAR (150)  NULL,
    [TelephoneNumber]                           NVARCHAR (24)   NULL,
    [WebSiteAddress]                            NVARCHAR (300)  NULL,
    [MailingAddressStreetNumberAndName]         NVARCHAR (150)  NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  NVARCHAR (60)   NULL,
    [MailingAddressCity]                        NVARCHAR (30)   NULL,
    [MailingAddressStateAbbreviation]           NVARCHAR (50)   NULL,
    [MailingAddressPostalCode]                  NVARCHAR (17)   NULL,
    [MailingAddressCountyAnsiCodeCode]          NVARCHAR (50)   NULL,
    [PhysicalAddressStreetNumberAndName]        NVARCHAR (150)  NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] NVARCHAR (60)   NULL,
    [PhysicalAddressCity]                       NVARCHAR (30)   NULL,
    [PhysicalAddressStateAbbreviation]          NVARCHAR (50)   NULL,
    [PhysicalAddressPostalCode]                 NVARCHAR (17)   NULL,
    [PhysicalAddressCountyAnsiCodeCode]         NVARCHAR (50)   NULL,
    [Latitude]                                  NVARCHAR (20)   NULL,
    [Longitude]                                 NVARCHAR (20)   NULL,
    [RecordStartDateTime]                       DATETIME        NULL,
    [RecordEndDateTime]                         DATETIME        NULL,
    CONSTRAINT [PK_DimAeProviders] PRIMARY KEY CLUSTERED ([DimAeProviderId] ASC)
);


GO

