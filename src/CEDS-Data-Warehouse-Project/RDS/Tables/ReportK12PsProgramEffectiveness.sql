CREATE TABLE [RDS].[ReportK12PsProgramEffectiveness] (
    [ReportLevel]                       NVARCHAR (20)  NOT NULL,
    [ReportCode]                        NVARCHAR (20)  NOT NULL,
    [SchoolYear]                        SMALLINT       NOT NULL,
    [CategorySetCode]                   NVARCHAR (20)  NOT NULL,
    [IPEDSIdentifier]                   NVARCHAR (40)  NULL,
    [PsNameOfInstitution]               NVARCHAR (100) NULL,
    [K12OrganizationIdentifierSea]      NVARCHAR (40)  NULL,
    [K12OrganizationName]               NVARCHAR (100) NULL,
    [ReportMeasureLabel]                NVARCHAR (100) NULL,
    [ReportMeasure]                     NVARCHAR (MAX) NOT NULL,
    [Sex]                               NVARCHAR (10)  NULL,
    [RaceEthnicity]                     NVARCHAR (60)  NULL,
    [EconomicDisadvantageStatus]        NVARCHAR (10)  NULL,
    [IdeaIndicator]                     NVARCHAR (10)  NULL,
    [HomelessPrimaryNighttimeResidence] NVARCHAR (20)  NULL,
    [MigrantStatus]                     NVARCHAR (10)  NULL,
    [EnglishLearnerStatus]              NVARCHAR (10)  NULL
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidence';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary nighttime residence of the person at the time the person was identified as homeless.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidence';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Primary Nighttime Residence' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidence';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidence';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'HomelessPrimaryNighttimeResidence';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IdeaIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IdeaIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IdeaIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IdeaIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IdeaIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IPEDSIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Unique identification number assigned to postsecondary institutions surveyed through the Integrated Postsecondary Education Data System (IPEDS). Also referred to as UNITID or IPEDS ID.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IPEDSIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Institution IPEDS UnitID' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IPEDSIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000166' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IPEDSIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21166' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'IPEDSIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'K12OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'PsNameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legally accepted name of the institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'PsNameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Name of Institution' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'PsNameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000191' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'PsNameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21191' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'PsNameOfInstitution';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportK12PsProgramEffectiveness', @level2type=N'COLUMN',@level2name=N'Sex';
GO