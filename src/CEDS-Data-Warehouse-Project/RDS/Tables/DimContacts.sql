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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An appendage, if any, used to denote a person''s generation in his family (e.g., Jr., Sr., III).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Generation Code or Suffix' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000121' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000121' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A full legal middle name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Middle Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000184' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000184' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An appellation, if any, used to denote rank, placement, or status (e.g., Mr., Ms., Reverend, Sister, Dr., Colonel).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Personal Title or Prefix' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000212' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000212' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name of a person''s position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Position Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000213' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000213' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PrimaryTelephoneNumberIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the telephone number should be used as the principal number for a person or organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PrimaryTelephoneNumberIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Telephone Number Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PrimaryTelephoneNumberIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000219' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PrimaryTelephoneNumberIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000219' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimContacts', @level2type=N'COLUMN',@level2name=N'PrimaryTelephoneNumberIndicator';
GO