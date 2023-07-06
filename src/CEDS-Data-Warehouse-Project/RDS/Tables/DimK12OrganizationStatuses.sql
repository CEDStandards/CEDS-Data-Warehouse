CREATE TABLE [RDS].[DimK12OrganizationStatuses] (
    [DimK12OrganizationStatusId]                         INT            IDENTITY (1, 1) NOT NULL,
    [ReapAlternativeFundingStatusCode]                   NVARCHAR (50)  NULL,
    [ReapAlternativeFundingStatusDescription]            NVARCHAR (MAX) NULL,
    [ReapAlternativeFundingStatusEdFactsCode]            NVARCHAR (50)  NULL,
    [GunFreeSchoolsActReportingStatusCode]               NVARCHAR (50)  NULL,
    [GunFreeSchoolsActReportingStatusDescription]        NVARCHAR (MAX) NULL,
    [GunFreeSchoolsActReportingStatusEdFactsCode]        NVARCHAR (50)  NULL,
    [HighSchoolGraduationRateIndicatorStatusCode]        NVARCHAR (50)  NULL,
    [HighSchoolGraduationRateIndicatorStatusDescription] NVARCHAR (MAX) NULL,
    [HighSchoolGraduationRateIndicatorStatusEdFactsCode] NVARCHAR (50)  NULL,
    [McKinneyVentoSubgrantRecipientCode]                 NVARCHAR (50)  NULL,
    [McKinneyVentoSubgrantRecipientDescription]          NVARCHAR (MAX) NULL,
    [McKinneyVentoSubgrantRecipientEdFactsCode]          NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimK12OrganizationStatus] PRIMARY KEY CLUSTERED ([DimK12OrganizationStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_Codes]
    ON [RDS].[DimK12OrganizationStatuses]([ReapAlternativeFundingStatusCode] ASC, [GunFreeSchoolsActReportingStatusCode] ASC, [HighSchoolGraduationRateIndicatorStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_HighSchoolGraduationRateIndicatorStatusEdFactsCode]
    ON [RDS].[DimK12OrganizationStatuses]([HighSchoolGraduationRateIndicatorStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_ReapAlternativeFundingStatusEdFactsCode]
    ON [RDS].[DimK12OrganizationStatuses]([ReapAlternativeFundingStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12OrganizationStatuses_GunFreeSchoolsActReportingStatusEdFactsCode]
    ON [RDS].[DimK12OrganizationStatuses]([GunFreeSchoolsActReportingStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

