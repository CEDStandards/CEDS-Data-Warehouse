CREATE TABLE [Staging].[ProgramParticipationTitleI] (
    [ID]                                                  INT            IDENTITY (1, 1) NOT NULL,
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
    [StudentIdentifierState]                              NVARCHAR (40)  NULL,
    [ProgramParticipationBeginDate]                       DATE           NULL,
    [ProgramParticipationEndDate]                         DATE           NULL,
    [TitleIIndicator]                                     NVARCHAR (100) NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionID]                                    INT            NULL,
    [PersonID]                                            INT            NULL,
    [OrganizationID_LEA]                                  INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [LEAOrganizationPersonRoleID_TitleIProgram]           INT            NULL,
    [LEAOrganizationID_TitleIProgram]                     INT            NULL,
    [LEAPersonProgramParticipationId]                     INT            NULL,
    [SchoolOrganizationID_TitleIProgram]                  INT            NULL,
    [SchoolOrganizationPersonRoleID_TitleIProgram]        INT            NULL,
    [SchoolPersonProgramParticipationId]                  INT            NULL,
    [RefTitleIIndicatorId]                                INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_ProgramParticipationTitleI] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_LEAProgramParticipationTitleI_PersonTitleI]
    ON [Staging].[ProgramParticipationTitleI]([LEAOrganizationPersonRoleID_TitleIProgram] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_SchoolProgramParticipationTitleI_PersonSchool]
    ON [Staging].[ProgramParticipationTitleI]([PersonID] ASC, [SchoolOrganizationID_TitleIProgram] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_SchoolProgramParticipationTitleI_PersonTitleI]
    ON [Staging].[ProgramParticipationTitleI]([SchoolOrganizationPersonRoleID_TitleIProgram] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_LEAProgramParticipationTitleI_PersonSchool]
    ON [Staging].[ProgramParticipationTitleI]([PersonID] ASC, [LEAOrganizationID_TitleIProgram] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

