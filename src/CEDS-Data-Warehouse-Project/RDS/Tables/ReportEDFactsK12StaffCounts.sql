CREATE TABLE [RDS].[ReportEDFactsK12StaffCounts] (
    [ReportEDFactsK12StaffCountId]               INT             IDENTITY (1, 1) NOT NULL,
    [SPECIALEDUCATIONAGEGROUPTAUGHT]             NVARCHAR (50)   NULL,
    [EDFACTSCERTIFICATIONSTATUS]                 NVARCHAR (50)   NULL,
    [Categories]                                 NVARCHAR (300)  NULL,
    [CategorySetCode]                            NVARCHAR (40)   NOT NULL,
    [OrganizationName]                           NVARCHAR (1000) NOT NULL,
    [OrganizationIdentifierNces]                 NVARCHAR (100)  NOT NULL,
    [OrganizationIdentifierSea]                  NVARCHAR (100)  NOT NULL,
    [K12STAFFCLASSIFICATION]                     NVARCHAR (50)   NULL,
    [ParentOrganizationIdentifierSea]            NVARCHAR (MAX)  NULL,
    [StaffCount]                                 INT             NOT NULL,
    [StaffFullTimeEquivalency]                   DECIMAL (18, 2) NOT NULL,
    [SPECIALEDUCATIONTEACHERQUALIFICATIONSTATUS] NVARCHAR (50)   NULL,
    [ReportCode]                                 NVARCHAR (40)   NOT NULL,
    [ReportLevel]                                NVARCHAR (40)   NOT NULL,
    [ReportYear]                                 NVARCHAR (40)   NOT NULL,
    [SPECIALEDUCATIONSUPPORTSERVICESCATEGORY]    NVARCHAR (50)   NULL,
    [StateANSICode]                              NVARCHAR (100)  NOT NULL,
    [StateAbbreviationCode]                      NVARCHAR (100)  NOT NULL,
    [StateAbbreviationDescription]               NVARCHAR (1000) NOT NULL,
    [TableTypeAbbrv]                             NVARCHAR (MAX)  NULL,
    [TotalIndicator]                             NVARCHAR (MAX)  NULL,
    [TITLEIPROGRAMSTAFFCATEGORY]                 NVARCHAR (50)   NULL,
    [STAFFCATEGORYCCD]                           NVARCHAR (50)   NULL,
    [FORMERENGLISHLEARNERYEARSTATUS]             NVARCHAR (50)   NULL,
    [PROFICIENCYSTATUS]                          NVARCHAR (50)   NULL,
    [TITLEIIIACCOUNTABILITYPROGRESSSTATUS]       NVARCHAR (50)   NULL,
    [TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE]     NVARCHAR (50)   NULL,
    [EMERGENCYORPROVISIONALCREDENTIALSTATUS]     NVARCHAR (50)   NULL,
    [EDFACTSTEACHEROUTOFFIELDSTATUS]             NVARCHAR (50)   NULL,
    [EDFACTSTEACHERINEXPERIENCEDSTATUS]          NVARCHAR (50)   NULL,
    [PARAPROFESSIONALQUALIFICATIONSTATUS]        NVARCHAR (50)   NULL,
    [TEACHINGCREDENTIALTYPE]                     NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ReportEDFactsK12StaffCounts] PRIMARY KEY CLUSTERED ([ReportEDFactsK12StaffCountId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactPersonnelCountReports_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsK12StaffCounts]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'K12STAFFCLASSIFICATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The titles of employment, official status, or rank of education staff.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'K12STAFFCLASSIFICATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'K12 Staff Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'K12STAFFCLASSIFICATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'K12STAFFCLASSIFICATION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'K12STAFFCLASSIFICATION';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student''s scores were proficient.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Proficiency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21565' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONAGEGROUPTAUGHT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The age range of special education students taught.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONAGEGROUPTAUGHT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Age Group Taught' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONAGEGROUPTAUGHT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000564' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONAGEGROUPTAUGHT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21556' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONAGEGROUPTAUGHT';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONSUPPORTSERVICESCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of personnel employed and contracted to provide special education and related services for children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONSUPPORTSERVICESCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Support Services Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONSUPPORTSERVICESCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000558' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONSUPPORTSERVICESCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21549' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONSUPPORTSERVICESCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the progress made by a student toward English proficiency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Accountability Progress Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMSTAFFCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of employment, official status, or rank for staff working in a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMSTAFFCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Staff Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMSTAFFCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMSTAFFCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMSTAFFCATEGORY';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSCERTIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an educator holds the certification or licensure required by their assignment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSCERTIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Certification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSCERTIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001997' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSCERTIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSCERTIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHERINEXPERIENCEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as inexperienced as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHERINEXPERIENCEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Inexperienced Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHERINEXPERIENCEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001961' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHERINEXPERIENCEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22929' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHERINEXPERIENCEDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHEROUTOFFIELDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as teaching a subject or field for which they are not certified or licensed as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHEROUTOFFIELDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Out of Field Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHEROUTOFFIELDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001962' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHEROUTOFFIELDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22930' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSTEACHEROUTOFFIELDSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONTEACHERQUALIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether special education teachers are fully certified in the State..' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONTEACHERQUALIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Teacher Qualification Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONTEACHERQUALIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001996' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONTEACHERQUALIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22993' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONTEACHERQUALIFICATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StaffFullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The ratio between the hours of work expected in a position and the hours of work normally expected in a full-time position in the same setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StaffFullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StaffFullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000118' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StaffFullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21118' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'StaffFullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title III language instructional education programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Language Instruction Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000447' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StaffCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO