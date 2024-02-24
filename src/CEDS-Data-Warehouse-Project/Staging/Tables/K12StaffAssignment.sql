CREATE TABLE [Staging].[K12StaffAssignment] (
    [ID]                                     INT            IDENTITY (1, 1) NOT NULL,
    [StaffMemberIdentifierState]             NVARCHAR (40)  NULL,
    [IeuOrganizationIdentifierSea]           NVARCHAR (50)  NULL,
    [LeaIdentifierSea]                       NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                    NVARCHAR (50)  NULL,
	[EmployerOrganizationIdentifierSea]      NVARCHAR (50)  NULL,
    [FirstName]                              NVARCHAR (100) NULL,
    [LastOrSurname]                          NVARCHAR (100) NULL,
    [MiddleName]                             NVARCHAR (100) NULL,
    [BirthDate]                              DATE           NULL,
    [Sex]                                    NVARCHAR (30)  NULL,
    [Race]                                   NVARCHAR (100) NULL,
    [PositionTitle]                          NVARCHAR (200) NULL,
	[PositionIdentifierSea]                  NVARCHAR (60)  NULL,
	[JobTitle]                               NVARCHAR (200) NULL,
	[SEA_EducationJobTypeCode]               NVARCHAR (40)  NULL,
	[SEA_LocalJobFunctionCode]               NVARCHAR (50)  NULL,
	[SEA_LocalJobCategoryCode]               NVARCHAR (50)  NULL,
	[LEA_EducationJobTypeCode]               NVARCHAR (40)  NULL,
	[LEA_LocalJobFunctionCode]               NVARCHAR (50)  NULL,
	[LEA_LocalJobCategoryCode]               NVARCHAR (50)  NULL,
    [FullTimeEquivalency]                    DECIMAL (5, 4) NULL,
    [SpecialEducationStaffCategory]          NVARCHAR (100) NULL,
    [K12StaffClassification]                 NVARCHAR (100) NULL,
    [TitleIProgramStaffCategory]             NVARCHAR (100) NULL,
    [MigrantEducationProgramStaffCategory]   NVARCHAR (50)  NULL,
    [ProfessionalEducationalJobClassification] NVARCHAR (50)  NULL,
    [TeachingCredentialType]                 NVARCHAR (100) NULL,
    [EdFactsCertificationStatus]             NVARCHAR (100) NULL,
    [CredentialIssuanceDate]                 DATE           NULL,
    [CredentialExpirationDate]               DATE           NULL,
    [ParaprofessionalQualificationStatus]    NVARCHAR (100) NULL,
    [SpecialEducationAgeGroupTaught]         NVARCHAR (100) NULL,
    [HighlyQualifiedTeacherIndicator]        BIT            NULL,
    [AssignmentStartDate]                    DATE           NULL,
    [AssignmentEndDate]                      DATE           NULL,
    [EmploymentStartDate]                    DATE           NULL,
    [EmploymentEndDate]                      DATE           NULL,
    [HireDate]                               DATE           NULL,
    [InstructionalLanguage]                  NVARCHAR (50)  NULL,
    [EdFactsTeacherInexperiencedStatus]      NVARCHAR (100)  NULL,
    [SpecialEducationTeacherQualificationStatus] NVARCHAR (100) NULL,
    [EDFactsTeacherOutOfFieldStatus]         NVARCHAR (100) NULL,
    [ProgramTypeCode]                        NVARCHAR (100) NULL,
    [SpecialEducationRelatedServicesPersonnel]   NVARCHAR (50)  NULL,                
    [TeachingCredentialBasis]                NVARCHAR (50)  NULL,
    [CTEInstructorIndustryCertification]     NVARCHAR (50)  NULL,            
    [SpecialEducationParaprofessional]       NVARCHAR (50)  NULL,        
    [SpecialEducationTeacher]                NVARCHAR (50)  NULL,
    [ScedCourseCode]                         NVARCHAR (5)   NULL,
	[OnetSocOccupationType]                  NVARCHAR (10)  NULL,
	[EmploymentStatusCode]                   NVARCHAR (50)  NULL,
	[EmploymentSeparationReasonCode]         NVARCHAR (50)  NULL,
	[TitleITargetedAssistanceStaffFundedCode] NVARCHAR (50) NULL,
	[MEPPersonnelIndicatorCode]              NVARCHAR (50)  NULL,
	[ItinerantTeacherCode]                   NVARCHAR (50)  NULL,
	[ItinerantTeacherDescription]            NVARCHAR (200) NULL,
	[ClassroomPositionTypeCode]              NVARCHAR (50)  NULL,
	[ClassroomPositionTypeDescription]       NVARCHAR (200) NULL,
	[PrimaryAssignmentIndicatorCode]         NVARCHAR (50)  NULL,
    [SchoolYear]                             SMALLINT       NULL,
    [DataCollectionName]                     NVARCHAR (100) NULL,
    [RecordStartDateTime]                    DATETIME       NULL,
    [RecordEndDateTime]                      DATETIME       NULL,
    [RunDateTime]                            DATETIME       NULL,
    CONSTRAINT [PK_K12StaffAssignment] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'AssignmentStartDate';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefTitleIProgramStaffCategory', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'TitleIProgramStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'Sex';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'FirstName';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'ParaprofessionalQualificationStatus';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'AssignmentEndDate';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'PositionTitle';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'TitleIProgramStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationAgeGroupTaught', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationAgeGroupTaught';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefK12StaffClassification', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'K12StaffClassification';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'FullTimeEquivalency';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'CredentialExpirationDate';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationAgeGroupTaught';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'BirthDate';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'K12StaffClassification';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationStaffCategory', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefParaprofessionalQualification', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12StaffAssignment', @level2type = N'COLUMN', @level2name = N'ParaprofessionalQualificationStatus';


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The last year, month and day on which the assignment is valid.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assignment End Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000527' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21518' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day from which the assignment is valid.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assignment Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000526' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21517' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'AssignmentStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person was born.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Birthdate' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which an active credential held by a person will expire.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Expiration Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialIssuanceDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which an active credential was issued to a person.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialIssuanceDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Issuance Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialIssuanceDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000070' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialIssuanceDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21070' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'CredentialIssuanceDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as inexperienced as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Inexperienced Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001961' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22929' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EdFactsTeacherInexperiencedStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EDFactsTeacherOutOfFieldStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether teachers have been identified as teaching a subject or field for which they are not certified or licensed as defined by the state.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EDFactsTeacherOutOfFieldStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'EDFacts Teacher Out of Field Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EDFactsTeacherOutOfFieldStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001962' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EDFactsTeacherOutOfFieldStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22930' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'EDFactsTeacherOutOfFieldStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21115' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time a person is enrolled, employed, involved, or participates in the organization, divided by the time the organization defines as full-time for that role.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001921' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22906' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the teacher has been classified as highly qualified based on assignment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Highly Qualified Teacher Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000142' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21142' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacherIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'K12StaffClassification';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The titles of employment, official status, or rank of education staff.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'K12StaffClassification';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'K12 Staff Classification' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'K12StaffClassification';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000087' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'K12StaffClassification';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21087' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'K12StaffClassification';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21172' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A full legal middle name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Middle Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000184' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21184' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name of a person''s position.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Position Title' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000213' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21213' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Race';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The origins of a person.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Race';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Race' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Race';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001943' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Race';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22955' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Race';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21255' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaught';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The age range of special education students taught.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaught';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Age Group Taught' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaught';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000564' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaught';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21556' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'SpecialEducationAgeGroupTaught';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'StaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a staff member by a school, school system, a state, registry, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'StaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Member Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'StaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001070' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'StaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21156' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'StaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TeachingCredentialType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of a legal document giving authorization to perform teaching assignment services.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TeachingCredentialType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Teaching Credential Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TeachingCredentialType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000278' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TeachingCredentialType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21278' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TeachingCredentialType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of employment, official status, or rank for staff working in a Title I program.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Staff Category' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000283' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategory';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21283' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'K12StaffAssignment', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategory';
GO