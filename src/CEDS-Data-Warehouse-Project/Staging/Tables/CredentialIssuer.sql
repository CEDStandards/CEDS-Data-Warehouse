CREATE TABLE [Staging].[CredentialIssuer](
    [Id]                                                            [int] IDENTITY(1,1) NOT NULL,
	[CredentialIssuerOrganizationName]                              [nvarchar](1000) NULL,
	[CredentialIssuerOrganizationIdentifierSea]                     [nvarchar](50) NULL,
	[SeaOrganizationName]                                           [nvarchar](1000) NULL,
	[SeaOrganizationIdentifierSea]                                  [nvarchar](50) NULL,
	[CTDLOrganizationTypeCode]                                      [nvarchar](50) NOT NULL,
	[CTDLOrganizationTypeDescription]                               [nvarchar](200) NOT NULL,
	[StateANSICode]                                                 [nvarchar](10) NULL,
	[StateAbbreviationCode]                                         [nvarchar](10) NULL,
	[StateAbbreviationDescription]                                  [nvarchar](1000) NULL,
	[MailingAddressStreetNumberAndName]                             [nvarchar](150) NULL,
	[MailingAddressApartmentRoomOrSuiteNumber]                      [nvarchar](40) NULL,
	[MailingAddressCity]                                            [nvarchar](30) NULL,
	[MailingAddressStateAbbreviation]                               [nvarchar](50) NULL,
	[MailingAddressPostalCode]                                      [nvarchar](17) NULL,
	[MailingAddressCountyAnsiCodeCode]                              [nchar](5) NULL,
	[OutOfStateIndicator]                                           [bit] NOT NULL,
	[OrganizationOperationalStatus]                                 [varchar](20) NULL,
	[OperationalStatusEffectiveDate]                                [datetime] NULL,
	[PhysicalAddressStreetNumberAndName]                            [nvarchar](150) NULL,
	[PhysicalAddressApartmentRoomOrSuiteNumber]                     [nvarchar](40) NULL,
	[PhysicalAddressCity]                                           [nvarchar](30) NULL,
	[PhysicalAddressPostalCode]                                     [nvarchar](17) NULL,
	[PhysicalAddressStateAbbreviation]                              [nvarchar](50) NULL,
	[PhysicalAddressCountyAnsiCodeCode]                             [nchar](5) NULL,
	[StateIssuingProfessionalCredentialOrLicenseCode]               [nvarchar](50) NOT NULL,
	[StateIssuingProfessionalCredentialOrLicenseDescription]        [nvarchar](150) NOT NULL,
	[TelephoneNumber]                                               [nvarchar](24) NULL,
	[WebSiteAddress]                                                [nvarchar](300) NULL,
	[OrganizationRegionGeoJson]                                     [nvarchar](max) NULL,
	[Latitude]                                                      [nvarchar](20) NULL,
	[Longitude]                                                     [nvarchar](20) NULL,
	[RecordStartDateTime]                                           [datetime] NOT NULL,
	[RecordEndDateTime]                                             [datetime] NULL
)