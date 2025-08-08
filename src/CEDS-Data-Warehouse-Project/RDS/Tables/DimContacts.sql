CREATE TABLE [RDS].[DimContacts]
(
	[DimContactId] int NOT NULL IDENTITY (1, 1),
	[PersonalTitleOrPrefix] nvarchar(30) NULL,
	[FirstName] nvarchar(75) NULL,	-- See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.
	[MiddleName] nvarchar(75) NULL,	-- See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.
	[LastOrSurname] nvarchar(75) NULL,	-- See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.
	[GenerationCodeOrSuffix] nvarchar(10) NULL,
	[PrimaryTelephoneNumberIndicator] binary(10) NULL,
	[PositionTitle] nvarchar(200) NULL,
	[ElectronicMailAddressWork] nvarchar(252) NULL,
	[TelephoneNumberWork] nvarchar(48) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimContacts] 
 ADD CONSTRAINT [PK_DimContacts]
	PRIMARY KEY CLUSTERED ([DimContactId] ASC)
GO

/* Create Table Comments */

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimContacts], 'column', [FirstName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimContacts], 'column', [MiddleName]
GO

EXEC sp_addextendedproperty 'MS_Description', 'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', 'Schema', [RDS], 'table', [DimContacts], 'column', [LastOrSurname]
GO