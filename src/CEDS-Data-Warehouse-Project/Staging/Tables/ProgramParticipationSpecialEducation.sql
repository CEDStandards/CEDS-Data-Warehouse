CREATE TABLE [Staging].[ProgramParticipationSpecialEducation] (
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
    [IDEAIndicator]                                       BIT            NULL,
    [SpecialEducationExitReason]                          NVARCHAR (100) NULL,
    [IDEAEducationalEnvironmentForEarlyChildhood]         NVARCHAR (100) NULL,
    [IDEAEducationalEnvironmentForSchoolAge]              NVARCHAR (100) NULL,
    [SpecialEducationFTE]                                 DECIMAL (5, 2) NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionID]                                    INT            NULL,
    [PersonID]                                            INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [OrganizationID_LEA]                                  INT            NULL,
    [LEAOrganizationID_Program]                           INT            NULL,
    [SchoolOrganizationID_Program]                        INT            NULL,
    [LEAOrganizationPersonRoleId_Program]                 INT            NULL,
    [SchoolOrganizationPersonRoleId_Program]              INT            NULL,
    [PersonProgramParticipationID_LEA]                    INT            NULL,
    [PersonProgramParticipationID_School]                 INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_ProgramParticipationSpecialEducation] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_ProgramParticipationSpecialEducation_WithIdentifiers]
    ON [Staging].[ProgramParticipationSpecialEducation]([DataCollectionName] ASC, [StudentIdentifierState] ASC, [LeaIdentifierSeaAccountability] ASC, [LeaIdentifierSeaAttendance] ASC, [LeaIdentifierSeaFunding] ASC, [LeaIdentifierSeaGraduation] ASC, [LeaIdentifierSeaIndividualizedEducationProgram] ASC, [SchoolIdentifierSea] ASC)
    INCLUDE([ProgramParticipationBeginDate], [ProgramParticipationEndDate], [SpecialEducationFTE]);


GO

