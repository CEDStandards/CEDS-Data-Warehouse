CREATE TABLE [RDS].[DimOrganizations]
(
	[DimOrganizationId] int NOT NULL IDENTITY (1, 1),
	[OrganizationName] nvarchar(1000) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[ShortNameOfOrganization] varchar(30) NOT NULL,
	[OrganizationIdentifierSea] nvarchar(40) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OrganizationIdentifierDuns] nvarchar(40) NULL,
	[OrganizationIdentifierFein] nvarchar(40) NULL,
	[OrganizationTypeCode] nvarchar(50) NOT NULL,
	[OrganizationTypeDescription] nvarchar(1000) NOT NULL,
	[OrganizationOperationalStatusCode] nvarchar(50) NOT NULL,
	[OrganizationOperationalStatusDescription] nvarchar(1000) NOT NULL,
	[OperationalStatusEffectiveDate] date NULL,
	[StateAnsiCode] nvarchar(10) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateAbbreviationCode] nvarchar(10) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateAbbreviationDescription] nvarchar(1000) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[TelephoneNumberMain] nvarchar(24) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[TelephoneNumberFax] nvarchar(24) NULL,
	[ElectronicMailAddress] nvarchar(128) NULL,
	[WebSiteAddress] nvarchar(300) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OutOfStateIndicator] bit NULL,
	[OrganizationRegionGeoJson] nvarchar(max) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[RecordStartDateTime] datetime NOT NULL,
	[RecordEndDateTime] datetime NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimOrganizations] 
 ADD CONSTRAINT [PK_DimOrganizations]
	PRIMARY KEY CLUSTERED ([DimOrganizationId] ASC)
GO

/* Create Table Comments */

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [OrganizationName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [OrganizationIdentifierSea]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [StateAnsiCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [StateAbbreviationCode]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [StateAbbreviationDescription]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [TelephoneNumberMain]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [WebSiteAddress]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimOrganizations], 'column', [OrganizationRegionGeoJson]
GO