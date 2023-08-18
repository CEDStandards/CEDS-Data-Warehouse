CREATE TABLE [Staging].[PersonStatus] (
    [Id]                                                     INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                                 NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                         NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                                NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]         NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                                    NVARCHAR (50)  NULL,
    [ResponsibleSchoolTypeAccountability]                    BIT            NULL,
    [ResponsibleSchoolTypeAttendance]                        BIT            NULL,
    [ResponsibleSchoolTypeFunding]                           BIT            NULL,
    [ResponsibleSchoolTypeGraduation]                        BIT            NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgram]    BIT            NULL,
    [ResponsibleSchoolTypeTransportation]                    BIT            NULL,
    [ResponsibleSchoolTypeIepServiceProvider]                BIT            NULL,
    [EnrollmentEntryDate]                                    DATE           NULL,
    [EnrollmentExitDate]                                     DATE           NULL,
    [HomelessnessStatus]                                     BIT            NULL,
    [Homelessness_StatusStartDate]                           DATE           NULL,
    [Homelessness_StatusEndDate]                             DATE           NULL,
    [HomelessNightTimeResidence]                             NVARCHAR (100) NULL,
    [HomelessNightTimeResidence_StartDate]                   DATE           NULL,
    [HomelessNightTimeResidence_EndDate]                     DATE           NULL,
    [HomelessUnaccompaniedYouth]                             BIT            NULL,
    [HomelessServicedIndicator]                              BIT            NULL,
    [EconomicDisadvantageStatus]                             BIT            NULL,
    [EconomicDisadvantage_StatusStartDate]                   DATE           NULL,
    [EconomicDisadvantage_StatusEndDate]                     DATE           NULL,
    [EligibilityStatusForSchoolFoodServicePrograms]          NVARCHAR (100) NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicator] BIT            NULL,
    [MigrantStatus]                                          BIT            NULL,
    [Migrant_StatusStartDate]                                DATE           NULL,
    [Migrant_StatusEndDate]                                  DATE           NULL,
    [MilitaryConnectedStudentIndicator]                      NVARCHAR (100) NULL,
    [MilitaryConnected_StatusStartDate]                      DATE           NULL,
    [MilitaryConnected_StatusEndDate]                        DATE           NULL,
    [MilitaryActiveStudentIndicator]                         NVARCHAR (100) NULL,
    [MilitaryBranch]                                         NVARCHAR (100) NULL,
    [MilitaryVeteranStudentIndicator]                        NVARCHAR (100) NULL,
    [ProgramType_FosterCare]                                 BIT            NULL,
    [FosterCare_ProgramParticipationStartDate]               DATE           NULL,
    [FosterCare_ProgramParticipationEndDate]                 DATE           NULL,
    [ProgramType_Section504]                                 BIT            NULL,
    [Section504_ProgramParticipationStartDate]               DATE           NULL,
    [Section504_ProgramParticipationEndDate]                 DATE           NULL,
    [ProgramType_Immigrant]                                  BIT            NULL,
    [Immigrant_ProgramParticipationStartDate]                DATE           NULL,
    [Immigrant_ProgramParticipationEndDate]                  DATE           NULL,
    [EnglishLearnerStatus]                                   BIT            NULL,
    [EnglishLearner_StatusStartDate]                         DATE           NULL,
    [EnglishLearner_StatusEndDate]                           DATE           NULL,
    [ISO_639_2_NativeLanguage]                               NVARCHAR (100) NULL,
    [ISO_639_2_HomeLanguage]                                 NVARCHAR (100) NULL,
    [PerkinsEnglishLearnerStatus]                            NVARCHAR (100) NULL,
    [PerkinsEnglishLearnerStatus_StatusStartDate]            DATE           NULL,
    [PerkinsEnglishLearnerStatus_StatusEndDate]              DATE           NULL,
    [RecordStartDatetime]                                    DATETIME       NULL,
    [RecordEndDateTime]                                      DATETIME       NULL,
    [DataCollectionName]                                     NVARCHAR (100) NULL,
    [DataCollectionId]                                       INT            NULL,
    CONSTRAINT [PK_PersonStatus] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);

GO

