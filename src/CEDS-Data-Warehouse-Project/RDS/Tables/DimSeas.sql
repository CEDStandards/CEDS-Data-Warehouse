CREATE TABLE [RDS].[DimSeas] (
    [DimSeaId]                                  INT             IDENTITY (1, 1) NOT NULL,
    [SeaOrganizationName]                       NVARCHAR (1000) NULL,
    [SeaOrganizationIdentifierSea]              NVARCHAR (50)   NULL,
    [StateAnsiCode]                             NVARCHAR (10)   NULL,
    [StateAbbreviationCode]                     NVARCHAR (10)   NULL,
    [StateAbbreviationDescription]              NVARCHAR (1000) NULL,
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
    [RecordStartDateTime]                       DATETIME        NULL,
    [RecordEndDateTime]                         DATETIME        NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  VARCHAR (40)    NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] VARCHAR (40)    NULL,
    [MailingAddressCountyAnsiCodeCode]          CHAR (5)        NULL,
    [PhysicalAddressCountyAnsiCodeCode]         CHAR (5)        NULL,
    CONSTRAINT [PK_DimSeas] PRIMARY KEY CLUSTERED ([DimSeaId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSeas_RecordStartDateTime_RecordEndDateTime]
    ON [RDS].[DimSeas]([RecordStartDateTime] ASC, [RecordEndDateTime] ASC);


GO

