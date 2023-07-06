CREATE TABLE [Staging].[IdeaDisabilityType] (
    [Id]                                                  INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                              NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                      NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]      NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                                 NVARCHAR (50)  NULL,
    [ResponsibleSchoolTypeAccountability]                 BIT            NULL,
    [ResponsibleSchoolTypeAttendance]                     BIT            NULL,
    [ResponsibleSchoolTypeFunding]                        BIT            NULL,
    [ResponsibleSchoolTypeGraduation]                     BIT            NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgram] BIT            NULL,
    [ResponsibleSchoolTypeTransportation]                 BIT            NULL,
    [ResponsibleSchoolTypeIepServiceProvider]             BIT            NULL,
    [IdeaDisabilityTypeCode]                              NVARCHAR (100) NOT NULL,
    [IsPrimaryDisability]                                 BIT            NULL,
    [IsSecondaryDisability]                               BIT            NULL,
    [SchoolYear]                                          SMALLINT       NULL,
    [RecordStartDateTime]                                 DATETIME       NOT NULL,
    [RecordEndDateTime]                                   DATETIME       NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    CONSTRAINT [PK_IdeaDisabilityType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

