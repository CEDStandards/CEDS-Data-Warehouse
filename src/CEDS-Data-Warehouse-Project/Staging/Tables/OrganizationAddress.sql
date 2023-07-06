CREATE TABLE [Staging].[OrganizationAddress] (
    [Id]                                INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifier]            NVARCHAR (50)  NULL,
    [OrganizationType]                  VARCHAR (100)  NULL,
    [AddressTypeForOrganization]        VARCHAR (50)   NULL,
    [AddressStreetNumberAndName]        VARCHAR (150)  NULL,
    [AddressApartmentRoomOrSuiteNumber] VARCHAR (50)   NULL,
    [AddressCity]                       VARCHAR (30)   NULL,
    [AddressCountyAnsiCodeCode]         NVARCHAR (7)   NULL,
    [StateAbbreviation]                 VARCHAR (2)    NULL,
    [AddressPostalCode]                 VARCHAR (17)   NULL,
    [Latitude]                          NVARCHAR (100) NULL,
    [Longitude]                         NVARCHAR (100) NULL,
    [SchoolYear]                        SMALLINT       NULL,
    [DataCollectionName]                NVARCHAR (100) NULL,
    [RecordStartDateTime]               DATETIME       NULL,
    [RecordEndDateTime]                 DATETIME       NULL,
    [RefStateId]                        INT            NULL,
    [OrganizationId]                    VARCHAR (100)  NULL,
    [LocationId]                        VARCHAR (100)  NULL,
    [RunDateTime]                       DATETIME       NULL,
    CONSTRAINT [PK_OrganizationAddress] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100, STATISTICS_NORECOMPUTE = ON, DATA_COMPRESSION = PAGE)
);


GO

