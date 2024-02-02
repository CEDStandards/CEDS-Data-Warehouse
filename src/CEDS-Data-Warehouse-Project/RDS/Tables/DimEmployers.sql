<<<<<<< Updated upstream
CREATE TABLE [RDS].[DimEmployers](
	[DimEmployerId] [int] IDENTITY(1,1) NOT NULL,
	[EmployerOrganizationName] [nvarchar](1000) NULL,
	[EmployerOrganizationIdentifierSea] [nvarchar](50) NULL,
	[SeaOrganizationName] [nvarchar](1000) NULL,
	[SeaOrganizationIdentifierSea] [nvarchar](50) NULL,
	[StateANSICode] [nvarchar](10) NULL,
	[StateAbbreviationCode] [nvarchar](10) NULL,
	[StateAbbreviationDescription] [nvarchar](1000) NULL,
	[MailingAddressStreetNumberAndName] [nvarchar](150) NULL,
	[MailingAddressApartmentRoomOrSuiteNumber] [varchar](40) NULL,
	[MailingAddressCity] [nvarchar](30) NULL,
	[MailingAddressStateAbbreviation] [nvarchar](50) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressCountyAnsiCodeCode] [char](5) NULL,
	[OutOfStateIndicator] [bit] NOT NULL,
	[OrganizationOperationalStatus] [varchar](20) NULL,
	[OperationalStatusEffectiveDate] [datetime] NULL,
	[PhysicalAddressStreetNumberAndName] [nvarchar](150) NULL,
	[PhysicalAddressApartmentRoomOrSuiteNumber] [varchar](40) NULL,
	[PhysicalAddressCity] [nvarchar](30) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressStateAbbreviation] [nvarchar](50) NULL,
	[PhysicalAddressCountyAnsiCodeCode] [char](5) NULL,
	[TelephoneNumber] [nvarchar](24) NULL,
	[WebSiteAddress] [nvarchar](300) NULL,
	[OrganizationRegionGeoJson] [nvarchar](max) NULL,
	[Latitude] [nvarchar](20) NULL,
	[Longitude] [nvarchar](20) NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimEmployers] PRIMARY KEY CLUSTERED 
(
	[DimEmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'EmployerOrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'EmployerOrganizationIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'SeaOrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'SeaOrganizationIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'StateANSICode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'MailingAddressStreetNumberAndName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'MailingAddressApartmentRoomOrSuiteNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'MailingAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'MailingAddressStateAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'MailingAddressCountyAnsiCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'OrganizationOperationalStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'OperationalStatusEffectiveDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStreetNumberAndName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'PhysicalAddressApartmentRoomOrSuiteNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStateAbbreviation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCountyAnsiCodeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'TelephoneNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'WebSiteAddress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'OrganizationRegionGeoJson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'Latitude'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'Longitude'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEmployers', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime'
=======
CREATE TABLE [RDS].[DimEmployers]
(
	[DimEmployerId] int NOT NULL IDENTITY (1, 1),
	[EmployerOrganizationName] nvarchar(1000) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[EmployerOrganizationIdentifierSea] nvarchar(50) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[SeaOrganizationName] nvarchar(1000) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[SeaOrganizationIdentifierSea] nvarchar(50) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateANSICode] nvarchar(10) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateAbbreviationCode] nvarchar(10) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateAbbreviationDescription] nvarchar(1000) NULL,	-- Se the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MailingAddressStreetNumberAndName] nvarchar(150) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MailingAddressApartmentRoomOrSuiteNumber] varchar(40) NULL,	-- See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MailingAddressCity] nvarchar(30) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MailingAddressStateAbbreviation] nvarchar(50) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MailingAddressPostalCode] nvarchar(17) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MailingAddressCountyAnsiCodeCode] char(5) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OutOfStateIndicator] bit NOT NULL,
	[OrganizationOperationalStatus] varchar(20) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OperationalStatusEffectiveDate] datetime NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[PhysicalAddressStreetNumberAndName] nvarchar(150) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[PhysicalAddressApartmentRoomOrSuiteNumber] varchar(40) NULL,	-- See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.
	[PhysicalAddressCity] nvarchar(30) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[PhysicalAddressPostalCode] nvarchar(17) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[PhysicalAddressStateAbbreviation] nvarchar(50) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[PhysicalAddressCountyAnsiCodeCode] char(5) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[TelephoneNumber] nvarchar(24) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[WebSiteAddress] nvarchar(300) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OrganizationRegionGeoJson] nvarchar(max) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[Latitude] nvarchar(20) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[Longitude] nvarchar(20) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[RecordStartDateTime] datetime NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[RecordEndDateTime] datetime NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	CONSTRAINT [PK_DimEmployers] PRIMARY KEY CLUSTERED ([DimEmployerId] ASC) WITH FILLFACTOR = 80
)
GO

/* Create Table Comments */

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [EmployerOrganizationName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [EmployerOrganizationIdentifierSea]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [SeaOrganizationName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [SeaOrganizationIdentifierSea]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [StateANSICode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [StateAbbreviationCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'Se the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [StateAbbreviationDescription]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [MailingAddressStreetNumberAndName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [MailingAddressApartmentRoomOrSuiteNumber]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [MailingAddressCity]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [MailingAddressStateAbbreviation]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [MailingAddressPostalCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [MailingAddressCountyAnsiCodeCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [OrganizationOperationalStatus]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [OperationalStatusEffectiveDate]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [PhysicalAddressStreetNumberAndName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [PhysicalAddressApartmentRoomOrSuiteNumber]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [PhysicalAddressCity]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [PhysicalAddressPostalCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [PhysicalAddressStateAbbreviation]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [PhysicalAddressCountyAnsiCodeCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [TelephoneNumber]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [WebSiteAddress]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [OrganizationRegionGeoJson]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [Latitude]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [Longitude]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [RecordStartDateTime]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimEmployers], 'column', [RecordEndDateTime]
>>>>>>> Stashed changes
GO