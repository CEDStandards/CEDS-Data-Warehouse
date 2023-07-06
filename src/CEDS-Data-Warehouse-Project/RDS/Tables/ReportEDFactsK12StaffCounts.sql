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
    CONSTRAINT [PK_ReportEDFactsK12StaffCounts] PRIMARY KEY CLUSTERED ([ReportEDFactsK12StaffCountId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactPersonnelCountReports_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsK12StaffCounts]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC);


GO

