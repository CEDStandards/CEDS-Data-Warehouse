CREATE TABLE [Staging].[AeEnrollment] (
    [Id]                                                        INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                                    NVARCHAR (40)  NULL,
    [AdultEducationServiceProviderIdentifierSea]                NVARCHAR (50)  NULL,
    [FirstName]                                                 NVARCHAR (100) NULL,
    [LastOrSurname]                                             NVARCHAR (100) NULL,
    [MiddleName]                                                NVARCHAR (100) NULL,
    [Birthdate]                                                 DATE           NULL,
    [Sex]                                                       NVARCHAR (30)  NULL,
    [HispanicLatinoEthnicity]                                   BIT            NULL,
    [ApplicationDate]                                           DATE           NULL,
    [EnrollmentEntryDate]                                       DATE           NULL,
    [EnrollmentExitDate]                                        DATE           NULL,
    [AdultEducationPostsecondaryTransitionDate]                 DATE           NULL,
    [HighSchoolDiplomaDiplomaOrCredentialAwardDate]             DATE           NULL,
    [HighSchoolDiplomaType]                                     NVARCHAR (50)   NULL,
    [ProjectedHighSchoolDiplomaType]                            NVARCHAR (50)  NULL,
    [EconomicDisadvantageStatus]               NVARCHAR (50)  NULL,
    [HomelessnessStatus]                       NVARCHAR (50)  NULL,
    [HomelessPrimaryNighttimeResidence]        NVARCHAR (50)  NULL,
    [HomelessUnaccompaniedYouthStatus]         NVARCHAR (50)  NULL,
    [EnglishLearnerStatus]                     NVARCHAR (50)  NULL,
    [PerkinsEnglishLearnerStatus]              NVARCHAR (50)  NULL,
    [MigrantStatus]                            NVARCHAR (50)  NULL,
    [MilitaryConnectedStudentIndicator]        NVARCHAR (50)  NULL,
    [ActiveMilitaryStatusIndicator]            NVARCHAR (50)  NULL,
    [MilitaryBranch]                           NVARCHAR (50)  NULL,
    [MilitaryVeteranStatusIndicator]           NVARCHAR (50)  NULL,
    [DisabilityStatus]                         NVARCHAR (50)  NULL,
    [DisabilityConditionType]                  NVARCHAR (50)  NULL,
    [DisabilityDeterminationSourceType]        NVARCHAR (50)  NULL,
    [AeInstructionalProgramType]                                NVARCHAR (50)  NULL,
    [AeSpecialProgramType]                                      NVARCHAR (50)  NULL,
    [WioaCareerServices]                                        NVARCHAR (50)  NULL,
    [WioaTrainingServices]                                      NVARCHAR (50)  NULL,
    [AePostsecondaryTransitionAction]                                           NVARCHAR (50)    NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicator]        NVARCHAR (50)    NULL,
    [AdultEducationCredentialAttainmentEmployedIndicator]                       NVARCHAR (50)    NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicator]        NVARCHAR (50)    NULL,
    [AdultEducationProgramExitReason]                           NVARCHAR (50)  NULL,
    [EmployedAfterExit]                                     NVARCHAR (50)  NULL, 
    [EmployedWhileEnrolled]                                 NVARCHAR (50)  NULL,
    [AeFunctioningLevelAtIntake]                            NVARCHAR (50)  NULL,
    [AeFunctioningLevelAtPosttest]                          NVARCHAR (50)  NULL,
    [CorrectionalEducationReentryServicesParticipationIndicator]        NVARCHAR (50) NULL,
    [QuarterlyEarningsAfterExitQ1]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ2]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ3]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ4]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ5]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ6]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ7]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ8]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ9]        DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ10]       DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ11]       DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ12]       DECIMAL (9, 2) NULL,
    [QuarterlyEarningsAfterExitQ13]       DECIMAL (9, 2) NULL,
    [InstructionalActivityHoursCompleted] DECIMAL (9, 2) NULL,
    [ProgramYear]                                                SMALLINT       NULL,
    [RecordStartDateTime]                                       DATETIME       NULL,
    [RecordEndDateTime]                                         DATETIME       NULL,
    [DataCollectionName]                                        NVARCHAR (100) NULL,
    [RunDateTime]                                               DATETIME       NULL,
    CONSTRAINT [PK_AeStudentEnrollments] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_AeEnrollment_StuId_PrvdrId_Hispanic_RecordStartDateTime]
    ON [Staging].[AeEnrollment]([StudentIdentifierState] ASC, [AdultEducationServiceProviderIdentifierSea] ASC, [HispanicLatinoEthnicity] ASC, [RecordStartDateTime] ASC);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEnrollment', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person was born.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEnrollment', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Birthdate' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEnrollment', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEnrollment', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AeEnrollment', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO