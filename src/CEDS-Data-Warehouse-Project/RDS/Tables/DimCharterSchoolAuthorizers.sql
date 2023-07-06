CREATE TABLE [RDS].[DimCharterSchoolAuthorizers] (
    [DimCharterSchoolAuthorizerId]                                  INT            IDENTITY (1, 1) NOT NULL,
    [CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea] NVARCHAR (MAX) NULL,
    [CharterSchoolAuthorizingOrganizationOrganizationName]          NVARCHAR (MAX) NULL,
    [CharterSchoolAuthorizingOrganizationTypeCode]                  NVARCHAR (50)  NULL,
    [CharterSchoolAuthorizingOrganizationTypeDescription]           NVARCHAR (100) NULL,
    [CharterSchoolAuthorizingOrganizationTypeEdfactsCode]           NVARCHAR (50)  NULL,
    [StateAbbreviationCode]                                         NVARCHAR (MAX) NULL,
    [StateANSICode]                                                 NVARCHAR (MAX) NULL,
    [StateAbbreviationDescription]                                  NVARCHAR (MAX) NULL,
    [MailingAddressStreetNumberAndName]                             NVARCHAR (150) NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]                      VARCHAR (40)   NULL,
    [MailingAddressCity]                                            NVARCHAR (30)  NULL,
    [MailingAddressPostalCode]                                      NVARCHAR (17)  NULL,
    [MailingAddressStateAbbreviation]                               NVARCHAR (50)  NULL,
    [MailingAddressCountyAnsiCodeCode]                              CHAR (5)       NULL,
    [PhysicalAddressStreetNumberAndName]                            NVARCHAR (150) NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber]                     VARCHAR (40)   NULL,
    [PhysicalAddressCity]                                           NVARCHAR (30)  NULL,
    [PhysicalAddressPostalCode]                                     NVARCHAR (17)  NULL,
    [PhysicalAddressStateAbbreviation]                              NVARCHAR (50)  NULL,
    [PhysicalAddressCountyAnsiCodeCode]                             CHAR (5)       NULL,
    [TelephoneNumber]                                               NVARCHAR (24)  NULL,
    [WebSiteAddress]                                                NVARCHAR (300) NULL,
    [OutOfStateIndicator]                                           BIT            NULL,
    [RecordStartDateTime]                                           DATETIME       NULL,
    [RecordEndDateTime]                                             DATETIME       NULL,
    CONSTRAINT [PK_DimCharterSchoolAuthorizers] PRIMARY KEY CLUSTERED ([DimCharterSchoolAuthorizerId] ASC) WITH (FILLFACTOR = 80)
);


GO

