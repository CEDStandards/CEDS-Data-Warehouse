CREATE TABLE [Staging].[K12PersonRace] (
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
    [RaceType]                                            VARCHAR (100)  NULL,
    [EnrollmentEntryDate]                                 DATE           NULL,
    [EnrollmentExitDate]                                  DATE           NULL,
    [SchoolYear]                                          SMALLINT       NULL,
    [RecordStartDateTime]                                 DATETIME       NULL,
    [RecordEndDateTime]                                   DATETIME       NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionId]                                    INT            NULL,
    [PersonId]                                            INT            NULL,
    [PersonDemographicRaceId]                             INT            NULL,
    [OrganizationID_LEA]                                  INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [RefRaceId]                                           INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_K12PersonRace] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12PersonRace_StudentIdentifierState_SchoolYear]
    ON [Staging].[K12PersonRace]([StudentIdentifierState] ASC, [SchoolYear] ASC);


GO

