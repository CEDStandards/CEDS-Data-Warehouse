CREATE TABLE [Staging].[ProgramParticipationTitleIII] (
    [ID]                                                  INT            IDENTITY (1, 1) NOT NULL,
    [SchoolIdentifierSea]                                 NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAccountability]                      NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]      NVARCHAR (50)  NULL,
    [StudentIdentifierState]                              NVARCHAR (40)  NULL,
    [ResponsibleSchoolTypeAccountability]                 BIT            NULL,
    [ResponsibleSchoolTypeAttendance]                     BIT            NULL,
    [ResponsibleSchoolTypeFunding]                        BIT            NULL,
    [ResponsibleSchoolTypeGraduation]                     BIT            NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgram] BIT            NULL,
    [ResponsibleSchoolTypeTransportation]                 BIT            NULL,
    [ResponsibleSchoolTypeIepServiceProvider]             BIT            NULL,
    [ProgramParticipationBeginDate]                       DATE           NULL,
    [ProgramParticipationEndDate]                         DATE           NULL,
    [TitleIIIImmigrantParticipationStatus]                BIT            NULL,
    [Proficiency_TitleIII]                                VARCHAR (100)  NULL,
    [TitleIIIAccountabilityProgressStatus]                VARCHAR (100)  NULL,
    [EnglishLearnerParticipation]                         BIT            NULL,
    [TitleIIIImmigrantStatus]                             BIT            NULL,
    [TitleIIILanguageInstructionProgramType]              VARCHAR (100)  NULL,
    [TitleIIIImmigrantStatus_StartDate]                   DATE           NULL,
    [TitleIIIImmigrantStatus_EndDate]                     DATE           NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionID]                                    INT            NULL,
    [PersonID]                                            INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [OrganizationPersonRoleID_TitleIIIProgram]            INT            NULL,
    [OrganizationID_TitleIIIProgram]                      INT            NULL,
    [PersonProgramParticipationId]                        INT            NULL,
    [ImmigrationPersonStatusId]                           INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_ProgramParticipationTitleIII] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_ProgramParticipationTitleIII_DataCollectionName_WithIdentifiers]
    ON [Staging].[ProgramParticipationTitleIII]([DataCollectionName] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

