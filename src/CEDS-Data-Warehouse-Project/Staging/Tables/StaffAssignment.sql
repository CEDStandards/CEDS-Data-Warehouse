CREATE TABLE [Staging].[StaffAssignment] (
    [ID]                                     INT            IDENTITY (1, 1) NOT NULL,
    [StaffMemberIdentifierState]             NVARCHAR (40)  NULL,
    [LeaIdentifierSea]                       NVARCHAR (50)  NULL,
    [SchoolIdentifierSea]                    NVARCHAR (50)  NULL,
    [FirstName]                              VARCHAR (100)  NULL,
    [LastOrSurname]                          VARCHAR (100)  NULL,
    [MiddleName]                             VARCHAR (100)  NULL,
    [BirthDate]                              DATETIME2 (7)  NULL,
    [Sex]                                    VARCHAR (30)   NULL,
    [PositionTitle]                          NVARCHAR (50)  NULL,
    [FullTimeEquivalency]                    DECIMAL (5, 4) NULL,
    [SpecialEducationStaffCategory]          VARCHAR (100)  NULL,
    [K12StaffClassification]                 VARCHAR (100)  NULL,
    [TitleIProgramStaffCategory]             VARCHAR (100)  NULL,
    [TeachingCredentialType]                 VARCHAR (100)  NULL,
    [CredentialIssuanceDate]                 DATE           NULL,
    [CredentialExpirationDate]               DATE           NULL,
    [ParaprofessionalQualification]          VARCHAR (100)  NULL,
    [SpecialEducationAgeGroupTaught]         VARCHAR (100)  NULL,
    [HighlyQualifiedTeacherIndicator]        BIT            NULL,
    [AssignmentStartDate]                    DATE           NULL,
    [AssignmentEndDate]                      DATE           NULL,
    [EdFactsTeacherInexperiencedStatus]      VARCHAR (100)  NULL,
    [EmergencyorProvisionalCredentialStatus] VARCHAR (100)  NULL,
    [EDFactsTeacherOutOfFieldStatus]         VARCHAR (100)  NULL,
    [RecordStartDateTime]                    DATETIME       NULL,
    [RecordEndDateTime]                      DATETIME       NULL,
    [SchoolYear]                             SMALLINT       NULL,
    [DataCollectionName]                     VARCHAR (100)  NULL,
    [ProgramTypeCode]                        VARCHAR (100)  NULL,
    [RunDateTime]                            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'AssignmentStartDate';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefTitleIProgramStaffCategory', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'TitleIProgramStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'Sex';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'FirstName';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'ParaprofessionalQualification';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'AssignmentEndDate';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'PositionTitle';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'TitleIProgramStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'MiddleName';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationAgeGroupTaught', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationAgeGroupTaught';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefK12StaffClassification', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'K12StaffClassification';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'FullTimeEquivalency';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'CredentialExpirationDate';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationAgeGroupTaught';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'BirthDate';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'K12StaffClassification';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationStaffCategory', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'SpecialEducationStaffCategory';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefParaprofessionalQualification', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'StaffAssignment', @level2type = N'COLUMN', @level2name = N'ParaprofessionalQualification';


GO

