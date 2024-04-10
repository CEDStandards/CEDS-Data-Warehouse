CREATE TABLE [Staging].[K12ParentOrGuardian] (
    [ID]                                     INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                 NVARCHAR (40)  NULL,
    [IeuOrganizationIdentifierSea]           NVARCHAR (50)  NULL,
    [LeaIdentifierSea]                       NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                    NVARCHAR (50)  NULL,
    [ParentGuardianPersonIdentifierState]    NVARCHAR (40)  NULL,
    [ParentGuardianFirstName]                NVARCHAR (100) NULL,
    [ParentGuardianLastOrSurname]            NVARCHAR (100) NULL,
    [ParentGuardianMiddleName]               NVARCHAR (100) NULL,
    [ParentGuardianGenerationCodeOrSuffix]   NVARCHAR (75)  NULL,
    [ParentGuardianBirthDate]                DATE           NULL,
    [ParentGuardianElectronicMailAddressHome]    NVARCHAR (252) NULL,
    [ParentGuardianElectronicMailAddressWork]    NVARCHAR (252) NULL,
    [ParentGuardianElectronicMailAddressOrganizational]    NVARCHAR (252) NULL,
    [ParentGuardianTelephoneNumberHome]      NVARCHAR (48)  NULL,
    [ParentGuardianTelephoneNumberWork]      NVARCHAR (48)  NULL,
    [ParentGuardianTelephoneNumberMobile]    NVARCHAR (48)  NULL,
    [ParentGuardianTelephoneNumberFax]       NVARCHAR (48)  NULL,
    [ParentGuardianAddressStreetNumberAndNameMailing] NVARCHAR (150) NULL,
    [ParentGuardianAddressApartmentRoomOrSuiteNumberMailing] NVARCHAR (60)  NULL,
    [ParentGuardianAddressCityMailing]       NVARCHAR (30)  NULL,
    [ParentGuardianAddressStateAbbreviationMailing]      NVARCHAR (50)   NULL,
    [ParentGuardianAddressPostalCodeMailing] NVARCHAR (17)  NULL,
    [ParentGuardianAddressStreetNumberAndNamePhysical] NVARCHAR (150) NULL,
    [ParentGuardianAddressApartmentRoomOrSuiteNumberPhysical] NVARCHAR (60)  NULL,
    [ParentGuardianAddressCityPhysical]      NVARCHAR (30)  NULL,
    [ParentGuardianAddressStateAbbreviationPhysical]     NVARCHAR (50)   NULL,
    [ParentGuardianAddressPostalCodePhysical] NVARCHAR (17)  NULL,
    [CustodialParentOrGuardianIndicator]     NVARCHAR (50)  NULL,
    [PrimaryContactIndicator]                NVARCHAR (50)  NULL,
    [EmergencyContactIndicator]              NVARCHAR (50)  NULL,
    [PersonRelationshipType]                 NVARCHAR (50)  NULL,
    [LivesWithIndicator]                     NVARCHAR (50)  NULL,
    [PersonRelationshipToLearnerContactPriorityNumber] INT  NULL,
    [PersonRelationshipToLearnerContactRestrictionsDescription] NVARCHAR (2000) NULL,
    [SchoolYear]                             SMALLINT       NULL,
    [DataCollectionName]                     NVARCHAR (100) NULL,
    [RecordStartDateTime]                    DATETIME       NULL,
    [RecordEndDateTime]                      DATETIME       NULL,
    [RunDateTime]                            DATETIME       NULL,
    CONSTRAINT [PK_K12ParentOrGuardian] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianBirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person was born.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianBirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Birthdate' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianBirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianBirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianBirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21115' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21172' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianMiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A full legal middle name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianMiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Middle Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianMiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000184' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianMiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21184' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianMiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that a person is a primary contact within the specified context, such as a primary parental contact specified in Person Relationship to Learner or a primary administrative contact for an organization.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Contact Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001428' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001428' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PrimaryContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether or not the person is a designated emergency contact for the learner.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Emergency Contact Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001341' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001341' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'EmergencyContactIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'CustodialParentOrGuardianIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a person has legal custody of a child.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'CustodialParentOrGuardianIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Custodial Parent or Guardian Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'CustodialParentOrGuardianIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000329' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'CustodialParentOrGuardianIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000329' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'CustodialParentOrGuardianIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The nature of a person''s relationship to another person.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000425' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000425' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LivesWithIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether or not the learner lives with the related person.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LivesWithIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Lives with Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LivesWithIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001425' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LivesWithIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001425' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'LivesWithIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactPriorityNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numeric order in the preferred sequence and priority for contacting a person related to the learner.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactPriorityNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Contact Priority Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactPriorityNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001426' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactPriorityNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001423' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactPriorityNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactRestrictionsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Restrictions for student and/or teacher contact with the individual (e.g., the student may not be picked up by the individual)' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactRestrictionsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Relationship to Learner Contact Restrictions Description' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactRestrictionsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001424' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactRestrictionsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001424' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'PersonRelationshipToLearnerContactRestrictionsDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a person by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001572' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001572' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000826' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An appendage, if any, used to denote a person''s generation in his family (e.g., Jr., Sr., III).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Generation Code or Suffix' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000121' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000121' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'GenerationCodeOrSuffix';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numbers, letters, and symbols used to identify an electronic mail (e-mail) user within the network to which the person or organization belongs.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Electronic Mail Address' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000088' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000088' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numbers, letters, and symbols used to identify an electronic mail (e-mail) user within the network to which the person or organization belongs.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Electronic Mail Address' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000088' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000088' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numbers, letters, and symbols used to identify an electronic mail (e-mail) user within the network to which the person or organization belongs.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Electronic Mail Address' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000088' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000088' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000279' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianTelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNameMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The street number and street name or post office box number of an address.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNameMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Street Number and Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNameMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000269' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNameMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000269' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNameMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The apartment, room, or suite number of an address.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Apartment Room or Suite Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000019' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000019' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000040' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodeMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodeMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodeMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodeMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000214' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodeMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000267' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationMailing';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNamePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The street number and street name or post office box number of an address.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNamePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Street Number and Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNamePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000269' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNamePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000269' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStreetNumberAndNamePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The apartment, room, or suite number of an address.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Apartment Room or Suite Number' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000019' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000019' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressApartmentRoomOrSuiteNumberPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000040' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressCityPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000214' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressPostalCodePhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationPhysical';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000267' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12ParentOrGuardian', @level2type=N'COLUMN',@level2name=N'ParentGuardianAddressStateAbbreviationPhysical';
GO