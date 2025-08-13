CREATE TABLE [RDS].[DimOrganizations]
(
	[DimOrganizationId] INT NOT NULL IDENTITY (1, 1),
	[OrganizationName] NVARCHAR(1000) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[ShortNameOfOrganization] VARCHAR(30) NOT NULL,
	[OrganizationIdentifierSea] NVARCHAR(40) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OrganizationIdentifierDuns] NVARCHAR(40) NULL,
	[OrganizationIdentifierFein] NVARCHAR(40) NULL,
	[OrganizationTypeCode] NVARCHAR(50) NOT NULL,
	[OrganizationTypeDescription] NVARCHAR(1000) NOT NULL,
	[OrganizationOperationalStatusCode] NVARCHAR(50) NOT NULL,
	[OrganizationOperationalStatusDescription] NVARCHAR(1000) NOT NULL,
	[OperationalStatusEffectiveDate] DATE NULL,
	[StateAnsiCode] NVARCHAR(10) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateAbbreviationCode] NVARCHAR(10) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[StateAbbreviationDescription] NVARCHAR(1000) NOT NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[TelephoneNumberMain] NVARCHAR(24) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[TelephoneNumberFax] NVARCHAR(24) NULL,
	[ElectronicMailAddress] NVARCHAR(128) NULL,
	[WebSiteAddress] NVARCHAR(300) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[OutOfStateIndicator] BIT NULL,
	[OrganizationRegionGeoJson] NVARCHAR(MAX) NULL,	-- See the CEDS_GlobalId, CEDS_ElementTechnicalName, CEDS_URL, and CEDS_Def_Desc extended properties.
	[RecordStartDateTime] DATETIME NOT NULL,
	[RecordEndDateTime] DATETIME NULL
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