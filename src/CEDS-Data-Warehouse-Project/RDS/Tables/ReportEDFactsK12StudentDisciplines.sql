CREATE TABLE [RDS].[ReportEDFactsK12StudentDisciplines] (
    [ReportEDFactsK12StudentDisciplineId]           INT             IDENTITY (1, 1) NOT NULL,
    [AGE]                                           NVARCHAR (50)   NULL,
    [SPECIALEDUCATIONEXITREASON]                    NVARCHAR (50)   NULL,
    [CTEPARTICIPANT]                                NVARCHAR (50)   NULL,
    [Categories]                                    NVARCHAR (300)  NULL,
    [CategorySetCode]                               NVARCHAR (40)   NOT NULL,
    [IDEADISABILITYTYPE]                            NVARCHAR (50)   NULL,
    [DISCIPLINARYACTIONTAKEN]                       NVARCHAR (50)   NULL,
    [DISCIPLINEMETHODOFCHILDRENWITHDISABILITIES]    NVARCHAR (50)   NULL,
    [DisciplineCount]                               INT             NOT NULL,
    [ECONOMICDISADVANTAGESTATUS]                    NVARCHAR (50)   NULL,
    [EDUCATIONALSERVICESAFTERREMOVAL]               NVARCHAR (50)   NULL,
    [IDEAEDUCATIONALENVIRONMENTFORSCHOOLAGE]        NVARCHAR (50)   NULL,
    [ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS] NVARCHAR (50)   NULL,
    [PROGRAMPARTICIPATIONFOSTERCARE]                NVARCHAR (50)   NULL,
    [HOMELESSNESSSTATUS]                            NVARCHAR (50)   NULL,
    [TITLEIIIIMMIGRANTPARTICIPATIONSTATUS]          NVARCHAR (50)   NULL,
    [ENGLISHLEARNERSTATUS]                          NVARCHAR (50)   NULL,
    [MIGRANTSTATUS]                                 NVARCHAR (50)   NULL,
    [OrganizationName]                              NVARCHAR (1000) NOT NULL,
    [OrganizationIdentifierNces]                    NVARCHAR (100)  NOT NULL,
    [OrganizationIdentifierSea]                     NVARCHAR (100)  NOT NULL,
    [ParentOrganizationIdentifierSea]               NVARCHAR (MAX)  NULL,
    [RACE]                                          NVARCHAR (50)   NULL,
    [REMOVALLENGTH]                                 NVARCHAR (50)   NULL,
    [IDEAINTERIMREMOVALREASON]                      NVARCHAR (50)   NULL,
    [IDEAINTERIMREMOVAL]                            NVARCHAR (50)   NULL,
    [ReportCode]                                    NVARCHAR (40)   NOT NULL,
    [ReportLevel]                                   NVARCHAR (40)   NOT NULL,
    [ReportYear]                                    NVARCHAR (40)   NOT NULL,
    [SECTION504STATUS]                              NVARCHAR (50)   NULL,
    [SEX]                                           NVARCHAR (50)   NULL,
    [StateANSICode]                                 NVARCHAR (100)  NOT NULL,
    [StateAbbreviationCode]                         NVARCHAR (100)  NOT NULL,
    [StateAbbreviationDescription]                  NVARCHAR (1000) NOT NULL,
    [TableTypeAbbrv]                                NVARCHAR (MAX)  NULL,
    [TotalIndicator]                                NVARCHAR (MAX)  NULL,
    [MILITARYCONNECTEDSTUDENTINDICATOR]             NVARCHAR (50)   NULL,
    [TITLEIIIIMMIGRANTSTATUS]                       NVARCHAR (50)   NULL,
    [HOMELESSPRIMARYNIGHTTIMERESIDENCE]             NVARCHAR (50)   NULL,
    [HOMELESSUNACCOMPANIEDYOUTHSTATUS]              NVARCHAR (50)   NULL,
    [DISCIPLINEELSTATUS]                            VARCHAR (50)    NULL,
    [FIREARMTYPE]                                   VARCHAR (50)    NULL,
    [DISCIPLINEMETHODFORFIREARMSINCIDENTS]          VARCHAR (50)    NULL,
    [IDEADISCIPLINEMETHODFORFIREARMSINCIDENTS]      VARCHAR (50)    NULL,
    [GRADELEVEL]                                    VARCHAR (50)    NULL,
    [YEAR]                                          NVARCHAR (50)   NULL,
    [CTEAEDISPLACEDHOMEMAKERINDICATOR]              NVARCHAR (50)   NULL,
    [CTENONTRADITIONALGENDERSTATUS]                 NVARCHAR (50)   NULL,
    [SINGLEPARENTORSINGLEPREGNANTWOMANSTATUS]       NVARCHAR (50)   NULL,
    [CTEGRADUATIONRATEINCLUSION]                    NVARCHAR (50)   NULL,
    [REPRESENTATIONSTATUS]                          NVARCHAR (50)   NULL,
    [HOMELESSSERVICEDINDICATOR]                     NVARCHAR (50)   NULL,
    [PERKINSENGLISHLEARNERSTATUS]                   NVARCHAR (50)   NULL,
    [IDEAINDICATOR]                                 VARCHAR (50)    NULL,
    [CTECONCENTRATOR]                               NVARCHAR (50)   NULL,
    [IDEAEDUCATIONALENVIRONMENTFOREARLYCHILDHOOD]   NVARCHAR (50)   NULL,
    [DISCIPLINEREASON]                              NVARCHAR (50)   NULL,
    [INCIDENTBEHAVIOR]                              NVARCHAR (50)   NULL,
    [INCIDENTINJURYTYPE]                            NVARCHAR (50)   NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_FactStudentDisciplineReports_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsK12StudentDisciplines]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person who ; (A) (i) has worked primarily without remuneration to care for a home and family, and for that reason has diminished marketable skills;    (ii) has been dependent on the income of another family member but is no longer supported by that income; or    (iii) is a parent whose youngest dependent child will become ineligible to receive assistance under part A of title IV of the Social Security Act (42 U.S.C. 601 et seq.) not later than 2 years after the date on which the parent applies for assistance under such title; and (B)   is unemployed or underemployed and is experiencing difficulty in obtaining or upgrading employment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career-Technical-Adult Education Displaced Homemaker Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21084' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEAEDISPLACEDHOMEMAKERINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of how CTE concentrators are included in the state''s computation of its graduation rate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career and Technical Education Graduation Rate Inclusion' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTEGRADUATIONRATEINCLUSION';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether CTE participants were members of an underrepresented gender group (where one gender comprises less than 25 percent of the persons employed in those occupations or field of work).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Career Technical Education Nontraditional Gender Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21581' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'CTENONTRADITIONALGENDERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINARYACTIONTAKEN';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies the consequences of an incident for the student(s) involved in an incident as perpetrator(s).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINARYACTIONTAKEN';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disciplinary Action Taken' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINARYACTIONTAKEN';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000488' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINARYACTIONTAKEN';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINARYACTIONTAKEN';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to discipline students who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODOFCHILDRENWITHDISABILITIES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of suspension or expulsion used for the discipline of children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODOFCHILDRENWITHDISABILITIES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method of Children with Disabilities' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODOFCHILDRENWITHDISABILITIES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODOFCHILDRENWITHDISABILITIES';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21529' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'DISCIPLINEMETHODOFCHILDRENWITHDISABILITIES';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ECONOMICDISADVANTAGESTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'EDUCATIONALSERVICESAFTERREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether children (students) were provided educational services when removed from the regular school program for disciplinary reasons.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'EDUCATIONALSERVICESAFTERREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Educational Services After Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'EDUCATIONALSERVICESAFTERREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'EDUCATIONALSERVICESAFTERREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21570' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'EDUCATIONALSERVICESAFTERREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ENGLISHLEARNERSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'FIREARMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of firearm.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'FIREARMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Firearm Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'FIREARMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000557' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'FIREARMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21548' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'FIREARMTYPE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21149' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSNESSSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary nighttime residence of the person at the time the person was identified as homeless.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Primary Nighttime Residence' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21146' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSPRIMARYNIGHTTIMERESIDENCE';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether homeless children and youth were served by a McKinney-Vento program  in the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Serviced Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21147' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSSERVICEDINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that homeless youths were unaccompanied by parents or legal guardians.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Unaccompanied Youth Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21148' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'HOMELESSUNACCOMPANIEDYOUTHSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEADISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to discipline students who are not children with disabilities (IDEA) involved in firearms and other outcomes of firearms incidents.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEADISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method for Firearms Incidents' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEADISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEADISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21546' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEADISCIPLINEMETHODFORFIREARMSINCIDENTS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21151' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of interim removal from current educational setting experienced by children with disabilities (IDEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000541' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVAL';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVALREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVALREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVALREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVALREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'IDEAINTERIMREMOVALREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MIGRANTSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student’s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'MILITARYCONNECTEDSTUDENTINDICATOR';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierNces';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of a non-person entity such as an organization, institution, agency or business.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21204' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'OrganizationName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an organization by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Organization Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000826' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21825' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'ParentOrganizationIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Individuals with disabilities who are being provided with related aids and services under Section 504 of the Rehabilitation Act of 1973, as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Section 504 Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21249' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SECTION504STATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SEX';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason children who were in special education at the start of the reporting period were not in special education at the end of the reporting period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21260' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'SPECIALEDUCATIONEXITREASON';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21267' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateAbbreviationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The American National Standards Institute (ANSI) two-digit code for the state.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State ANSI Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000424' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21414' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'StateANSICode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that an immigrant student participated in programs for immigrant children and youth funded under ESEA Title III Section 3114(d)(1) using funds reserved for immigrant education programs/activities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Participation Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21290' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'ReportEDFactsK12StudentDisciplines', @level2type=N'COLUMN',@level2name=N'TITLEIIIIMMIGRANTPARTICIPATIONSTATUS';
GO