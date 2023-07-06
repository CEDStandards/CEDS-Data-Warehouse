CREATE TABLE [Staging].[K12ProgramParticipation] (
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
    [ProgramType]                                         NVARCHAR (100) NULL,
    [EntryDate]                                           DATETIME       NULL,
    [ExitDate]                                            DATETIME       NULL,
    [SchoolYear]                                          SMALLINT       NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionId]                                    INT            NULL,
    [OrganizationId_LEA]                                  INT            NULL,
    [OrganizationId_School]                               INT            NULL,
    [PersonId]                                            INT            NULL,
    [ProgramOrganizationId_LEA]                           INT            NULL,
    [ProgramOrganizationId_School]                        INT            NULL,
    [OrganizationPersonRoleId_LEA]                        INT            NULL,
    [OrganizationPersonRoleId_School]                     INT            NULL,
    CONSTRAINT [PK_K12ProgramParticipation] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_EntryDate_PersonId_ProgramOrganizationId_LEA_DataCollectionId]
    ON [Staging].[K12ProgramParticipation]([EntryDate] ASC, [PersonId] ASC, [ProgramOrganizationId_LEA] ASC, [DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_ProgramType]
    ON [Staging].[K12ProgramParticipation]([ProgramType] ASC)
    INCLUDE([SchoolYear], [OrganizationId_LEA], [OrganizationId_School], [DataCollectionId]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_DataCollectionName_SchoolYear_WithIncludes]
    ON [Staging].[K12ProgramParticipation]([DataCollectionName] ASC, [SchoolYear] ASC)
    INCLUDE([EntryDate], [ExitDate], [LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [ProgramType], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_EntryDate_PersonId_ProgramOrganizationId_School_DataCollectionId]
    ON [Staging].[K12ProgramParticipation]([EntryDate] ASC, [PersonId] ASC, [ProgramOrganizationId_School] ASC, [DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_StudentIdentifierState]
    ON [Staging].[K12ProgramParticipation]([StudentIdentifierState] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_OrganizationType_ProgramType]
    ON [Staging].[K12ProgramParticipation]([SchoolIdentifierSea] ASC, [ProgramType] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolYear]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_K12ProgramParticipation_DataCollectionName]
    ON [Staging].[K12ProgramParticipation]([DataCollectionName] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

