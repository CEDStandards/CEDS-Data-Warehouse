CREATE TABLE [Staging].[Migrant] (
    [Id]                                                  INT            IDENTITY (1, 1) NOT NULL,
    [RecordId]                                            VARCHAR (100)  NULL,
    [SchoolYear]                                          SMALLINT       NULL,
    [LeaIdentifierSeaAccountability]                      NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]      NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                                 NVARCHAR (50)  NULL,
    [StudentIdentifierState]                              NVARCHAR (40)  NULL,
    [MigrantStatus]                                       VARCHAR (100)  NULL,
    [MigrantEducationProgramEnrollmentType]               VARCHAR (100)  NULL,
    [MigrantEducationProgramServicesType]                 VARCHAR (100)  NULL,
    [MigrantEducationProgramContinuationOfServicesStatus] BIT            NULL,
    [ContinuationOfServicesReason]                        VARCHAR (100)  NULL,
    [MigrantStudentQualifyingArrivalDate]                 DATE           NULL,
    [LastQualifyingMoveDate]                              DATE           NULL,
    [MigrantPrioritizedForServices]                       BIT            NULL,
    [ProgramParticipationStartDate]                       DATE           NULL,
    [ProgramParticipationExitDate]                        DATE           NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [PersonID]                                            INT            NULL,
    [OrganizationID_LEA]                                  INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [LEAOrganizationPersonRoleID_MigrantProgram]          INT            NULL,
    [LEAOrganizationID_MigrantProgram]                    INT            NULL,
    [SchoolOrganizationPersonRoleID_MigrantProgram]       INT            NULL,
    [SchoolOrganizationID_MigrantProgram]                 INT            NULL,
    [PersonProgramParticipationId]                        INT            NULL,
    [ProgramParticipationMigrantId]                       INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_Migrant] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_Migrant_DataCollectionName_SchoolYear]
    ON [Staging].[Migrant]([DataCollectionName] ASC, [SchoolYear] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

