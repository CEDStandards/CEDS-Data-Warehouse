CREATE TABLE [RDS].[DimK12Schools] (
    [DimK12SchoolId]                            INT             IDENTITY (1, 1) NOT NULL,
    [LeaOrganizationName]                       NVARCHAR (1000) NULL,
    [LeaIdentifierNces]                         NVARCHAR (50)   NULL,
    [LeaIdentifierSea]                          NVARCHAR (50)   NULL,
    [NameOfInstitution]                         NVARCHAR (1000) NULL,
    [SchoolIdentifierNces]                      NVARCHAR (50)   NULL,
    [SchoolIdentifierSea]                       NVARCHAR (50)   NULL,
    [SeaOrganizationName]                       NVARCHAR (1000) NULL,
    [SeaOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [StateAnsiCode]                             NVARCHAR (10)   NULL,
    [StateAbbreviationCode]                     NVARCHAR (10)   NULL,
    [StateAbbreviationDescription]              NVARCHAR (1000) NULL,
    [PriorLeaIdentifierSea]                     NVARCHAR (50)   NULL,
    [PriorSchoolIdentifierSea]                  NVARCHAR (50)   NULL,
    [CharterSchoolIndicator]                    BIT             NULL,
    [CharterSchoolContractIdNumber]             NVARCHAR (MAX)  NULL,
    [CharterSchoolContractApprovalDate]         NVARCHAR (MAX)  NULL,
    [CharterSchoolContractRenewalDate]          NVARCHAR (MAX)  NULL,
    [ReportedFederally]                         BIT             NULL,
    [LeaTypeCode]                               NVARCHAR (50)   NULL,
    [LeaTypeDescription]                        NVARCHAR (100)  NULL,
    [LeaTypeEdFactsCode]                        NVARCHAR (50)   NULL,
    [SchoolTypeCode]                            NVARCHAR (50)   NULL,
    [SchoolTypeDescription]                     NVARCHAR (100)  NULL,
    [SchoolTypeEdFactsCode]                     NVARCHAR (50)   NULL,
    [MailingAddressCity]                        NVARCHAR (30)   NULL,
    [MailingAddressPostalCode]                  NVARCHAR (17)   NULL,
    [MailingAddressStateAbbreviation]           NVARCHAR (50)   NULL,
    [MailingAddressStreetNumberAndName]         NVARCHAR (40)   NULL,
    [PhysicalAddressCity]                       NVARCHAR (30)   NULL,
    [PhysicalAddressPostalCode]                 NVARCHAR (17)   NULL,
    [PhysicalAddressStateAbbreviation]          NVARCHAR (50)   NULL,
    [PhysicalAddressStreetNumberAndName]        NVARCHAR (40)   NULL,
    [TelephoneNumber]                           NVARCHAR (24)   NULL,
    [WebSiteAddress]                            NVARCHAR (300)  NULL,
    [OutOfStateIndicator]                       BIT             NULL,
    [RecordStartDateTime]                       DATETIME        NULL,
    [RecordEndDateTime]                         DATETIME        NULL,
    [SchoolOperationalStatus]                   VARCHAR (50)    NULL,
    [SchoolOperationalStatusEdFactsCode]        INT             NULL,
    [CharterSchoolStatus]                       VARCHAR (50)    NULL,
    [ReconstitutedStatus]                       VARCHAR (50)    NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  VARCHAR (40)    NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] VARCHAR (40)    NULL,
    [IeuOrganizationName]                       NVARCHAR (1000) NULL,
    [IeuOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [MailingAddressCountyAnsiCodeCode]          CHAR (5)        NULL,
    [PhysicalAddressCountyAnsiCodeCode]         CHAR (5)        NULL,
    [Longitude]                                 VARCHAR (20)    NULL,
    [Latitude]                                  VARCHAR (20)    NULL,
    [SchoolOperationalStatusEffectiveDate]      DATETIME        NULL,
    [AdministrativeFundingControlCode]          NVARCHAR (50)   NULL,
    [AdministrativeFundingControlDescription]   NVARCHAR (200)  NULL,
    CONSTRAINT [PK_DimK12Schools] PRIMARY KEY CLUSTERED ([DimK12SchoolId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchools_StateANSICode]
    ON [RDS].[DimK12Schools]([StateAnsiCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierSea]
    ON [RDS].[DimK12Schools]([SchoolIdentifierSea] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_RecordStartDateTime]
    ON [RDS].[DimK12Schools]([RecordStartDateTime] ASC)
    INCLUDE([SchoolIdentifierSea], [RecordEndDateTime]);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchools_StateAbbreviationCode]
    ON [RDS].[DimK12Schools]([StateAbbreviationCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierSea_DimK12SchoolId_RecordStartDateTime_RecordEndDateTime]
    ON [RDS].[DimK12Schools]([SchoolIdentifierSea] ASC, [DimK12SchoolId] ASC, [RecordStartDateTime] ASC, [RecordEndDateTime] ASC)
    INCLUDE([SchoolOperationalStatus]);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierSea_RecordStartDateTime]
    ON [RDS].[DimK12Schools]([SchoolIdentifierSea] ASC, [RecordStartDateTime] ASC)
    INCLUDE([RecordEndDateTime]);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its funding source.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Administrative Funding Control' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000012' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21012' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its funding source.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Administrative Funding Control' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000012' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21012' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'AdministrativeFundingControlDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractApprovalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective date of the contract (or charter) that an approved charter school authorizer authorized the charter school to operate in the state under the state''s charter school legislation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractApprovalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Contract Approval Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractApprovalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001652' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractApprovalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22633' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractApprovalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique number the SEA assigns to the contract (or charter) that authorizes the charter school to operate in the state under the state''s charter school legislation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Contract Id Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001651' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22632' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractRenewalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date by which the charter school must renew its contract (or charter) with an approved charter school authorizer in order to continue to operate in the state under the state''s charter school legislation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractRenewalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Contract Renewal Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractRenewalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001653' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractRenewalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22634' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractRenewalDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a public school provides free public elementary and/or secondary education to eligible students under a specific charter executed, pursuant to a state charter school law, by an authorized chartering agency/authority and that is designated by such authority to be a public charter school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000039' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21039' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'IeuOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The north or south angular distance from the equator that, when combined with longitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Latitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000606' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21599' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Latitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'  The classification of education agencies within the geographic boundaries of a state according to the level of administrative and operational control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000537' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'  The classification of education agencies within the geographic boundaries of a state according to the level of administrative and operational control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000537' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'  The classification of education agencies within the geographic boundaries of a state according to the level of administrative and operational control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000537' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'LeaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The east or west angular distance from the prime meridian that, when combined with latitude, reflects an estimation of where the address is physically situated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Longitude' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000607' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21600' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'Longitude';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The apartment, room, or suite number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Apartment Room or Suite Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'County code as defined for the identification of counties and equivalent areas of the United States, Puerto Rico, and the insular areas as established by the American National Standards Institute (ANSI) Inter-National Committee for Information Technology Standards (INCITS) in specification BSR INCITS 31-200x or more current updates. See https://www.census.gov/library/reference/code-lists/ansi.html#par_statelist.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'County ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001209' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22176' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The street number and street name or post office box number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Street Number and Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'MailingAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'NameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legally accepted name of the institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'NameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Name of Institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'NameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000191' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'NameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21191' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'NameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The apartment, room, or suite number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Apartment Room or Suite Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21019' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressApartmentRoomOrSuiteNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'County code as defined for the identification of counties and equivalent areas of the United States, Puerto Rico, and the insular areas as established by the American National Standards Institute (ANSI) Inter-National Committee for Information Technology Standards (INCITS) in specification BSR INCITS 31-200x or more current updates. See https://www.census.gov/library/reference/code-lists/ansi.html#par_statelist.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'County ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001209' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22176' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCountyAnsiCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStateAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The street number and street name or post office box number of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Street Number and Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21269' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PhysicalAddressStreetNumberAndName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorLeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorLeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorLeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorLeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorLeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the school was restructured, transformed or otherwise changed as a consequence of the state’s accountability system under ESEA or as a result of School Improvement Grants (SIG).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reconstituted Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The current status of the school operations, exclusive of scheduled breaks, holidays, or other temporary interruptions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Operational Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000533' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21524' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The current status of the school operations, exclusive of scheduled breaks, holidays, or other temporary interruptions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Operational Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000533' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21524' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolOperationalStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its primary focus. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its primary focus. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its primary focus. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SchoolTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a state agency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001490' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22462' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'SeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAnsiCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAnsiCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAnsiCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAnsiCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'StateAnsiCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'TelephoneNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Uniform Resource Locator (URL) for the unique address of a Web page.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Web Site Address' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000704' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21300' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12Schools', @level2type=N'COLUMN',@level2name=N'WebSiteAddress';
GO