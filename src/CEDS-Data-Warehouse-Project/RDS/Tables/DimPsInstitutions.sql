CREATE TABLE [RDS].[DimPsInstitutions] (
    [DimPsInstitutionID]                        INT            IDENTITY (1, 1) NOT NULL,
    [NameOfInstitution]                         NVARCHAR (128) NOT NULL,
    [ShortNameOfInstitution]                    NVARCHAR (30)  NOT NULL,
    [IPEDSIdentifier]                           INT            NOT NULL,
    [OrganizationOperationalStatus]             NVARCHAR (20)  NOT NULL,
    [OperationalStatusEffectiveDate]            DATETIME       NOT NULL,
    [MostPrevalentLevelOfInstitutionCode]       NVARCHAR (20)  NULL,
    [MailingAddressStreetNumberAndName]         NVARCHAR (40)  NULL,
    [MailingAddressApartmentRoomOrSuiteNumber]  NVARCHAR (30)  NULL,
    [MailingAddressCity]                        NVARCHAR (30)  NULL,
    [MailingAddressPostalCode]                  NVARCHAR (17)  NULL,
    [MailingAddressStateAbbreviation]           NVARCHAR (50)  NULL,
    [PhysicalAddressStreetNumberAndName]        NVARCHAR (40)  NULL,
    [PhysicalAddressApartmentRoomOrSuiteNumber] NVARCHAR (30)  NULL,
    [PhysicalAddressCity]                       NVARCHAR (30)  NULL,
    [PhysicalAddressPostalCode]                 NVARCHAR (17)  NULL,
    [PhysicalAddressStateAbbreviation]          NVARCHAR (50)  NULL,
    [TelephoneNumber]                           NVARCHAR (24)  NULL,
    [WebsiteAddress]                            NVARCHAR (300) NULL,
    [Latitude]                                  NVARCHAR (20)  NULL,
    [Longitude]                                 NVARCHAR (20)  NULL,
    [RecordStartDateTime]                       DATETIME       NOT NULL,
    [RecordEndDateTime]                         DATETIME       NULL,
    [MailingAddressCountyAnsiCodeCode]          NCHAR (5)      NULL,
    [PhysicalAddressCountyAnsiCodeCode]         NCHAR (5)      NULL,
    CONSTRAINT [PK_DimPsInstitutions] PRIMARY KEY CLUSTERED ([DimPsInstitutionID] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitutions_InstitutionIpedsUnitId]
    ON [RDS].[DimPsInstitutions]([IPEDSIdentifier] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimPsInstitution_IpedsUnitId_RecordStartDateTime]
    ON [RDS].[DimPsInstitutions]([IPEDSIdentifier] ASC, [RecordStartDateTime] ASC)
    INCLUDE([RecordEndDateTime]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'An organization that provides educational programs for individuals who have completed OR otherwise LEFT educational programs IN secondary school(s).', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimPsInstitutions';


GO

