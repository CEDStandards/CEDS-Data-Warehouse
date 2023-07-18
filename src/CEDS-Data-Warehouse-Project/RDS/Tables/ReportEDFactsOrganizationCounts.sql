CREATE TABLE [RDS].[ReportEDFactsOrganizationCounts] (
    [ReportEDFactsOrganizationCountId]            INT             IDENTITY (1, 1) NOT NULL,
    [CSSOEmail]                                   NVARCHAR (100)  NULL,
    [CSSOFirstName]                               NVARCHAR (100)  NULL,
    [CSSOLastOrSurname]                           NVARCHAR (100)  NULL,
    [CSSOTelephone]                               NVARCHAR (24)   NULL,
    [CSSOTitle]                                   NVARCHAR (100)  NULL,
    [Categories]                                  NVARCHAR (300)  NULL,
    [CategorySetCode]                             NVARCHAR (40)   NOT NULL,
    [CharterLeaStatus]                            NVARCHAR (100)  NULL,
    [CharterSchoolAuthorizerIdPrimary]            NVARCHAR (50)   NULL,
    [CharterSchoolAuthorizerIdSecondary]          NVARCHAR (50)   NULL,
    [CharterSchoolStatus]                         NVARCHAR (100)  NULL,
    [EffectiveDate]                               NVARCHAR (50)   NULL,
    [GRADELEVEL]                                  NVARCHAR (50)   NULL,
    [LEAType]                                     NVARCHAR (50)   NULL,
    [LEATypeId]                                   NVARCHAR (MAX)  NULL,
    [MAGNETSTATUS]                                NVARCHAR (MAX)  NULL,
    [MailingAddressCity]                          NVARCHAR (50)   NULL,
    [MailingAddressPostalCode]                    NVARCHAR (17)   NULL,
    [MailingAddressState]                         NVARCHAR (50)   NULL,
    [MailingAddressStreet]                        NVARCHAR (100)  NULL,
    [NSLPSTATUS]                                  NVARCHAR (MAX)  NULL,
    [OperationalStatus]                           NVARCHAR (50)   NULL,
    [OperationalStatusId]                         NVARCHAR (MAX)  NULL,
    [OrganizationCount]                           INT             NOT NULL,
    [OrganizationId]                              INT             NOT NULL,
    [OrganizationName]                            NVARCHAR (1000) NOT NULL,
    [OrganizationNcesId]                          NVARCHAR (100)  NULL,
    [OrganizationStateId]                         NVARCHAR (100)  NULL,
    [OutOfStateIndicator]                         NVARCHAR (MAX)  DEFAULT (N'0') NULL,
    [ParentOrganizationStateId]                   NVARCHAR (100)  NULL,
    [PhysicalAddressCity]                         NVARCHAR (50)   NULL,
    [PhysicalAddressPostalCode]                   NVARCHAR (17)   NULL,
    [PhysicalAddressState]                        NVARCHAR (50)   NULL,
    [PhysicalAddressStreet]                       NVARCHAR (100)  NULL,
    [PriorLeaStateIdentifier]                     NVARCHAR (50)   NULL,
    [PriorSchoolStateIdentifier]                  NVARCHAR (50)   NULL,
    [ReconstitutedStatus]                         NVARCHAR (100)  NULL,
    [ReportCode]                                  NVARCHAR (40)   NOT NULL,
    [ReportLevel]                                 NVARCHAR (40)   NOT NULL,
    [ReportYear]                                  NVARCHAR (40)   NOT NULL,
    [SHAREDTIMESTATUS]                            NVARCHAR (MAX)  NULL,
    [SchoolType]                                  NVARCHAR (50)   NULL,
    [SchoolTypeId]                                NVARCHAR (MAX)  NULL,
    [StateANSICode]                               NVARCHAR (100)  NOT NULL,
    [StateCode]                                   NVARCHAR (100)  NOT NULL,
    [StateName]                                   NVARCHAR (1000) NOT NULL,
    [SupervisoryUnionIdentificationNumber]        NCHAR (3)       NULL,
    [TITLE1SCHOOLSTATUS]                          NVARCHAR (MAX)  NULL,
    [TableTypeAbbrv]                              NVARCHAR (100)  NULL,
    [Telephone]                                   NVARCHAR (24)   NULL,
    [TotalIndicator]                              NVARCHAR (5)    NULL,
    [UpdatedOperationalStatus]                    NVARCHAR (50)   NULL,
    [UpdatedOperationalStatusId]                  NVARCHAR (MAX)  NULL,
    [VIRTUALSCHSTATUS]                            NVARCHAR (MAX)  NULL,
    [Website]                                     NVARCHAR (100)  NULL,
    [TitleiParentalInvolveRes]                    INT             DEFAULT ((0)) NOT NULL,
    [TitleiPartaAllocations]                      INT             DEFAULT ((0)) NOT NULL,
    [ParentOrganizationNcesId]                    NVARCHAR (100)  NULL,
    [CharterSchoolIndicator]                      BIT             NULL,
    [CharterSchoolContractIdNumber]               NVARCHAR (MAX)  NULL,
    [CharterContractApprovalDate]                 NVARCHAR (MAX)  NULL,
    [CharterContractRenewalDate]                  NVARCHAR (MAX)  NULL,
    [LeaNcesIdentifier]                           NVARCHAR (MAX)  NULL,
    [LeaStateIdentifier]                          NVARCHAR (MAX)  NULL,
    [ManagementOrganizationType]                  NVARCHAR (MAX)  NULL,
    [IMPROVEMENTSTATUS]                           NVARCHAR (MAX)  NULL,
    [PERSISTENTLYDANGEROUSSTATUS]                 NVARCHAR (MAX)  NULL,
    [CHARTERSCHOOLMANAGERORGANIZATION]            NVARCHAR (MAX)  NULL,
    [CHARTERSCHOOLUPDATEDMANAGERORGANIZATION]     NVARCHAR (MAX)  NULL,
    [STATEPOVERTYDESIGNATION]                     NVARCHAR (50)   NULL,
    [SCHOOLIMPROVEMENTFUNDS]                      INT             NULL,
    [EconomicallyDisadvantagedStudentCount]       INT             NULL,
    [McKinneyVentoSubgrantRecipient]              VARCHAR (50)    NULL,
    [ProgressAchievingEnglishLanguage]            NVARCHAR (MAX)  NULL,
    [StateDefinedStatus]                          NVARCHAR (MAX)  NULL,
    [REAPAlternativeFundingStatus]                NVARCHAR (50)   NULL,
    [GraduationRate]                              NVARCHAR (50)   NULL,
    [GunFreeStatus]                               NVARCHAR (50)   NULL,
    [FederalFundAllocationType]                   NVARCHAR (20)   NULL,
    [FederalProgramCode]                          NVARCHAR (20)   NULL,
    [FederalFundAllocated]                        INT             NULL,
    [ComprehensiveAndTargetedSupportCode]         NVARCHAR (50)   NULL,
    [ComprehensiveSupportCode]                    NVARCHAR (50)   NULL,
    [TargetedSupportCode]                         NVARCHAR (50)   NULL,
    [ComprehensiveSupportImprovementCode]         NVARCHAR (50)   NULL,
    [TargetedSupportImprovementCode]              NVARCHAR (50)   NULL,
    [AdditionalTargetedSupportandImprovementCode] NVARCHAR (50)   NULL,
    [AppropriationMethodCode]                     NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ReportEDFactsOrganizationCounts] PRIMARY KEY CLUSTERED ([ReportEDFactsOrganizationCountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_ReportEDFactsOrganizationCounts_ReportCode_ReportYear_ReportLevel_Grade_Organization]
    ON [RDS].[ReportEDFactsOrganizationCounts]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC)
    INCLUDE([GRADELEVEL], [OrganizationId]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_ReportEDFactsOrganizationCounts_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsOrganizationCounts]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique number the SEA assigns to the contract (or charter) that authorizes the charter school to operate in the state under the state''s charter school legislation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Contract Id Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001651' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22632' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a public school provides free public elementary and/or secondary education to eligible students under a specific charter executed, pursuant to a state charter school law, by an authorized chartering agency/authority and that is designated by such authority to be a public charter school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000039' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21039' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'  The classification of education agencies within the geographic boundaries of a state according to the level of administrative and operational control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000537' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school is identified as persistently dangerous in accordance with state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Persistently Dangerous Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the local education agency (LEA) notified the state of the LEA''s intention to use REAP-Flex Alternative Uses of Funding Authority during the school year as specified in the Title VI, Section 6211 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Education Achievement Program Alternative Funding Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000560' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the school was restructured, transformed or otherwise changed as a consequence of the state’s accountability system under ESEA or as a result of School Improvement Grants (SIG).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reconstituted Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its primary focus. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation of a school’s poverty quartile for purposes of determining classes taught by highly qualified teachers in high and low poverty schools, according to state’s indicator of poverty.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Poverty Designation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION';
GO