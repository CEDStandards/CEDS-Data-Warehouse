CREATE TABLE [RDS].[ReportEDFactsOrganizationCounts](
	[ReportEDFactsOrganizationCountId] [int] IDENTITY(1,1) NOT NULL,
	[CSSOEmail] [nvarchar](100) NULL,
	[CSSOFirstName] [nvarchar](100) NULL,
	[CSSOLastOrSurname] [nvarchar](100) NULL,
	[CSSOTelephone] [nvarchar](24) NULL,
	[CSSOTitle] [nvarchar](100) NULL,
	[Categories] [nvarchar](300) NULL,
	[CategorySetCode] [nvarchar](40) NOT NULL,
	[CharterLeaStatus] [nvarchar](100) NULL,
	[CharterSchoolAuthorizerIdPrimary] [nvarchar](50) NULL,
	[CharterSchoolAuthorizerIdSecondary] [nvarchar](50) NULL,
	[CharterSchoolStatus] [nvarchar](100) NULL,
	[EffectiveDate] [nvarchar](50) NULL,
	[GRADELEVEL] [nvarchar](50) NULL,
	[LEAType] [nvarchar](50) NULL,
	[LEATypeId] [nvarchar](max) NULL,
	[MAGNETSTATUS] [nvarchar](max) NULL,
	[MailingAddressCity] [nvarchar](50) NULL,
	[MailingAddressPostalCode] [nvarchar](17) NULL,
	[MailingAddressState] [nvarchar](50) NULL,
	[MailingAddressStreet] [nvarchar](100) NULL,
	[NSLPSTATUS] [nvarchar](max) NULL,
	[OperationalStatus] [nvarchar](50) NULL,
	[OperationalStatusId] [nvarchar](max) NULL,
	[OrganizationCount] [int] NOT NULL,
	[OrganizationName] [nvarchar](1000) NOT NULL,
	[OrganizationNcesId] [nvarchar](100) NULL,
	[OrganizationStateId] [nvarchar](100) NULL,
	[OutOfStateIndicator] [nvarchar](max) NULL,
	[ParentOrganizationStateId] [nvarchar](100) NULL,
	[PhysicalAddressCity] [nvarchar](50) NULL,
	[PhysicalAddressPostalCode] [nvarchar](17) NULL,
	[PhysicalAddressState] [nvarchar](50) NULL,
	[PhysicalAddressStreet] [nvarchar](100) NULL,
	[PriorLeaStateIdentifier] [nvarchar](50) NULL,
	[PriorSchoolStateIdentifier] [nvarchar](50) NULL,
	[ReconstitutedStatus] [nvarchar](100) NULL,
	[ReportCode] [nvarchar](40) NOT NULL,
	[ReportLevel] [nvarchar](40) NOT NULL,
	[ReportYear] [nvarchar](40) NOT NULL,
	[SHAREDTIMESTATUS] [nvarchar](max) NULL,
	[SchoolType] [nvarchar](50) NULL,
	[SchoolTypeId] [nvarchar](max) NULL,
	[StateAnsiCode] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](100) NOT NULL,
	[StateName] [nvarchar](1000) NOT NULL,
	[SupervisoryUnionIdentificationNumber] [nchar](3) NULL,
	[TITLE1SCHOOLSTATUS] [nvarchar](max) NULL,
	[TableTypeAbbrv] [nvarchar](100) NULL,
	[Telephone] [nvarchar](24) NULL,
	[TotalIndicator] [nvarchar](5) NULL,
	[UpdatedOperationalStatus] [nvarchar](50) NULL,
	[UpdatedOperationalStatusId] [nvarchar](max) NULL,
	[VIRTUALSCHSTATUS] [nvarchar](max) NULL,
	[Website] [nvarchar](100) NULL,
	[TitleiParentalInvolveRes] [int] NULL,
	[TitleiPartaAllocations] [int] NULL,
	[ParentOrganizationNcesId] [nvarchar](100) NULL,
	[CharterSchoolIndicator] [bit] NULL,
	[CharterSchoolContractIdNumber] [nvarchar](max) NULL,
	[CharterContractApprovalDate] [nvarchar](max) NULL,
	[CharterContractRenewalDate] [nvarchar](max) NULL,
	[LeaNcesIdentifier] [nvarchar](max) NULL,
	[LeaStateIdentifier] [nvarchar](max) NULL,
	[ManagementOrganizationType] [nvarchar](max) NULL,
	[IMPROVEMENTSTATUS] [nvarchar](max) NULL,
	[PERSISTENTLYDANGEROUSSTATUS] [nvarchar](max) NULL,
	[CharterSchoolManagementOrganization] [nvarchar](max) NULL,
	[CharterSchoolUpdatedManagementOrganization] [nvarchar](max) NULL,
	[STATEPOVERTYDESIGNATION] [nvarchar](50) NULL,
	[SCHOOLIMPROVEMENTFUNDS] [int] NULL,
	[EconomicallyDisadvantagedStudentCount] [int] NULL,
	[McKinneyVentoSubgrantRecipient] [varchar](50) NULL,
	[ProgressAchievingEnglishLanguage] [nvarchar](max) NULL,
	[StateDefinedStatus] [nvarchar](max) NULL,
	[REAPAlternativeFundingStatus] [nvarchar](50) NULL,
	[GraduationRate] [nvarchar](50) NULL,
	[GunFreeStatus] [nvarchar](50) NULL,
	[FederalFundAllocationType] [nvarchar](20) NULL,
	[FederalProgramCode] [nvarchar](20) NULL,
	[FederalFundAllocated] [int] NULL,
	[ComprehensiveAndTargetedSupportCode] [nvarchar](50) NULL,
	[ComprehensiveSupportCode] [nvarchar](50) NULL,
	[TargetedSupportCode] [nvarchar](50) NULL,
	[AdditionalTargetedSupportandImprovementCode] [varchar](50) NULL,
	[ComprehensiveSupportImprovementCode] [varchar](50) NULL,
	[TargetedSupportImprovementCode] [varchar](50) NULL,
	[AppropriationMethodCode] [varchar](50) NULL,
	[MailingAddressApartmentRoomOrSuiteNumber] [varchar](100) NULL,
	[PhysicalAddressApartmentRoomOrSuiteNumber] [varchar](100) NULL,
	[ReasonApplicabilityCode] [varchar](50) NULL,
	[SubgroupCode] [varchar](50) NULL,
	[CharterSchoolAuthorizerType] [nvarchar](100) NULL,
 CONSTRAINT [PK_ReportEDFactsOrganizationCounts] PRIMARY KEY CLUSTERED 
