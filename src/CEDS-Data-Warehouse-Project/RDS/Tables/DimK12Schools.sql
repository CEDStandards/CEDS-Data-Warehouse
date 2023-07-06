CREATE TABLE [RDS].[DimK12Schools] (
    [DimK12SchoolId]                            INT             IDENTITY (1, 1) NOT NULL,
    [LeaOrganizationName]                       NVARCHAR (1000) NULL,
    [LeaIdentifierNces]                         NVARCHAR (50)   NULL,
    [LeaIdentifierSea]                          NVARCHAR (50)   NULL,
    [NameOfInstitution]                         NVARCHAR (1000) NULL,
    [SchoolIdentifierNces]                      NVARCHAR (50)   NULL,
    [SchoolIdentifierSea]                       NVARCHAR (50)   NULL,
    [SeaOrganizationName]                       NVARCHAR (1000) NULL,
    [SeaOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [StateAnsiCode]                             NVARCHAR (10)   NULL,
    [StateAbbreviationCode]                     NVARCHAR (10)   NULL,
    [StateAbbreviationDescription]              NVARCHAR (1000) NULL,
    [PriorLeaIdentifierSea]                     NVARCHAR (50)   NULL,
    [PriorSchoolIdentifierSea]                  NVARCHAR (50)   NULL,
    [CharterSchoolIndicator]                    BIT             NULL,
    [CharterSchoolContractIdNumber]             NVARCHAR (MAX)  NULL,
    [CharterSchoolContractApprovalDate]         NVARCHAR (MAX)  NULL,
    [CharterSchoolContractRenewalDate]          NVARCHAR (MAX)  NULL,
    [ReportedFederally]                         BIT             NULL,
    [LeaTypeCode]                               NVARCHAR (50)   NULL,
    [LeaTypeDescription]                        NVARCHAR (100)  NULL,
    [LeaTypeEdFactsCode]                        NVARCHAR (50)   NULL,
    [SchoolTypeCode]                            NVARCHAR (50)   NULL,
    [SchoolTypeDescription]                     NVARCHAR (100)  NULL,
    [SchoolTypeEdFactsCode]                     NVARCHAR (50)   NULL,
    [MailingAddressCity]                        NVARCHAR (30)   NULL,
    [MailingAddressPostalCode]                  NVARCHAR (17)   NULL,
    [MailingAddressStateAbbreviation]           NVARCHAR (50)   NULL,
    [MailingAddressStreetNumberAndName]         NVARCHAR (40)   NULL,
    [PhysicalAddressCity]                       NVARCHAR (30)   NULL,
    [PhysicalAddressPostalCode]                 NVARCHAR (17)   NULL,
    [PhysicalAddressStateAbbreviation]          NVARCHAR (50)   NULL,
    [PhysicalAddressStreetNumberAndName]        NVARCHAR (40)   NULL,
    [TelephoneNumber]                           NVARCHAR (24)   NULL,
    [WebSiteAddress]                            NVARCHAR (300)  NULL,
    [OutOfStateIndicator]                       BIT             NULL,
    [RecordStartDateTime]                       DATETIME        NULL,
    [RecordEndDateTime]                         DATETIME        NULL,
    [SchoolOperationalStatus]                   VARCHAR (50)    NULL,
    [SchoolOperationalStatusEdFactsCode]        INT             NULL,
    [CharterSchoolStatus]                       VARCHAR (50)    NULL,
    [ReconstitutedStatus]                       VARCHAR (50)    NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  VARCHAR (40)    NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] VARCHAR (40)    NULL,
    [IeuOrganizationName]                       NVARCHAR (1000) NULL,
    [IeuOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [MailingAddressCountyAnsiCodeCode]          CHAR (5)        NULL,
    [PhysicalAddressCountyAnsiCodeCode]         CHAR (5)        NULL,
    [Longitude]                                 VARCHAR (20)    NULL,
    [Latitude]                                  VARCHAR (20)    NULL,
    [SchoolOperationalStatusEffectiveDate]      DATETIME        NULL,
    [AdministrativeFundingControlCode]          NVARCHAR (50)   NULL,
    [AdministrativeFundingControlDescription]   NVARCHAR (200)  NULL,
    CONSTRAINT [PK_DimK12Schools] PRIMARY KEY CLUSTERED ([DimK12SchoolId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchools_StateANSICode]
    ON [RDS].[DimK12Schools]([StateAnsiCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierSea]
    ON [RDS].[DimK12Schools]([SchoolIdentifierSea] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_RecordStartDateTime]
    ON [RDS].[DimK12Schools]([RecordStartDateTime] ASC)
    INCLUDE([SchoolIdentifierSea], [RecordEndDateTime]);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchools_StateAbbreviationCode]
    ON [RDS].[DimK12Schools]([StateAbbreviationCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierSea_DimK12SchoolId_RecordStartDateTime_RecordEndDateTime]
    ON [RDS].[DimK12Schools]([SchoolIdentifierSea] ASC, [DimK12SchoolId] ASC, [RecordStartDateTime] ASC, [RecordEndDateTime] ASC)
    INCLUDE([SchoolOperationalStatus]);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Schools_SchoolIdentifierSea_RecordStartDateTime]
    ON [RDS].[DimK12Schools]([SchoolIdentifierSea] ASC, [RecordStartDateTime] ASC)
    INCLUDE([RecordEndDateTime]);


GO

