CREATE TABLE [RDS].[ReportEDFactsK12StudentAssessments] (
    [ReportEDFactsK12StudentAssessmentId]           INT             IDENTITY (1, 1) NOT NULL,
    [ASSESSMENTSUBJECT]                             NVARCHAR (50)   NULL,
    [ASSESSMENTTYPE]                                NVARCHAR (50)   NULL,
    [AssessmentCount]                               INT             NOT NULL,
    [SPECIALEDUCATIONEXITREASON]                    NVARCHAR (50)   NULL,
    [CTEPROGRAM]                                    NVARCHAR (50)   NULL,
    [Categories]                                    NVARCHAR (300)  NULL,
    [CategorySetCode]                               NVARCHAR (40)   NOT NULL,
    [IDEADISABILITYTYPE]                            NVARCHAR (50)   NULL,
    [ECONOMICDISADVANTAGESTATUS]                    NVARCHAR (50)   NULL,
    [IDEAEDUCATIONALENVIRONMENT]                    NVARCHAR (50)   NULL,
    [ELIGIBILITYSTATUSFORSCHOOLFOODSERVICEPROGRAMS] NVARCHAR (50)   NULL,
    [FOSTERCAREPROGRAM]                             NVARCHAR (50)   NULL,
    [FULLYEARSTATUS]                                NVARCHAR (50)   NULL,
    [GRADELEVEL]                                    NVARCHAR (50)   NULL,
    [HOMElESSNESSSTATUS]                            NVARCHAR (50)   NULL,
    [TITLEIIIIMMIGRANTPARTICIPATIONSTATUS]          NVARCHAR (50)   NULL,
    [ENGLISHLEARNERSTATUS]                          NVARCHAR (50)   NULL,
    [MIGRANTSTATUS]                                 NVARCHAR (50)   NULL,
    [OrganizationName]                              NVARCHAR (1000) NOT NULL,
    [OrganizationIdentifierNces]                    NVARCHAR (100)  NOT NULL,
    [OrganizationIdentifierSea]                     NVARCHAR (100)  NOT NULL,
    [PARTICIPATIONSTATUS]                           NVARCHAR (50)   NULL,
    [PERFORMANCELEVEL]                              NVARCHAR (50)   NULL,
    [ParentOrganizationIdentifierSea]               NVARCHAR (MAX)  NULL,
    [RACE]                                          NVARCHAR (50)   NULL,
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
    [ASSESSEDFIRSTTIME]                             NVARCHAR (50)   NULL,
    [FORMERENGLISHLEARNERYEARSTATUS]                NVARCHAR (50)   NULL,
    [MILITARYCONNECTEDSTUDENTINDICATOR]             NVARCHAR (50)   NULL,
    [PROFICIENCYSTATUS]                             NVARCHAR (50)   NULL,
    [TITLEIIIACCOUNTABILITYPROGRESSSTATUS]          NVARCHAR (50)   NULL,
    [TITLEIIILANGUAGEINSTRUCTIONPROGRAMTYPE]        NVARCHAR (50)   NULL,
    [TITLEIIIPROGRAMPARTICIPATION]                  NVARCHAR (50)   NULL,
    [CTEAEDISPLACEDHOMEMAKERINDICATOR]              NVARCHAR (50)   NULL,
    [CTENONTRADITIONALGENDERSTATUS]                 NVARCHAR (50)   NULL,
    [PLACEMENTSTATUS]                               NVARCHAR (50)   NULL,
    [PLACEMENTTYPE]                                 NVARCHAR (50)   NULL,
    [REPRESENTATIONSTATUS]                          NVARCHAR (50)   NULL,
    [SINGLEPARENTORSINGLEPREGNANTWOMAN]             NVARCHAR (50)   NULL,
    [NEGLECTEDORDELINQUENTPROGRAMTYPE]              NVARCHAR (50)   NULL,
    [MOBILITYSTATUS12MO]                            NVARCHAR (50)   NULL,
    [MOBILITYSTATUSSY]                              NVARCHAR (50)   NULL,
    [REFERRALSTATUS]                                NVARCHAR (50)   NULL,
    [CTEGRADUATIONRATEINCLUSION]                    NVARCHAR (50)   NULL,
    [TESTRESULT]                                    NVARCHAR (50)   NULL,
    [HOMELESSPRIMARYNIGHTTIMERESIDENCE]             NVARCHAR (50)   NULL,
    [HOMELESSUNACCOMPANIEDYOUTHSTATUS]              NVARCHAR (50)   NULL,
    [PROGRESSLEVEL]                                 NVARCHAR (50)   NULL,
    [YEAR]                                          NVARCHAR (50)   NULL,
    [LONGTERMSTATUS]                                NVARCHAR (50)   NULL,
    [HIGHSCHOOLDIPLOMATYPE]                         NVARCHAR (50)   NULL,
    [ACADEMICORVOCATIONALEXITOUTCOME]               NVARCHAR (50)   NULL,
    [ACADEMICORVOCATIONALOUTCOME]                   NVARCHAR (50)   NULL,
    [HOMELESSSERVICEDINDICATOR]                     NVARCHAR (50)   NULL,
    [PERKINSENGLISHLEARNERSTATUS]                   NVARCHAR (50)   NULL,
    [IDEAINDICATOR]                                 VARCHAR (50)    NULL,
    [TITLEISUPPORTSERVICES]                         VARCHAR (50)    NULL,
    [TITLEIINSTRUCTIONALSERVICES]                   VARCHAR (50)    NULL,
    [TITLEIPROGRAMTYPE]                             VARCHAR (50)    NULL,
    [TITLEISCHOOLSTATUS]                            VARCHAR (50)    NULL,
    [PostSecondaryEnrollmentStatus]                 VARCHAR (50)    NULL,
    [AssessmentTypeAdministeredToEnglishLearners]   VARCHAR (50)    NULL,
    CONSTRAINT [PK_FactStudentAssessmentReports] PRIMARY KEY CLUSTERED ([ReportEDFactsK12StudentAssessmentId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactStudentAssessmentReports_ReportCode_ReportYear_ReportLevel_CategorySetCode_SubJect_AssmentType_Grade]
    ON [RDS].[ReportEDFactsK12StudentAssessments]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC, [ASSESSMENTSUBJECT] ASC, [ASSESSMENTTYPE] ASC, [GRADELEVEL] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactStudentAssessmentReports_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsK12StudentAssessments]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC);


GO

