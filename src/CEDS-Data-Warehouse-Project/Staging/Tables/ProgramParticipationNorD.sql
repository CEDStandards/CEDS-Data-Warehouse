CREATE TABLE [Staging].[ProgramParticipationNorD] (
    [ID]                                                  INT            IDENTITY (1, 1) NOT NULL,
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
    [ProgramParticipationBeginDate]                       DATE           NULL,
    [ProgramParticipationEndDate]                         DATE           NULL,
    [NeglectedOrDelinquentProgramType]                    NVARCHAR (100) NULL,
    [ProgressLevel_Reading]                               NVARCHAR (100) NULL,
    [ProgressLevel_Math]                                  NVARCHAR (100) NULL,
    [NeglectedOrDelinquentAcademicOutcomeIndicator]       NVARCHAR (100) NULL,
    [DiplomaCredentialAwardDate]                          DATE           NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionID]                                    INT            NULL,
    [PersonID]                                            INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [OrganizationID_LEA]                                  INT            NULL,
    [LEAOrganizationID_Program]                           INT            NULL,
    [SchoolOrganizationID_Program]                        INT            NULL,
    [LEAOrganizationPersonRoleId_Program]                 INT            NULL,
    [SchoolOrganizationPersonRoleId_Program]              INT            NULL,
    [PersonProgramParticipationID]                        INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_ProgramParticipationNorD] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_ProgramParticipationNOrD_DataCollectionName]
    ON [Staging].[ProgramParticipationNorD]([DataCollectionName] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