CREATE NONCLUSTERED INDEX [Staging_PersonStatus_WithIdentifiers]
    ON [Staging].[PersonStatus]([DataCollectionName] ASC, [LeaIdentifierSeaAccountability] ASC, [LeaIdentifierSeaAttendance] ASC, [LeaIdentifierSeaFunding] ASC, [LeaIdentifierSeaGraduation] ASC, [LeaIdentifierSeaIndividualizedEducationProgram] ASC, [SchoolIdentifierSea] ASC, [StudentIdentifierState] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_Staging_PersonStatus_StudentIdentifierState_EnglishLearner_StatusStartDate]
    ON [Staging].[PersonStatus]([StudentIdentifierState] ASC, [EnglishLearner_StatusStartDate] ASC)
    INCLUDE([LeaIdentifierSeaAccountability], [SchoolIdentifierSea], [EnglishLearnerStatus], [EnglishLearner_StatusEndDate]);
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day when a status applied to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001228' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22193' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day that a status became applicable to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001227' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22192' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantage_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21086' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServicePrograms';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of a student''s level of eligibility to participate in the National School Lunch Program for breakfast, lunch, snack, supper, and milk programs.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServicePrograms';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Eligibility Status for School Food Service Programs' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServicePrograms';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000092' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServicePrograms';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21092' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EligibilityStatusForSchoolFoodServicePrograms';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day when a status applied to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001228' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22193' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day that a status became applicable to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001227' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22192' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearner_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:  (A) who is aged 3 through 21;  (B) who is enrolled or preparing to enroll in an elementary school or a secondary school;  (C)   (i) who was not born in the United States or whose native languages are languages other than English;  (ii)   (I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and  (II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or  (iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and  (D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual   (i) the ability to meet the challenging State academic standards;  (ii) the ability to successfully achieve in classrooms where the language of instruction is English; or  (iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21180' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month, day, and year on which a person enters and begins to receive instructional services in a school, institution, program, or class-section during a given session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Entry Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000097' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21097' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentEntryDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the student officially withdrew or graduated, i.e. the date on which the student''s enrollment ended.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Enrollment Exit Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000107' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21107' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'EnrollmentExitDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'FosterCare_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the person began to participate in a program.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'FosterCare_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Participation Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'FosterCare_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000590' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'FosterCare_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21583' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'FosterCare_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day when a status applied to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001228' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22193' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day that a status became applicable to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001227' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22192' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Homelessness_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21149' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether homeless children and youth were served by a McKinney-Vento program  in the state.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homeless Serviced Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000147' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21147' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'HomelessServicedIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Immigrant_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the person began to participate in a program.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Immigrant_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Participation Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Immigrant_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000590' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Immigrant_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21583' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Immigrant_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day when a status applied to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001228' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22193' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day that a status became applicable to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001227' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22192' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Migrant_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is currently serving on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Active Student Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001577' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22556' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryActiveStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A branch of the U.S. Military applicable for specifying more details when using Military Connected Student Indicator, Military Active Student Indicator,  Military Veteran Student Indicator, and Military Enlistment After Exit elements.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Branch' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001640' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22621' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day when a status applied to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001228' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22193' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day that a status became applicable to an individual.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Status Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001227' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22192' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnected_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22555' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is a veteran who served on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Veteran Student Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001578' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22557' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the student''s National School Lunch Program (NSLP) eligibility has been determined through direct certification.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'National School Lunch Program Direct Certification Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001654' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22635' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'NationalSchoolLunchProgramDirectCertificationIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21574' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus_StatusStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_FosterCare';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_FosterCare';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_FosterCare';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_FosterCare';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_FosterCare';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Immigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Immigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Immigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Immigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Immigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Section504';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Section504';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Section504';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Section504';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ProgramType_Section504';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordStartDatetime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordStartDatetime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordStartDatetime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordStartDatetime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'RecordStartDatetime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAccountability';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeAttendance';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeFunding';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeGraduation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIepServiceProvider';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeIndividualizedEducationProgram';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeTransportation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Section504_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the person began to participate in a program.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Section504_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Participation Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Section504_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000590' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Section504_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21583' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'Section504_ProgramParticipationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PersonStatus', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO