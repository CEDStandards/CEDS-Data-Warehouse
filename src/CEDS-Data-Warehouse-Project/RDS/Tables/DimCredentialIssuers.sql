CREATE TABLE [RDS].[DimCredentialIssuers](
	[DimCredentialIssuerId] 										[int] IDENTITY(1,1) NOT NULL,
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
	[ProgramSponosorTypeCode]										[nvarchar](60) NULL,
	[ProgramSponosorTypeDescription]								[nvarchar](200) NULL,
	[RecordStartDateTime]                                           [datetime] NOT NULL,
	[RecordEndDateTime]                                             [datetime] NULL,
 	CONSTRAINT [PK_DimCredentialIssuers] PRIMARY KEY CLUSTERED 
(
	[DimCredentialIssuerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [RDS].[DimCredentialIssuers] ADD  DEFAULT ('MISSING') FOR [CTDLOrganizationTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialIssuers] ADD  DEFAULT ('MISSING') FOR [CTDLOrganizationTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialIssuers] ADD  DEFAULT ('MISSING') FOR [StateIssuingProfessionalCredentialOrLicenseCode]
GO

ALTER TABLE [RDS].[DimCredentialIssuers] ADD  DEFAULT ('MISSING') FOR [StateIssuingProfessionalCredentialOrLicenseDescription]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The north or south angular distance from the equator that, when combined with longitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Latitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000606' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000606' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The east or west angular distance from the prime meridian that, when combined with latitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Longitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000607' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000607' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective date for a change in operational status.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Operational Status Effective Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000534' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000534' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The current status of the organization''s operations, exclusive of scheduled breaks, holidays, or other temporary interruptions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Operational Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001418' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001418' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationRegionGeoJson';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The geo-political area of the organization''s facility, building, or site.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationRegionGeoJson';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Region GeoJSON' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationRegionGeoJson';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001750' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationRegionGeoJson';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001750' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'OrganizationRegionGeoJson';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Uniform Resource Locator (URL) for the unique address of a Web page.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Web Site Address' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000704' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000704' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialIssuers', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO