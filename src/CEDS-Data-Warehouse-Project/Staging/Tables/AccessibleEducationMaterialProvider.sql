CREATE TABLE [Staging].[AccessibleEducationMaterialProvider]
(
  [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[AccessibleEducationMaterialProviderOrganizationIdentifierSea] nvarchar(60) NOT NULL,
	[AccessibleEducationMaterialProviderName] nvarchar(1000) NULL,
	[StateAbbreviationCode] nvarchar(2) NULL,
	[StateAbbreviationDescription] nvarchar(50) NULL,
	[StateANSICode] nvarchar(2) NULL,
	[MailingAddressStreetNumberAndName] nvarchar(300) NULL,
	[MailingAddressApartmentRoomOrSuiteNumber] nvarchar(40) NULL,
	[MailingAddressCity] nvarchar(60) NULL,
	[MailingAddressPostalCode] nvarchar(34) NULL,
	[MailingAddressStateAbbreviation] nvarchar(2) NULL,
	[MailingAddressCountyAnsiCodeCode] nvarchar(2) NULL,
	[PhysicalAddressStreetNumberAndName] nvarchar(300) NULL,
	[PhysicalAddressApartmentRoomOrSuiteNumber] nvarchar(40) NULL,
	[PhysicalAddressCity] nvarchar(60) NULL,
	[PhysicalAddressPostalCode] nvarchar(34) NULL,
	[PhysicalAddressStateAbbreviation] nvarchar(2) NULL,
	[PhysicalAddressCountyAnsiCodeCode] nvarchar(2) NULL,
	[TelephoneNumber] nvarchar(48) NULL,
	[WebSiteAddress] nvarchar(600) NULL,
	[OutOfStateIndicator] bit NULL
)
