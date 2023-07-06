CREATE TABLE [Staging].[OrganizationPhone] (
    [Id]                              INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifier]          NVARCHAR (50)  NULL,
    [OrganizationType]                VARCHAR (100)  NULL,
    [InstitutionTelephoneNumberType]  VARCHAR (100)  NULL,
    [TelephoneNumber]                 VARCHAR (100)  NULL,
    [PrimaryTelephoneNumberIndicator] BIT            NULL,
    [SchoolYear]                      SMALLINT       NULL,
    [DataCollectionName]              NVARCHAR (100) NULL,
    [RecordStartDateTime]             DATETIME       NULL,
    [RecordEndDateTime]               DATETIME       NULL,
    [OrganizationId]                  VARCHAR (100)  NULL,
    [LEA_OrganizationTelephoneId]     INT            NULL,
    [School_OrganizationTelephoneId]  INT            NULL,
    [RunDateTime]                     DATETIME       NULL,
    CONSTRAINT [PK_OrganizationPhone] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100, STATISTICS_NORECOMPUTE = ON)
);


GO

