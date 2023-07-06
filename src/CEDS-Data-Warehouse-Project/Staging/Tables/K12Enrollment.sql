CREATE TABLE [Staging].[K12Enrollment] (
    [Id]                                                  INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]                              NVARCHAR (40)  NULL,
    [LeaIdentifierSeaAccountability]                      NVARCHAR (50)  NULL,
    [LeaIdentifierSeaAttendance]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaFunding]                             NVARCHAR (50)  NULL,
    [LeaIdentifierSeaGraduation]                          NVARCHAR (50)  NULL,
    [LeaIdentifierSeaIndividualizedEducationProgram]      NVARCHAR (50)  NULL,
    [LeaIdentifierSeaMembershipResident]                  NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                                 NVARCHAR (50)  NULL,
    [ResponsibleSchoolTypeAccountability]                 BIT            NULL,
    [ResponsibleSchoolTypeAttendance]                     BIT            NULL,
    [ResponsibleSchoolTypeFunding]                        BIT            NULL,
    [ResponsibleSchoolTypeGraduation]                     BIT            NULL,
    [ResponsibleSchoolTypeIndividualizedEducationProgram] BIT            NULL,
    [ResponsibleSchoolTypeTransportation]                 BIT            NULL,
    [ResponsibleSchoolTypeIepServiceProvider]             BIT            NULL,
    [EducationOrganizationNetworkIdentifierSea]           NVARCHAR (100) NULL,
    [FirstName]                                           NVARCHAR (100) NULL,
    [LastOrSurname]                                       NVARCHAR (100) NULL,
    [MiddleName]                                          NVARCHAR (100) NULL,
    [Birthdate]                                           DATE           NULL,
    [Sex]                                                 NVARCHAR (30)  NULL,
    [HispanicLatinoEthnicity]                             BIT            NULL,
    [EnrollmentEntryDate]                                 DATE           NULL,
    [EnrollmentExitDate]                                  DATE           NULL,
    [FullTimeEquivalency]                                 DECIMAL (5, 2) NULL,
    [EnrollmentStatus]                                    NVARCHAR (100) NULL,
    [ExitOrWithdrawalType]                                NVARCHAR (100) NULL,
    [EntryType]                                           NVARCHAR (100) NULL,
    [GradeLevel]                                          NVARCHAR (100) NULL,
    [CohortYear]                                          NCHAR (4)      NULL,
    [CohortGraduationYear]                                NCHAR (4)      NULL,
    [CohortDescription]                                   NCHAR (1024)   NULL,
    [ProjectedGraduationDate]                             NVARCHAR (8)   NULL,
    [HighSchoolDiplomaType]                               NVARCHAR (100) NULL,
    [LanguageNative]                                      NVARCHAR (100) NULL,
    [LanguadeHome]                                        NVARCHAR (100) NULL,
    [NumberOfSchoolDays]                                  DECIMAL (9, 2) NULL,
    [NumberOfDaysAbsent]                                  DECIMAL (9, 2) NULL,
    [AttendanceRate]                                      DECIMAL (5, 4) NULL,
    [PostSecondaryEnrollmentStatus]                       NVARCHAR (100) NULL,
    [DiplomaOrCredentialAwardDate]                        DATE           NULL,
    [FoodServiceEligibility]                              NVARCHAR (100) NULL,
    [SchoolYear]                                          SMALLINT       NULL,
    [RecordStartDateTime]                                 DATETIME       NULL,
    [RecordEndDateTime]                                   DATETIME       NULL,
    [DataCollectionName]                                  NVARCHAR (100) NULL,
    [DataCollectionId]                                    INT            NULL,
    [PersonId]                                            INT            NULL,
    [OrganizationID_LEA]                                  INT            NULL,
    [OrganizationPersonRoleId_LEA]                        INT            NULL,
    [OrganizationID_School]                               INT            NULL,
    [OrganizationPersonRoleId_School]                     INT            NULL,
    [OrganizationPersonRoleRelationshipId]                INT            NULL,
    [RunDateTime]                                         DATETIME       NULL,
    CONSTRAINT [PK_K12Enrollment] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12Enrollment_StuId_SchId_Hispanic_RecordStartDateTime]
    ON [Staging].[K12Enrollment]([StudentIdentifierState] ASC, [SchoolIdentifierSea] ASC, [HispanicLatinoEthnicity] ASC, [RecordStartDateTime] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_K12Enrollment_WithIdentifiers]
    ON [Staging].[K12Enrollment]([DataCollectionName] ASC, [StudentIdentifierState] ASC, [LeaIdentifierSeaAccountability] ASC, [LeaIdentifierSeaAttendance] ASC, [LeaIdentifierSeaFunding] ASC, [LeaIdentifierSeaGraduation] ASC, [LeaIdentifierSeaIndividualizedEducationProgram] ASC, [SchoolIdentifierSea] ASC, [EnrollmentEntryDate] ASC)
    INCLUDE([Birthdate], [EnrollmentExitDate], [FirstName], [FullTimeEquivalency], [LastOrSurname], [MiddleName], [ProjectedGraduationDate], [RecordStartDateTime], [SchoolYear], [Sex]);


GO

CREATE NONCLUSTERED INDEX [IX_K12Enrollment_DataCollectionName]
    ON [Staging].[K12Enrollment]([DataCollectionName] ASC)
    INCLUDE([StudentIdentifierState], [LeaIdentifierSeaAccountability], [LeaIdentifierSeaAttendance], [LeaIdentifierSeaFunding], [LeaIdentifierSeaGraduation], [LeaIdentifierSeaIndividualizedEducationProgram], [SchoolIdentifierSea], [EnrollmentEntryDate], [EnrollmentExitDate], [SchoolYear]);


GO

