CREATE TABLE [RDS].[ReportEDFactsOrganizationStatusCounts] (
    [ReportEDFactsOrganizationStatusCountId] INT             IDENTITY (1, 1) NOT NULL,
    [Categories]                             NVARCHAR (300)  NULL,
    [CategorySetCode]                        NVARCHAR (40)   NULL,
    [ReportCode]                             NVARCHAR (40)   NOT NULL,
    [ReportLevel]                            NVARCHAR (40)   NOT NULL,
    [ReportYear]                             NVARCHAR (40)   NOT NULL,
    [StateANSICode]                          NVARCHAR (100)  NOT NULL,
    [StateCode]                              NVARCHAR (100)  NOT NULL,
    [StateName]                              NVARCHAR (500)  NOT NULL,
    [OrganizationId]                         INT             NOT NULL,
    [OrganizationName]                       NVARCHAR (1000) NOT NULL,
    [OrganizationNcesId]                     NVARCHAR (100)  NOT NULL,
    [OrganizationStateId]                    NVARCHAR (100)  NOT NULL,
    [ParentOrganizationStateId]              NVARCHAR (100)  NULL,
    [RACE]                                   NVARCHAR (50)   NULL,
    [DISABILITY]                             NVARCHAR (50)   NULL,
    [LEPSTATUS]                              NVARCHAR (50)   NULL,
    [ECODISSTATUS]                           NVARCHAR (50)   NULL,
    [INDICATORSTATUS]                        NVARCHAR (50)   NULL,
    [STATEDEFINEDSTATUSCODE]                 NVARCHAR (50)   NULL,
    [OrganizationStatusCount]                INT             NOT NULL,
    [STATEDEFINEDCUSTOMINDICATORCODE]        NVARCHAR (50)   NULL,
    [TableTypeAbbrv]                         NVARCHAR (100)  NULL,
    [TotalIndicator]                         NVARCHAR (50)   NULL,
    [BASISOFEXIT]                            NVARCHAR (50)   NULL,
    [EDUCENV]                                NVARCHAR (50)   NULL,
    [HOMELESSNIGHTTIMERESIDENCE]             NVARCHAR (50)   NULL,
    [HOMELESSSTATUS]                         NVARCHAR (50)   NULL,
    [HOMELESSUNACCOMPANIEDYOUTHSTATUS]       NVARCHAR (50)   NULL,
    [MIGRANTSTATUS]                          NVARCHAR (50)   NULL,
    [MILITARYCONNECTEDSTATUS]                NVARCHAR (50)   NULL,
    [SEX]                                    NVARCHAR (50)   NULL,
    [INDICATORSTATUSTYPECODE]                NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ReportEDFactsOrganizationStatusCounts] PRIMARY KEY CLUSTERED ([ReportEDFactsOrganizationStatusCountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactOrganizationStatusCounts_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsOrganizationStatusCounts]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [Categories] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