(
	[ReportEDFactsOrganizationCountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [RDS].[ReportEdFactsOrganizationCounts] ADD  CONSTRAINT [DF_ReportEDFactsOrganizationCounts_OutOfStateIndicator]  DEFAULT (N'0') FOR [OutOfStateIndicator]
GO

ALTER TABLE [RDS].[ReportEDFactsOrganizationCounts] ADD  CONSTRAINT [DF_ReportEDFactsOrganizationCounts_ParentOrganizationStateId]  DEFAULT (N'0') FOR [ParentOrganizationStateId]
GO

ALTER TABLE [RDS].[ReportEdFactsOrganizationCounts] ADD  CONSTRAINT [DF_ReportEDFactsOrganizationCounts_TitleiParentalInvolveRes]  DEFAULT ((0)) FOR [TitleiParentalInvolveRes]
GO

ALTER TABLE [RDS].[ReportEdFactsOrganizationCounts] ADD  CONSTRAINT [DF_ReportEDFactsOrganizationCounts_TitleiPartaAllocations]  DEFAULT ((0)) FOR [TitleiPartaAllocations]
GO

ALTER TABLE [RDS].[ReportEDFactsOrganizationCounts] ADD  CONSTRAINT [DF_ReportEDFactsOrganizationCounts_ParentOrganizationNcesId]  DEFAULT ((0)) FOR [ParentOrganizationNcesId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOFirstName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CSSOLastOrSurname'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'  The classification of education agencies within the geographic boundaries of a state according to the level of administrative and operational control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000537' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21528' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'LEAType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'MailingAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the city in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address City' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21040' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressCity'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A number that identifies each postal delivery area in the United States used as a portion of an address.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Address Postal Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PhysicalAddressPostalCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the school was restructured, transformed or otherwise changed as a consequence of the state''s accountability system under ESEA or as a result of School Improvement Grants (SIG).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reconstituted Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21230' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'ReconstitutedStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of education institution as classified by its primary focus. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21242' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateAnsiCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateAnsiCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateAnsiCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateAnsiCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'StateAnsiCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a public school provides free public elementary and/or secondary education to eligible students under a specific charter executed, pursuant to a state charter school law, by an authorized chartering agency/authority and that is designated by such authority to be a public charter school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000039' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21039' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique number the SEA assigns to the contract (or charter) that authorizes the charter school to operate in the state under the state''s charter school legislation.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Charter School Contract Id Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001651' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22632' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'CharterSchoolContractIdNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school is identified as persistently dangerous in accordance with state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Persistently Dangerous Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The designation of a school''s poverty quartile for purposes of determining classes taught by highly qualified teachers in high and low poverty schools, according to state''s indicator of poverty.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Poverty Designation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'STATEPOVERTYDESIGNATION'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the local education agency (LEA) notified the state of the LEA''s intention to use REAP-Flex Alternative Uses of Funding Authority during the school year as specified in the Title VI, Section 6211 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Rural Education Achievement Program Alternative Funding Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000560' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'REAPAlternativeFundingStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The unique five-digit number assigned to each federal program as listed in the Assistance Listings. See https://sam.gov/content/assistance-listings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Federal Program Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000547' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEdFactsOrganizationCounts', @level2type=N'COLUMN',@level2name=N'FederalProgramCode'
GO


