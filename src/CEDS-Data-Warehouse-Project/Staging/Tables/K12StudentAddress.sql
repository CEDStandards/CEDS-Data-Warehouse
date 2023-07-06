CREATE TABLE [Staging].[K12StudentAddress] (
    [Id]                                             INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                         NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                 NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                        NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                     NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram] NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                            NVARCHAR (50)  NULL,
    [AddressTypeForLearnerOrFamily]                  NVARCHAR (50)  NULL,
    [AddressStreetNumberAndName]                     NVARCHAR (150) NULL,
    [AddressApartmentRoomOrSuite]                    NVARCHAR (50)  NULL,
    [AddressCity]                                    NVARCHAR (30)  NULL,
    [CountyAnsiCode]                                 NVARCHAR (50)  NULL,
    [CountyAnsiDescription]                          NVARCHAR (150) NULL,
    [StateAbbreviation]                              NVARCHAR (2)   NULL,
    [AddressPostalCode]                              NVARCHAR (17)  NULL,
    [CountryCode]                                    NVARCHAR (50)  NULL,
    [CountryDescription]                             NVARCHAR (150) NULL,
    [Latitude]                                       NVARCHAR (100) NULL,
    [Longitude]                                      NVARCHAR (100) NULL,
    [SchoolYear]                                     SMALLINT       NULL,
    [DataCollectionName]                             NVARCHAR (100) NULL,
    [RecordStartDateTime]                            DATETIME       NULL,
    [RecordEndDateTime]                              DATETIME       NULL,
    [DataCollectionId]                               INT            NULL,
    [RefStateId]                                     INT            NULL,
    [OrganizationId]                                 NVARCHAR (100) NULL,
    [LocationId]                                     NVARCHAR (100) NULL,
    [RunDateTime]                                    DATETIME       NULL,
    CONSTRAINT [PK_K12StudentAddress] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100, STATISTICS_NORECOMPUTE = ON, DATA_COMPRESSION = PAGE)
);


GO

