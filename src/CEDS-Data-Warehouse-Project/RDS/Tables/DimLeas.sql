CREATE TABLE [RDS].[DimLeas] (
    [DimLeaID]                                  INT             IDENTITY (1, 1) NOT NULL,
    [IeuOrganizationName]                       NVARCHAR (1000) NULL,
    [IeuOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [StateAnsiCode]                             NVARCHAR (10)   NULL,
    [StateAbbreviationCode]                     NVARCHAR (10)   NULL,
    [StateAbbreviationDescription]              NVARCHAR (1000) NULL,
    [SeaOrganizationName]                       NVARCHAR (1000) NULL,
    [SeaOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [LeaOrganizationName]                       NVARCHAR (1000) NULL,
    [LeaIdentifierNces]                         NVARCHAR (50)   NULL,
    [LeaIdentifierSea]                          NVARCHAR (50)   NULL,
    [PriorLeaIdentifierSea]                     NVARCHAR (50)   NULL,
    [LeaSupervisoryUnionIdentificationNumber]   NCHAR (3)       NULL,
    [ReportedFederally]                         BIT             NULL,
    [LeaTypeCode]                               NVARCHAR (50)   NULL,
    [LeaTypeDescription]                        NVARCHAR (100)  NULL,
    [LeaTypeEdFactsCode]                        NVARCHAR (50)   NULL,
    [MailingAddressStreetNumberAndName]         NVARCHAR (150)  NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  NVARCHAR (40)   NULL,
    [MailingAddressCity]                        NVARCHAR (30)   NULL,
    [MailingAddressPostalCode]                  NVARCHAR (17)   NULL,
    [MailingAddressStateAbbreviation]           NVARCHAR (50)   NULL,
    [MailingAddressCountyAnsiCodeCode]          NCHAR (5)       NULL,
    [PhysicalAddressStreetNumberAndName]        NVARCHAR (150)  NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] NVARCHAR (40)   NULL,
    [PhysicalAddressCity]                       NVARCHAR (30)   NULL,
    [PhysicalAddressPostalCode]                 NVARCHAR (17)   NULL,
    [PhysicalAddressStateAbbreviation]          NVARCHAR (50)   NULL,
    [PhysicalAddressCountyAnsiCodeCode]         NCHAR (5)       NULL,
    [Longitude]                                 NVARCHAR (20)   NULL,
    [Latitude]                                  NVARCHAR (20)   NULL,
    [TelephoneNumber]                           NVARCHAR (24)   NULL,
    [WebSiteAddress]                            NVARCHAR (300)  NULL,
    [OutOfStateIndicator]                       BIT             NULL,
    [LeaOperationalStatus]                      NVARCHAR (50)   NULL,
    [LeaOperationalStatusEdFactsCode]           INT             NULL,
    [OperationalStatusEffectiveDate]            DATETIME2 (7)   NULL,
    [CharterLeaStatus]                          NVARCHAR (50)   NULL,
    [ReconstitutedStatus]                       NVARCHAR (50)   NULL,
    [McKinneyVentoSubgrantRecipient]            NVARCHAR (50)   NULL,
    [NameOfInstitution]                         NVARCHAR (1000) NULL,
    [RecordStartDateTime]                       DATETIME        NULL,
    [RecordEndDateTime]                         DATETIME        NULL,
    CONSTRAINT [PK_DimLeas] PRIMARY KEY CLUSTERED ([DimLeaID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimLeas_RecordStartDateTime]
    ON [RDS].[DimLeas]([RecordStartDateTime] ASC)
    INCLUDE([LeaIdentifierSea], [RecordEndDateTime]);


GO

CREATE NONCLUSTERED INDEX [IX_DimLeas_LeaIdentifierSea_RecordStartDateTime]
    ON [RDS].[DimLeas]([LeaIdentifierSea] ASC, [RecordStartDateTime] ASC);


GO

