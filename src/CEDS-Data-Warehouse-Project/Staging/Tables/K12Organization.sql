CREATE TABLE [Staging].[K12Organization] (
    [Id]                                                                   INT            IDENTITY (1, 1) NOT NULL,
    [IeuIdentifierSea]                                                     NVARCHAR (100) NULL,
    [IEU_OrganizationName]                                                 NVARCHAR (256) NULL,
    [IEU_OperationalStatusEffectiveDate]                                   DATETIME       NULL,
    [IEU_OrganizationOperationalStatus]                                    VARCHAR (100)  NULL,
    [IEU_WebSiteAddress]                                                   NVARCHAR (300) NULL,
    [IEU_RecordStartDateTime]                                              DATETIME       NULL,
    [IEU_RecordEndDateTime]                                                DATETIME       NULL,
    [LeaIdentifierSea]                                                     NVARCHAR (50)  NULL,
    [PriorLeaIdentifierSea]                                                NVARCHAR (50)  NULL,
    [LeaIdentifierNCES]                                                    NVARCHAR (50)  NULL,
    [LEA_SupervisoryUnionIdentificationNumber]                             VARCHAR (100)  NULL,
    [LeaOrganizationName]                                                  VARCHAR (256)  NULL,
    [LEA_WebSiteAddress]                                                   VARCHAR (300)  NULL,
    [LEA_OperationalStatus]                                                VARCHAR (100)  NULL,
    [LEA_OperationalStatusEffectiveDate]                                   DATETIME       NULL,
    [LEA_CharterLeaStatus]                                                 VARCHAR (100)  NULL,
    [LEA_CharterSchoolIndicator]                                           BIT            NULL,
    [LEA_Type]                                                             VARCHAR (100)  NULL,
    [LEA_McKinneyVentoSubgrantRecipient]                                   BIT            NULL,
    [LEA_GunFreeSchoolsActReportingStatus]                                 VARCHAR (100)  NULL,
    [LEA_TitleIinstructionalService]                                       VARCHAR (100)  NULL,
    [LEA_TitleIProgramType]                                                VARCHAR (100)  NULL,
    [LEA_K12LeaTitleISupportService]                                       VARCHAR (100)  NULL,
    [LEA_MepProjectType]                                                   VARCHAR (100)  NULL,
    [LEA_IsReportedFederally]                                              BIT            NULL,
    [LEA_RecordStartDateTime]                                              DATETIME       NULL,
    [LEA_RecordEndDateTime]                                                DATETIME       NULL,
    [SchoolIdentifierSea]                                                  NVARCHAR (50)  NULL,
    [PriorSchoolIdentifierSea]                                             NVARCHAR (50)  NULL,
    [School_PriorLeaIdentifierSea]                                         NVARCHAR (50)  NULL,
    [SchoolIdentifierNCES]                                                 NVARCHAR (50)  NULL,
    [SchoolIdentifierAct]                                                  NVARCHAR (50)  NULL,
    [SchoolOrganizationName]                                               VARCHAR (256)  NULL,
    [School_WebSiteAddress]                                                VARCHAR (300)  NULL,
    [School_OperationalStatus]                                             VARCHAR (100)  NULL,
    [School_OperationalStatusEffectiveDate]                                DATETIME       NULL,
    [School_Type]                                                          VARCHAR (100)  NULL,
    [School_MagnetOrSpecialProgramEmphasisSchool]                          VARCHAR (100)  NULL,
    [School_SharedTimeIndicator]                                           VARCHAR (100)  NULL,
    [School_VirtualSchoolStatus]                                           VARCHAR (100)  NULL,
    [School_NationalSchoolLunchProgramStatus]                              VARCHAR (100)  NULL,
    [School_ReconstitutedStatus]                                           VARCHAR (100)  NULL,
    [School_CharterSchoolIndicator]                                        BIT            NULL,
    [School_CharterSchoolOpenEnrollmentIndicator]                          BIT            NULL,
    [School_CharterSchoolFEIN]                                             VARCHAR (100)  NULL,
    [School_CharterSchoolFEIN_Update]                                      VARCHAR (100)  NULL,
    [School_CharterContractIDNumber]                                       VARCHAR (100)  NULL,
    [School_CharterContractApprovalDate]                                   DATETIME       NULL,
    [School_CharterContractRenewalDate]                                    DATETIME       NULL,
    [School_CharterPrimaryAuthorizer]                                      VARCHAR (100)  NULL,
    [School_CharterSecondaryAuthorizer]                                    VARCHAR (100)  NULL,
    [School_StatePovertyDesignation]                                       VARCHAR (100)  NULL,
    [School_SchoolImprovementAllocation]                                   MONEY          NULL,
    [School_IndicatorStatusType]                                           VARCHAR (100)  NULL,
    [School_GunFreeSchoolsActReportingStatus]                              VARCHAR (100)  NULL,
    [School_ProgressAchievingEnglishLanguageProficiencyIndicatorType]      VARCHAR (100)  NULL,
    [School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus] VARCHAR (100)  NULL,
    [School_SchoolDangerousStatus]                                         VARCHAR (100)  NULL,
    [School_ComprehensiveAndTargetedSupport]                               VARCHAR (100)  NULL,
    [School_ComprehensiveSupport]                                          VARCHAR (100)  NULL,
    [School_TargetedSupport]                                               VARCHAR (100)  NULL,
    [School_ConsolidatedMigrantEducationProgramFundsStatus]                BIT            NULL,
    [School_MigrantEducationProgramProjectType]                            VARCHAR (100)  NULL,
    [School_TitleIPartASchoolDesignation]                                  VARCHAR (100)  NULL,
    [School_AdministrativeFundingControl]                                  NVARCHAR (100) NULL,
    [School_IsReportedFederally]                                           BIT            NULL,
    [School_RecordStartDateTime]                                           DATETIME       NULL,
    [School_RecordEndDateTime]                                             DATETIME       NULL,
    [SchoolYear]                                                           SMALLINT       NULL,
    [DataCollectionName]                                                   NVARCHAR (100) NULL,
    [NewIEU]                                                               BIT            NULL,
    [NewLEA]                                                               BIT            NULL,
    [NewSchool]                                                            BIT            NULL,
    [RunDateTime]                                                          DATETIME       NULL,
    CONSTRAINT [PK_K12Organization] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100, STATISTICS_NORECOMPUTE = ON, DATA_COMPRESSION = PAGE)
);
GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12Organization_LEA_IsReportedFederally]
    ON [Staging].[K12Organization]([LEA_IsReportedFederally] ASC)
    INCLUDE([LeaIdentifierSea]);
GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12Organization_School_RecordStartDateTime]
    ON [Staging].[K12Organization]([School_RecordStartDateTime] ASC)
    INCLUDE([SchoolIdentifierSea], [School_TitleIPartASchoolDesignation], [School_RecordEndDateTime]);

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective date for a change in operational status.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Operational Status Effective Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000534' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21525' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The current status of the organization''s operations, exclusive of scheduled breaks, holidays, or other temporary interruptions.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Operational Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001418' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22387' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_OrganizationOperationalStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Uniform Resource Locator (URL) for the unique address of a Web page.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Web Site Address' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000704' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21300' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'IEU_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a public school provides free public elementary and/or secondary education to eligible students under a specific charter executed, pursuant to a state charter school law, by an authorized chartering agency/authority and that is designated by such authority to be a public charter school.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000039' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21039' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or local education agency (LEA) submitted a Gun-Free Schools Act (GFSA) of 1994 report to the state, as defined by Title 18, Section 921.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gun Free Schools Act Reporting Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000134' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21134' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective date for a change in operational status.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Operational Status Effective Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000534' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21525' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_TitleIProgramType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_TitleIProgramType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_TitleIProgramType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_TitleIProgramType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_TitleIProgramType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Uniform Resource Locator (URL) for the unique address of a Web page.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Web Site Address' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000704' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21300' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LEA_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'LeaOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'PriorSchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_AdministrativeFundingControl';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its funding source.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_AdministrativeFundingControl';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Administrative Funding Control' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_AdministrativeFundingControl';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000012' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_AdministrativeFundingControl';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21012' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_AdministrativeFundingControl';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a public school provides free public elementary and/or secondary education to eligible students under a specific charter executed, pursuant to a state charter school law, by an authorized chartering agency/authority and that is designated by such authority to be a public charter school.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000039' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21039' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolOpenEnrollmentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the charter school offers open enrollment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolOpenEnrollmentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Open Enrollment Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolOpenEnrollmentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001548' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolOpenEnrollmentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22524' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_CharterSchoolOpenEnrollmentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school or local education agency (LEA) submitted a Gun-Free Schools Act (GFSA) of 1994 report to the state, as defined by Title 18, Section 921.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Gun Free Schools Act Reporting Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000134' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21134' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_GunFreeSchoolsActReportingStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MagnetOrSpecialProgramEmphasisSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A school that has been designed: 1) to attract students of different racial/ethnic backgrounds for the purpose of reducing, preventing, or eliminating racial isolation; and/or 2)to provide an academic or social focus on a particular theme (e.g., science/math, performing arts, gifted/talented, career academy or foreign language).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MagnetOrSpecialProgramEmphasisSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Magnet or Special Program Emphasis School' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MagnetOrSpecialProgramEmphasisSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000181' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MagnetOrSpecialProgramEmphasisSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21181' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MagnetOrSpecialProgramEmphasisSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MigrantEducationProgramProjectType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of project funded in whole or in part by MEP funds.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MigrantEducationProgramProjectType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Project Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MigrantEducationProgramProjectType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000463' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MigrantEducationProgramProjectType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21453' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_MigrantEducationProgramProjectType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_NationalSchoolLunchProgramStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The classification of participation by a school in the National School Lunch Program.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_NationalSchoolLunchProgramStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_NationalSchoolLunchProgramStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001767' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_NationalSchoolLunchProgramStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22748' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_NationalSchoolLunchProgramStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The effective date for a change in operational status.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Operational Status Effective Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000534' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21525' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_OperationalStatusEffectiveDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyIndicatorType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category used to report the school''s performance on the progress of achieving the English language proficiency indicator.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyIndicatorType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Achieving English Language Proficiency Indicator Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyIndicatorType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001915' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyIndicatorType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22896' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyIndicatorType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The state defined status assigned to the school''s performance on the progress of achieving the English language proficiency indicator.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Achieving English Language Proficiency State Defined Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001916' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22897' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the school was restructured, transformed or otherwise changed as a consequence of the state''s accountability system under ESEA or as a result of School Improvement Grants (SIG).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reconstituted Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000230' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21230' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_ReconstitutedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SchoolImprovementAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of Section 1003(a) and 1003(g) allocations to LEAs and Schools.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SchoolImprovementAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Improvement Allocation' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SchoolImprovementAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000480' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SchoolImprovementAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21471' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SchoolImprovementAllocation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SharedTimeIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school offers career and technical education or other educational services in which some or all students are enrolled at a separate school of record and attend the shared-time school on a part-time basis.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SharedTimeIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Shared Time Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SharedTimeIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000257' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SharedTimeIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21257' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_SharedTimeIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_StatePovertyDesignation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation of a school''s poverty quartile for purposes of determining classes taught by highly qualified teachers in high and low poverty schools, according to state''s indicator of poverty.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_StatePovertyDesignation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Poverty Designation' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_StatePovertyDesignation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000585' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_StatePovertyDesignation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21578' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_StatePovertyDesignation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_VirtualSchoolStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the extent to which a school offers instruction in which students and teachers are separated by time and/or location, and interaction occurs via computers and/or telecommunications technologies.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_VirtualSchoolStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Virtual School Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_VirtualSchoolStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001766' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_VirtualSchoolStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22747' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_VirtualSchoolStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The Uniform Resource Locator (URL) for the unique address of a Web page.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Web Site Address' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000704' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21300' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'School_WebSiteAddress';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierNCES';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolOrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12Organization', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO