CREATE TABLE [RDS].[ReportEDFactsK12StudentCounts] (
    [ReportEDFactsK12StudentCountId]                     INT             IDENTITY (1, 1) NOT NULL,
    [AGE]                                                NVARCHAR (50)   NULL,
    [SPECIALEDUCATIONEXITREASON]                         NVARCHAR (50)   NULL,
    [CTEPARTICIPANT]                                     NVARCHAR (50)   NULL,
    [Categories]                                         NVARCHAR (300)  NULL,
    [CategorySetCode]                                    NVARCHAR (40)   NOT NULL,
    [IDEADISABILITYTYPE]                                 NVARCHAR (50)   NULL,
    [ECONOMICDISADVANTAGESTATUS]                         NVARCHAR (50)   NULL,
    [IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE]             NVARCHAR (50)   NULL,
    [ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS]      NVARCHAR (50)   NULL,
    [PROGRAMPARTICIPATIONFOSTERCARE]                     NVARCHAR (50)   NULL,
    [GRADELEVEL]                                         NVARCHAR (50)   NULL,
    [HOMELESSNESSSTATUS]                                 NVARCHAR (50)   NULL,
    [TITLEIIIIMMIGRANTPARTICIPATIONSTATUS]               NVARCHAR (50)   NULL,
    [ENGLISHLEARNERSTATUS]                               NVARCHAR (50)   NULL,
    [MIGRANTSTATUS]                                      NVARCHAR (50)   NULL,
    [OrganizationName]                                   NVARCHAR (1000) NOT NULL,
    [OrganizationIdentifierNces]                         NVARCHAR (100)  NOT NULL,
    [OrganizationIdentifierSea]                          NVARCHAR (100)  NOT NULL,
    [ParentOrganizationIdentifierSea]                    NVARCHAR (100)  NULL,
    [RACE]                                               NVARCHAR (50)   NULL,
    [ReportCode]                                         NVARCHAR (40)   NOT NULL,
    [ReportLevel]                                        NVARCHAR (40)   NOT NULL,
    [ReportYear]                                         NVARCHAR (40)   NOT NULL,
    [SECTION504STATUS]                                   NVARCHAR (50)   NULL,
    [SEX]                                                NVARCHAR (50)   NULL,
    [StateANSICode]                                      NVARCHAR (100)  NOT NULL,
    [StateAbbreviationCode]                              NVARCHAR (100)  NOT NULL,
    [StateAbbreviationDescription]                       NVARCHAR (500)  NOT NULL,
    [StudentCount]                                       INT             NOT NULL,
    [TITLEISUPPORTSERVICES]                              NVARCHAR (50)   NULL,
    [TableTypeAbbrv]                                     NVARCHAR (100)  NULL,
    [TotalIndicator]                                     NVARCHAR (5)    NULL,
    [CONTINUATIONOFSERVICESREASON]                       NVARCHAR (50)   NULL,
    [HIGHSCHOOLDIPLOMATYPE]                              NVARCHAR (50)   NULL,
    [ISO6392LANGUAGECODE]                                NVARCHAR (50)   NULL,
    [CONSOLIDATEDMEPFUNDSSTATUS]                         NVARCHAR (50)   NULL,
    [MIGRANTEDUCATIONPROGRAMSERVICESTYPE]                NVARCHAR (50)   NULL,
    [MIGRANTPRIORITIZEDFORSERVICES]                      NVARCHAR (50)   NULL,
    [MOBILITYSTATUS12MO]                                 NVARCHAR (50)   NULL,
    [MOBILITYSTATUSSY]                                   NVARCHAR (50)   NULL,
    [REFERRALSTATUS]                                     NVARCHAR (50)   NULL,
    [TITLEIINSTRUCTIONALSERVICES]                        NVARCHAR (50)   NULL,
    [TITLEIPROGRAMTYPE]                                  NVARCHAR (50)   NULL,
    [TITLEISCHOOLSTATUS]                                 NVARCHAR (50)   NULL,
    [MIGRANTEDUCATIONPROGRAMENROLLMENTTYPE]              NVARCHAR (50)   NULL,
    [FORMERENGLISHLEARNERYEARSTATUS]                     NVARCHAR (50)   NULL,
    [MILITARYCONNECTEDSTUDENTINDICATOR]                  NVARCHAR (50)   NULL,
    [PROFICIENCYSTATUS]                                  NVARCHAR (50)   NULL,
    [TITLEIIIACCOUNTABILITYPROGRESSSTATUS]               NVARCHAR (50)   NULL,
    [TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE]             NVARCHAR (50)   NULL,
    [TITLEIIIIMMIGRANTSTATUS]                            NVARCHAR (50)   NULL,
    [CTEAEDISPLACEDHOMEMAKERINDICATOR]                   NVARCHAR (50)   NULL,
    [CTENONTRADITIONALGENDERSTATUS]                      NVARCHAR (50)   NULL,
    [REPRESENTATIONSTATUS]                               NVARCHAR (50)   NULL,
    [SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS]            NVARCHAR (50)   NULL,
    [CTEGRADUATIONRATEINCLUSION]                         NVARCHAR (50)   NULL,
    [SCHOOLIMPROVEMENTSTATUS]                            NVARCHAR (MAX)  NULL,
    [PERSISTENTLYDANGEROUSSTATUS]                        NVARCHAR (MAX)  NULL,
    [HOMELESSPRIMARYNIGHTTIMERESIDENCE]                  NVARCHAR (50)   NULL,
    [HOMELESSUNACCOMPANIEDYOUTHSTATUS]                   NVARCHAR (50)   NULL,
    [ATTENDANCE]                                         VARCHAR (50)    NULL,
    [PostSecondaryEnrollmentStatus]                      VARCHAR (50)    NULL,
    [ADJUSTEDCOHORTGRADUATIONRATE]                       DECIMAL (9, 2)  NULL,
    [COHORTSTATUS]                                       VARCHAR (50)    NULL,
    [EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMETYPE]     NVARCHAR (50)   NULL,
    [NEGLECTEDORDELINQUENTPROGRAMTYPE]                   NVARCHAR (50)   NULL,
    [YEAR]                                               NVARCHAR (20)   NULL,
    [NEGLECTEDORDELINQUENTLONGTERMSTATUS]                NVARCHAR (50)   NULL,
    [PROGRESSLEVEL]                                      NVARCHAR (50)   NULL,
    [ASSESSMENTACADEMICSUBJECT]                          NVARCHAR (50)   NULL,
    [EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMEEXITTYPE] NVARCHAR (50)   NULL,
    [HOMELESSSERVICEDINDICATOR]                          NVARCHAR (50)   NULL,
    [PERKINSENGLISHLEARNERSTATUS]                        NVARCHAR (50)   NULL,
    [IDEAINDICATOR]                                      VARCHAR (50)    NULL,
    [CTECONCENTRATOR]                                    NVARCHAR (50)   NULL,
    [IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD]        NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ReportEDFactsK12StudentCounts] PRIMARY KEY CLUSTERED ([ReportEDFactsK12StudentCountId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactStudentCountReports_CategorySetCode_DISABILITY_Report]
    ON [RDS].[ReportEDFactsK12StudentCounts]([CategorySetCode] ASC, [IDEADISABILITYTYPE] ASC, [ReportCode] ASC, [ReportLevel] ASC, [ReportYear] ASC)
    INCLUDE([CTEPARTICIPANT], [ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS], [PROGRAMPARTICIPATIONFOSTERCARE], [HOMELESSNESSSTATUS], [TITLEIIIIMMIGRANTPARTICIPATIONSTATUS], [ENGLISHLEARNERSTATUS], [MIGRANTSTATUS], [OrganizationName], [OrganizationIdentifierNces], [OrganizationIdentifierSea], [ParentOrganizationIdentifierSea], [SECTION504STATUS], [StateANSICode], [StateAbbreviationCode], [StateAbbreviationDescription], [StudentCount], [TITLEISCHOOLSTATUS]);


GO

CREATE NONCLUSTERED INDEX [IX_FactStudentCountReports_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsK12StudentCounts]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONSOLIDATEDMEPFUNDSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school has a school-wide program, as defined by current law, in which federal Migrant Education Program (MEP) funds are consolidated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONSOLIDATEDMEPFUNDSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Consolidated Migrant Education Program Funds Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONSOLIDATEDMEPFUNDSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000542' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONSOLIDATEDMEPFUNDSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21533' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONSOLIDATEDMEPFUNDSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONTINUATIONOFSERVICESREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Reason why the student is being served under the continuation of services provision of the MEP.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONTINUATIONOFSERVICESREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Continuation of Services Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONTINUATIONOFSERVICESREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000429' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONTINUATIONOFSERVICESREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21419' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CONTINUATIONOFSERVICESREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who ; (A) (i) has worked primarily without remuneration to care for a home and family, and for that reason has diminished marketable skills;    (ii) has been dependent on the income of another family member but is no longer supported by that income; or    (iii) is a parent whose youngest dependent child will become ineligible to receive assistance under part A of title IV of the Social Security Act (42 U.S.C. 601 et seq.) not later than 2 years after the date on which the parent applies for assistance under such title; and (B)   is unemployed or underemployed and is experiencing difficulty in obtaining or upgrading employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career-Technical-Adult Education Displaced Homemaker Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how CTE concentrators are included in the state''s computation of its graduation rate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Graduation Rate Inclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether CTE participants were members of an underrepresented gender group (where one gender comprises less than 25 percent of the persons employed in those occupations or field of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Technical Education Nontraditional Gender Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HIGHSCHOOLDIPLOMATYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of diploma/credential that is awarded to a person in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HIGHSCHOOLDIPLOMATYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Diploma Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HIGHSCHOOLDIPLOMATYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HIGHSCHOOLDIPLOMATYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HIGHSCHOOLDIPLOMATYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary nighttime residence of the person at the time the person was identified as homeless.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Primary Nighttime Residence' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether homeless children and youth were served by a McKinney-Vento program  in the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Serviced Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that homeless youths were unaccompanied by parents or legal guardians.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Unaccompanied Youth Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ISO6392LANGUAGECODE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The code for the specific language or dialect that a person uses to communicate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ISO6392LANGUAGECODE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'ISO 639-2 Language Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ISO6392LANGUAGECODE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ISO6392LANGUAGECODE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ISO6392LANGUAGECODE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTPRIORITIZEDFORSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a migratory child 1) is failing to meet, or most at risk of failing to meet, the state''s challenging academic content standards and student academic achievement standards; and 2) has experienced interruptions in their education during the regular school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTPRIORITIZEDFORSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Prioritized for Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTPRIORITIZEDFORSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000562' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTPRIORITIZEDFORSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21554' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTPRIORITIZEDFORSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'NEGLECTEDORDELINQUENTPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'NEGLECTEDORDELINQUENTPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected or Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'NEGLECTEDORDELINQUENTPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'NEGLECTEDORDELINQUENTPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'NEGLECTEDORDELINQUENTPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school is identified as persistently dangerous in accordance with state definition.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Persistently Dangerous Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21210' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERSISTENTLYDANGEROUSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether a student''s name was, is, or will be officially registered on the roll of a school or schools.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21094' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PostSecondaryEnrollmentStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student''s scores were proficient.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Proficiency Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21565' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROFICIENCYSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Individuals with disabilities who are being provided with related aids and services under Section 504 of the Rehabilitation Act of 1973, as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Section 504 Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason children who were in special education at the start of the reporting period were not in special education at the end of the reporting period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the progress made by a student toward English proficiency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Accountability Progress Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21527' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIACCOUNTABILITYPROGRESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIINSTRUCTIONALSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of instructional services provided to students in ESEA Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIINSTRUCTIONALSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Instructional Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIINSTRUCTIONALSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIINSTRUCTIONALSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21282' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIINSTRUCTIONALSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title I program offered in the school or district.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21284' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISCHOOLSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a school is designated under state and federal regulations as being eligible for participation in programs authorized by Title I of ESEA as amended and whether it has a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISCHOOLSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISCHOOLSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISCHOOLSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21285' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISCHOOLSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISUPPORTSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of support services provided to students in Title I programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISUPPORTSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Support Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISUPPORTSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISUPPORTSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21289' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEISUPPORTSERVICES';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ASSESSMENTACADEMICSUBJECT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ASSESSMENTACADEMICSUBJECT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Academic Subject' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ASSESSMENTACADEMICSUBJECT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000021' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ASSESSMENTACADEMICSUBJECT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21021' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ASSESSMENTACADEMICSUBJECT';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTECONCENTRATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student who has met the state-defined threshold of career and technical education concentrators, as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTECONCENTRATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Concentrator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTECONCENTRATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTECONCENTRATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21037' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTECONCENTRATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEPARTICIPANT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication a student has met the state-defined threshold of Career and Technical Education participation as defined in the State''s approved Perkins IV State Plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEPARTICIPANT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Participant' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEPARTICIPANT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000592' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEPARTICIPANT';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21585' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'CTEPARTICIPANT';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMEEXITTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained up to 90 days after exiting the facility or program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMEEXITTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Exit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMEEXITTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001979' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMEEXITTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22927' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMEEXITTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMETYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of academic or career and technical outcome attained while enrolled in the program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMETYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Academic or Career and Technical Outcome Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMETYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001978' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMETYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22928' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'EDFACTSACADEMICORCAREERANDTECHNICALOUTCOMETYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student''s level of eligibility to participate in the National School Lunch Program for breakfast, lunch, snack, supper, and milk programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Eligibility Status for School Food Service Programs' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21092' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEADISABILITYTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A category of disability that describes a person''s impairment defined by the Individuals with Disabilities Education Act.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEADISABILITYTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Disability Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEADISABILITYTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001733' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEADISABILITYTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22714' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEADISABILITYTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The program in which children ages 3 through 5 attend and in which these children receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for Early Childhood' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000559' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The setting in which children ages 6 through 21, receive special education and related services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Educational Environment for School Age' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000535' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21526' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMENROLLMENTTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of school/migrant education project in which instruction and/or support services are provided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMENROLLMENTTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Enrollment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMENROLLMENTTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMENROLLMENTTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21427' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMENROLLMENTTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMSERVICESTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services received by participating migrant students in the migrant education program (MEP).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMSERVICESTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Services Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMSERVICESTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMSERVICESTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'MIGRANTEDUCATIONPROGRAMSERVICESTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERKINSENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERKINSENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERKINSENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERKINSENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PERKINSENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROGRESSLEVEL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The amount of progress shown in academic subjects.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROGRESSLEVEL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Progress Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROGRESSLEVEL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000561' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROGRESSLEVEL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21553' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'PROGRESSLEVEL';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'RACE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SCHOOLIMPROVEMENTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the improvement stage of the school.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SCHOOLIMPROVEMENTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Improvement Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SCHOOLIMPROVEMENTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SCHOOLIMPROVEMENTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21240' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SCHOOLIMPROVEMENTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A student who, at some time during the school year, is either a pregnant female student who is unmarried; or a male or female student who is unmarried or legally separated from a spouse and has a minor child or children.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Single Parent or Single Pregnant Woman Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000580' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21573' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the child is an immigrant according to the Title III of ESEA definition, meaning children who are aged 3 through 21; were not born in any state; and have not been attending one or more schools in any one or more States for more than 3 full academic years.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21291' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of Title III language instructional education programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Language Instruction Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000447' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentCounts', @level2type=N'COLUMN',@level2name=N'TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE';
GO