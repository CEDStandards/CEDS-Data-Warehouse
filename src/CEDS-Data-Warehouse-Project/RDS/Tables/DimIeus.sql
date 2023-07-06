CREATE TABLE [RDS].[DimIeus] (
    [DimIeuId]                                  INT             IDENTITY (1, 1) NOT NULL,
    [IeuOrganizationName]                       NVARCHAR (1000) NULL,
    [IeuOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [SeaOrganizationName]                       NVARCHAR (1000) NULL,
    [SeaOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [StateANSICode]                             NVARCHAR (10)   NULL,
    [StateAbbreviationCode]                     NVARCHAR (10)   NULL,
    [StateAbbreviationDescription]              NVARCHAR (1000) NULL,
    [MailingAddressStreetNumberAndName]         NVARCHAR (150)  NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  VARCHAR (40)    NULL,
    [MailingAddressCity]                        NVARCHAR (30)   NULL,
    [MailingAddressStateAbbreviation]           NVARCHAR (50)   NULL,
    [MailingAddressPostalCode]                  NVARCHAR (17)   NULL,
    [MailingAddressCountyAnsiCodeCode]          CHAR (5)        NULL,
    [OutOfStateIndicator]                       BIT             NOT NULL,
    [OrganizationOperationalStatus]             VARCHAR (20)    NULL,
    [OperationalStatusEffectiveDate]            DATETIME        NULL,
    [PhysicalAddressStreetNumberAndName]        NVARCHAR (150)  NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] VARCHAR (40)    NULL,
    [PhysicalAddressCity]                       NVARCHAR (30)   NULL,
    [PhysicalAddressPostalCode]                 NVARCHAR (17)   NULL,
    [PhysicalAddressStateAbbreviation]          NVARCHAR (50)   NULL,
    [PhysicalAddressCountyAnsiCodeCode]         CHAR (5)        NULL,
    [TelephoneNumber]                           NVARCHAR (24)   NULL,
    [WebSiteAddress]                            NVARCHAR (300)  NULL,
    [OrganizationRegionGeoJson]                 NVARCHAR (MAX)  NULL,
    [Latitude]                                  NVARCHAR (20)   NULL,
    [Longitude]                                 NVARCHAR (20)   NULL,
    [RecordStartDateTime]                       DATETIME        NOT NULL,
    [RecordEndDateTime]                         DATETIME        NULL,
    CONSTRAINT [PK_DimIeus] PRIMARY KEY CLUSTERED ([DimIeuId] ASC) WITH (FILLFACTOR = 80)
);


GO

