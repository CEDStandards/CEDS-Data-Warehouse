CREATE TABLE [RDS].[ReportEDFactsSchoolPerformanceIndicators] (
    [ReportEDFactsSchoolPerformanceIndicatorId] INT             NOT NULL,
    [Categories]                                NVARCHAR (300)  NULL,
    [CategorySetCode]                           NVARCHAR (40)   NULL,
    [ReportCode]                                NVARCHAR (40)   NOT NULL,
    [ReportLevel]                               NVARCHAR (40)   NOT NULL,
    [ReportYear]                                NVARCHAR (40)   NOT NULL,
    [StateANSICode]                             NVARCHAR (100)  NOT NULL,
    [StateCode]                                 NVARCHAR (100)  NOT NULL,
    [StateName]                                 NVARCHAR (500)  NOT NULL,
    [OrganizationId]                            INT             NOT NULL,
    [OrganizationName]                          NVARCHAR (1000) NOT NULL,
    [OrganizationNcesId]                        NVARCHAR (100)  NOT NULL,
    [OrganizationStateId]                       NVARCHAR (100)  NOT NULL,
    [ParentOrganizationStateId]                 NVARCHAR (100)  NULL,
    [RACE]                                      NVARCHAR (50)   NULL,
    [DISABILITY]                                NVARCHAR (50)   NULL,
    [LEPSTATUS]                                 NVARCHAR (50)   NULL,
    [ECODISSTATUS]                              NVARCHAR (50)   NULL,
    [SEX]                                       NVARCHAR (50)   NULL,
    [INDICATORSTATUS]                           NVARCHAR (50)   NULL,
    [STATEDDEFINEDSTATUSCODE]                   NVARCHAR (50)   NULL,
    CONSTRAINT [PK_ReportEDFactsSchoolPerformanceIndicators] PRIMARY KEY CLUSTERED ([ReportEDFactsSchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_ReportEDFactsSchoolPerformanceIndicators_ReportCode_ReportYear_ReportLevel_CategorySetCode]
    ON [RDS].[ReportEDFactsSchoolPerformanceIndicators]([ReportCode] ASC, [ReportYear] ASC, [ReportLevel] ASC, [CategorySetCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

