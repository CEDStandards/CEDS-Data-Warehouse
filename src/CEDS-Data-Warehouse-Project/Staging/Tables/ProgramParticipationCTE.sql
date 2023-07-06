CREATE TABLE [Staging].[ProgramParticipationCTE] (
    [ID]                                                  INT            IDENTITY (1, 1) NOT NULL,
    [RecordId]                                            VARCHAR (100)  NULL,
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
    [DiplomaCredentialType]                               VARCHAR (100)  NULL,
    [DiplomaCredentialType_2]                             VARCHAR (100)  NULL,
    [DiplomaCredentialAwardDate]                          DATE           NULL,
    [CteParticipant]                                      BIT            NULL,
    [CteConcentrator]                                     BIT            NULL,
    [CteCompleter]                                        BIT            NULL,
    [SingleParentIndicator]                               BIT            NULL,
    [SingleParent_StatusStartDate]                        DATE           NULL,
    [SingleParent_StatusEndDate]                          DATE           NULL,
    [DisplacedHomeMakerIndicator]                         BIT            NULL,
    [DisplacedHomeMaker_StatusStartDate]                  DATE           NULL,
    [DisplacedHomeMaker_StatusEndDate]                    DATE           NULL,
    [AdvancedTrainingEnrollmentDate]                      DATE           NULL,
    [PlacementType]                                       VARCHAR (100)  NULL,
    [TechnicalSkillsAssessmentType]                       VARCHAR (100)  NULL,
    [NonTraditionalGenderStatus]                          BIT            NULL,
    [CTENontraditionalCompletion]                         BIT            NULL,
    [CteExitReason]                                       VARCHAR (100)  NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionID]                                    INT            NULL,
    [PersonID]                                            INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [OrganizationPersonRoleID_School]                     INT            NULL,
    [OrganizationPersonRoleID_CTEProgram]                 INT            NULL,
    [OrganizationID_CTEProgram]                           INT            NULL,
    [PersonProgramParticipationId]                        INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_ProgramParticipationCTE] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_ProgramParticipationCTE_RecordId]
    ON [Staging].[ProgramParticipationCTE]([RecordId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_ProgramParticipationCTE_DataCollectionName]
    ON [Staging].[ProgramParticipationCTE]([DataCollectionName] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolIdentifierSea], [StudentIdentifierState]);


GO

