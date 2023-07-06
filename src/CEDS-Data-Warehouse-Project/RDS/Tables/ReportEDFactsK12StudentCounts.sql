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
    [ISO6392LANGUAGE]                                    NVARCHAR (50)   NULL,
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

