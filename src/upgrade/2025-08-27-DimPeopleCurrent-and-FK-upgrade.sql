-- Upgrade script: Add DimPeople_Current and parallel FKs/indexes for current-state joins
-- Date: 2025-08-27

-- 1. Create DimPeople_Current (if not exists)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DimPeople_Current' AND schema_id = SCHEMA_ID('RDS'))
BEGIN
    CREATE TABLE [RDS].[DimPeople_Current] (
        [DimPersonId] BIGINT IDENTITY (1, 1) NOT NULL,
        [FirstName] NVARCHAR(75) NULL,
        [MiddleName] NVARCHAR(75) NULL,
        [LastOrSurname] NVARCHAR(75) NULL,
        [Birthdate] DATE NULL,
        [ELChildChildIdentifierState] NVARCHAR(40) NULL,
        [K12StudentStudentIdentifierState] NVARCHAR(40) NULL,
        [K12StudentStudentIdentifierDistrict] NVARCHAR(40) NULL,
        [K12StudentStudentIdentifierNationalMigrant] NVARCHAR(40) NULL,
        [PsStudentStudentIdentifierState] NVARCHAR(40) NULL,
        [AeStudentStudentIdentifierState] NVARCHAR(40) NULL,
        [WorkforceProgramParticipantPersonIdentifierState] NVARCHAR(40) NULL,
        [ELStaffStaffMemberIdentifierState] NVARCHAR(40) NULL,
        [K12StaffStaffMemberIdentifierState] NVARCHAR(40) NULL,
        [K12StaffStaffMemberIdentifierDistrict] NVARCHAR(40) NULL,
        [PsStaffStaffMemberIdentifierState] NVARCHAR(40) NULL,
        [PersonIdentifierDriversLicense] NVARCHAR(40) NULL,
        [PersonIdentifierSSN] NVARCHAR(40) NULL,
        [PersonIdentifierState] NVARCHAR(40) NULL,
        [StudentIdentifierState] NVARCHAR(40) NULL,
        [IsActiveELChild] BIT NULL,
        [IsActiveK12Student] BIT NULL,
        [IsActivePsStudent] BIT NULL,
        [IsActiveAeStudent] BIT NULL,
        [IsActiveWorkforceProgramParticipant] BIT NULL,
        [IsActiveELStaff] BIT NULL,
        [IsActiveK12Staff] BIT NULL,
        [IsActivePsStaff] BIT NULL,
        [ElectronicMailAddressHome] NVARCHAR(252) NULL,
        [ElectronicMailAddressOrganizational] NVARCHAR(252) NULL,
        [ElectronicMailAddressWork] NVARCHAR(252) NULL,
        [TelephoneNumberFax] NVARCHAR(48) NULL,
        [TelephoneNumberHome] NVARCHAR(48) NULL,
        [TelephoneNumberMobile] NVARCHAR(48) NULL,
        [TelephoneNumberWork] NVARCHAR(48) NULL,
        [PersonalTitleOrPrefix] NVARCHAR(200) NULL,
        [PositionTitle] NVARCHAR(200) NULL,
        [GenerationCodeOrSuffix] NVARCHAR(75) NULL,
        [HighestLevelOfEducationCompletedCode] NVARCHAR(50) NULL,
        [HighestLevelOfEducationCompletedDescription] NVARCHAR(200) NULL,
        CONSTRAINT [PK_DimPeople_Current] PRIMARY KEY CLUSTERED ([DimPersonId] ASC)
    );
END
GO

-- 2. Create DimPeople_Current indexes (if not exists)
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_DimPeople_Current_IsActiveK12Student' AND object_id = OBJECT_ID('RDS.DimPeople_Current'))
    CREATE NONCLUSTERED INDEX [IX_DimPeople_Current_IsActiveK12Student] ON [RDS].[DimPeople_Current]([IsActiveK12Student] ASC) INCLUDE([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_DimPeople_Current_IsActiveK12Student_IsActivePsStudent_WithIncludes' AND object_id = OBJECT_ID('RDS.DimPeople_Current'))
    CREATE NONCLUSTERED INDEX [IX_DimPeople_Current_IsActiveK12Student_IsActivePsStudent_WithIncludes] ON [RDS].[DimPeople_Current]([IsActiveK12Student] ASC, [IsActivePsStudent] ASC) INCLUDE([Birthdate], [K12StudentStudentIdentifierState]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_DimPeople_Current_K12Students' AND object_id = OBJECT_ID('RDS.DimPeople_Current'))
    CREATE NONCLUSTERED INDEX [IX_DimPeople_Current_K12Students] ON [RDS].[DimPeople_Current]([K12StudentStudentIdentifierState] ASC, [FirstName] ASC, [MiddleName] ASC, [LastOrSurname] ASC, [Birthdate] ASC);
GO

-- 3. For each fact/bridge table, add _CurrentId column, FK, and index if missing
-- Example for FactK12StaffAssignments (repeat for all affected tables)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffAssignments'))
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssignments_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffAssignments] ADD CONSTRAINT [FK_FactK12StaffAssignments_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffAssignments_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffAssignments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssignments_K12Staff_CurrentId] ON [RDS].[FactK12StaffAssignments]([K12Staff_CurrentId] ASC);
GO

-- Repeat similar blocks for:
-- FactK12StaffCompensations, FactK12StaffAssessments, BridgeK12StudentCourseSectionK12Staff, FactPsStudentCourseTranscripts, FactPsStudentAcademicRecords, FactPsStudentEnrollments, FactQuarterlyEmployments, FactK12StudentCounts, FactSpecialEducation, FactK12StudentEnrollments, FactK12StudentDailyAttendances, FactK12StudentDisciplines, FactAeStudentEnrollments, FactK12ProgramParticipations, FactK12StudentAssessments, FactK12StudentCourseSections, FactK12StudentAcademicAwards, FactK12StudentAcademicRecords, FactK12StudentEconomicDisadvantages, FactK12GraduationCohorts, FactK12AccessibleEducationMaterialAssignments, FactK12StaffProfessionalDevelopmentSessions, FactK12StaffEvaluationParts, FactK12StaffEmployments, FactK12StaffCourseSections, FactK12StaffCounts, FactK12ParentOrGuardians, FactK12OrganizationContacts, FactCredentialAwards, BridgeK12IncidentIncidentWitnesses, BridgeK12IncidentIncidentVictims, BridgeK12IncidentIncidentReporters, BridgeK12IncidentIncidentPerpetrators
-- Each with the appropriate column, FK, and index names

-- Example for FactPsStudentAcademicRecords
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentAcademicRecords'))
    ALTER TABLE [RDS].[FactPsStudentAcademicRecords] ADD [PsStudent_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactPsStudentAcademicRecords_PsStudent_CurrentId')
    ALTER TABLE [RDS].[FactPsStudentAcademicRecords] ADD CONSTRAINT [FK_FactPsStudentAcademicRecords_PsStudent_CurrentId] FOREIGN KEY ([PsStudent_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactPsStudentAcademicRecords_PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentAcademicRecords'))
    CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicRecords_PsStudent_CurrentId] ON [RDS].[FactPsStudentAcademicRecords]([PsStudent_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentCourseSections (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentCourseSections'))
    ALTER TABLE [RDS].[FactK12StudentCourseSections] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentCourseSections_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentCourseSections] ADD CONSTRAINT [FK_FactK12StudentCourseSections_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentCourseSections_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentCourseSections'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCourseSections_K12Student_CurrentId] ON [RDS].[FactK12StudentCourseSections]([K12Student_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentAcademicAwards (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAcademicAwards'))
    ALTER TABLE [RDS].[FactK12StudentAcademicAwards] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentAcademicAwards_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentAcademicAwards] ADD CONSTRAINT [FK_FactK12StudentAcademicAwards_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentAcademicAwards_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAcademicAwards'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicAwards_K12Student_CurrentId] ON [RDS].[FactK12StudentAcademicAwards]([K12Student_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentAcademicRecords (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAcademicRecords'))
    ALTER TABLE [RDS].[FactK12StudentAcademicRecords] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentAcademicRecords_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentAcademicRecords] ADD CONSTRAINT [FK_FactK12StudentAcademicRecords_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentAcademicRecords_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAcademicRecords'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAcademicRecords_K12Student_CurrentId] ON [RDS].[FactK12StudentAcademicRecords]([K12Student_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentEconomicDisadvantages (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentEconomicDisadvantages'))
    ALTER TABLE [RDS].[FactK12StudentEconomicDisadvantages] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentEconomicDisadvantages_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentEconomicDisadvantages] ADD CONSTRAINT [FK_FactK12StudentEconomicDisadvantages_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentEconomicDisadvantages_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentEconomicDisadvantages'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEconomicDisadvantages_K12Student_CurrentId] ON [RDS].[FactK12StudentEconomicDisadvantages]([K12Student_CurrentId] ASC);
GO

-- FactK12GraduationCohorts (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12GraduationCohorts'))
    ALTER TABLE [RDS].[FactK12GraduationCohorts] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12GraduationCohorts_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12GraduationCohorts] ADD CONSTRAINT [FK_FactK12GraduationCohorts_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12GraduationCohorts_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12GraduationCohorts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12GraduationCohorts_K12Student_CurrentId] ON [RDS].[FactK12GraduationCohorts]([K12Student_CurrentId] ASC);
GO

-- FactK12AccessibleEducationMaterialAssignments (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12AccessibleEducationMaterialAssignments'))
    ALTER TABLE [RDS].[FactK12AccessibleEducationMaterialAssignments] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12AccessibleEducationMaterialAssignments_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12AccessibleEducationMaterialAssignments] ADD CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12AccessibleEducationMaterialAssignments_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12AccessibleEducationMaterialAssignments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12AccessibleEducationMaterialAssignments_K12Student_CurrentId] ON [RDS].[FactK12AccessibleEducationMaterialAssignments]([K12Student_CurrentId] ASC);
GO

-- FactK12StaffProfessionalDevelopmentSessions (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions'))
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffProfessionalDevelopmentSessions_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffProfessionalDevelopmentSessions] ADD CONSTRAINT [FK_FactK12StaffProfessionalDevelopmentSessions_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffProfessionalDevelopmentSessions_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffProfessionalDevelopmentSessions'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffProfessionalDevelopmentSessions_K12Staff_CurrentId] ON [RDS].[FactK12StaffProfessionalDevelopmentSessions]([K12Staff_CurrentId] ASC);
GO

-- FactK12StaffEvaluationParts (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffEvaluationParts'))
    ALTER TABLE [RDS].[FactK12StaffEvaluationParts] ADD [K12Staff_CurrentId] BIGINT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffEvaluationParts_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffEvaluationParts] ADD CONSTRAINT [FK_FactK12StaffEvaluationParts_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffEvaluationParts_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffEvaluationParts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEvaluationParts_K12Staff_CurrentId] ON [RDS].[FactK12StaffEvaluationParts]([K12Staff_CurrentId] ASC);
GO

-- FactK12StaffEmployments (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffEmployments'))
    ALTER TABLE [RDS].[FactK12StaffEmployments] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffEmployments_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffEmployments] ADD CONSTRAINT [FK_FactK12StaffEmployments_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffEmployments_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffEmployments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffEmployments_K12Staff_CurrentId] ON [RDS].[FactK12StaffEmployments]([K12Staff_CurrentId] ASC);
GO

-- FactK12StaffCourseSections (K12StaffMember_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12StaffMember_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCourseSections'))
    ALTER TABLE [RDS].[FactK12StaffCourseSections] ADD [K12StaffMember_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffCourseSections_K12StaffMember_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffCourseSections] ADD CONSTRAINT [FK_FactK12StaffCourseSections_K12StaffMember_CurrentId] FOREIGN KEY ([K12StaffMember_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffCourseSections_K12StaffMember_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCourseSections'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCourseSections_K12StaffMember_CurrentId] ON [RDS].[FactK12StaffCourseSections]([K12StaffMember_CurrentId] ASC);
GO

-- FactK12ParentOrGuardians (K12Student_CurrentId, ParentOrGuardian_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12ParentOrGuardians'))
    ALTER TABLE [RDS].[FactK12ParentOrGuardians] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'ParentOrGuardian_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12ParentOrGuardians'))
    ALTER TABLE [RDS].[FactK12ParentOrGuardians] ADD [ParentOrGuardian_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12ParentOrGuardians_K12Students_Current')
    ALTER TABLE [RDS].[FactK12ParentOrGuardians] ADD CONSTRAINT [FK_FactK12ParentOrGuardians_K12Students_Current] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12ParentOrGuardians_ParentOrGuardians_Current')
    ALTER TABLE [RDS].[FactK12ParentOrGuardians] ADD CONSTRAINT [FK_FactK12ParentOrGuardians_ParentOrGuardians_Current] FOREIGN KEY ([ParentOrGuardian_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12ParentOrGuardians_K12Student_Current' AND object_id = OBJECT_ID('RDS.FactK12ParentOrGuardians'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_K12Student_Current] ON [RDS].[FactK12ParentOrGuardians]([K12Student_CurrentId] ASC);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12ParentOrGuardians_ParentOrGuardian_Current' AND object_id = OBJECT_ID('RDS.FactK12ParentOrGuardians'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_ParentOrGuardian_Current] ON [RDS].[FactK12ParentOrGuardians]([ParentOrGuardian_CurrentId] ASC);
GO

-- FactK12OrganizationContacts (Contact_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Contact_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12OrganizationContacts'))
    ALTER TABLE [RDS].[FactK12OrganizationContacts] ADD [Contact_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12OrganizationContacts_Contact_CurrentId')
    ALTER TABLE [RDS].[FactK12OrganizationContacts] ADD CONSTRAINT [FK_FactK12OrganizationContacts_Contact_CurrentId] FOREIGN KEY ([Contact_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12OrganizationContacts_Contact_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12OrganizationContacts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_Contact_CurrentId] ON [RDS].[FactK12OrganizationContacts]([Contact_CurrentId] ASC);
GO

-- FactCredentialAwards (CredentialAwardRecipientPerson_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'CredentialAwardRecipientPerson_CurrentId' AND object_id = OBJECT_ID('RDS.FactCredentialAwards'))
    ALTER TABLE [RDS].[FactCredentialAwards] ADD [CredentialAwardRecipientPerson_CurrentId] BIGINT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactCredentialAwards_CredentialAwardRecipient_CurrentId')
    ALTER TABLE [RDS].[FactCredentialAwards] ADD CONSTRAINT [FK_FactCredentialAwards_CredentialAwardRecipient_CurrentId] FOREIGN KEY ([CredentialAwardRecipientPerson_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactCredentialAwards_CredentialAwardRecipientPerson_CurrentId' AND object_id = OBJECT_ID('RDS.FactCredentialAwards'))
    CREATE NONCLUSTERED INDEX [IXFK_FactCredentialAwards_CredentialAwardRecipientPerson_CurrentId] ON [RDS].[FactCredentialAwards]([CredentialAwardRecipientPerson_CurrentId] ASC);
GO

-- FactQuarterlyEmployments (Person_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Person_CurrentId' AND object_id = OBJECT_ID('RDS.FactQuarterlyEmployments'))
    ALTER TABLE [RDS].[FactQuarterlyEmployments] ADD [Person_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactQuarterlyEmployments_Person_CurrentId')
    ALTER TABLE [RDS].[FactQuarterlyEmployments] ADD CONSTRAINT [FK_FactQuarterlyEmployments_Person_CurrentId] FOREIGN KEY ([Person_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_FactQuarterlyEmployments_Person_CurrentId' AND object_id = OBJECT_ID('RDS.FactQuarterlyEmployments'))
    CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_Person_CurrentId] ON [RDS].[FactQuarterlyEmployments]([Person_CurrentId] ASC);
GO

-- FactPsStudentCourseTranscripts (PsStudent_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentCourseTranscripts'))
    ALTER TABLE [RDS].[FactPsStudentCourseTranscripts] ADD [PsStudent_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactPsStudentCourseTranscripts_PsStudent_CurrentId')
    ALTER TABLE [RDS].[FactPsStudentCourseTranscripts] ADD CONSTRAINT [FK_FactPsStudentCourseTranscripts_PsStudent_CurrentId] FOREIGN KEY ([PsStudent_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactPsStudentCourseTranscripts_PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentCourseTranscripts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentCourseTranscripts_PsStudent_CurrentId] ON [RDS].[FactPsStudentCourseTranscripts]([PsStudent_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentCounts (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentCounts'))
    ALTER TABLE [RDS].[FactK12StudentCounts] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentCounts_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentCounts] ADD CONSTRAINT [FK_FactK12StudentCounts_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentCounts_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentCounts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentCounts_K12Student_CurrentId] ON [RDS].[FactK12StudentCounts]([K12Student_CurrentId] ASC) WITH (FILLFACTOR = 80);
GO

-- FactSpecialEducation (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactSpecialEducation'))
    ALTER TABLE [RDS].[FactSpecialEducation] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactSpecialEducation_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactSpecialEducation] ADD CONSTRAINT [FK_FactSpecialEducation_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactSpecialEducation_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactSpecialEducation'))
    CREATE NONCLUSTERED INDEX [IXFK_FactSpecialEducation_K12Student_CurrentId] ON [RDS].[FactSpecialEducation]([K12Student_CurrentId] ASC);
GO

-- FactK12StudentEnrollments (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentEnrollments'))
    ALTER TABLE [RDS].[FactK12StudentEnrollments] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentEnrollments_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentEnrollments] ADD CONSTRAINT [FK_FactK12StudentEnrollments_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentEnrollments_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentEnrollments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentEnrollments_K12Student_CurrentId] ON [RDS].[FactK12StudentEnrollments]([K12Student_CurrentId] ASC);
GO

-- FactK12StudentDailyAttendances (Person_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Person_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentDailyAttendances'))
    ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD [Person_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentDailyAttendances_Person_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD CONSTRAINT [FK_FactK12StudentDailyAttendances_Person_CurrentId] FOREIGN KEY ([Person_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentDailyAttendances_Person_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentDailyAttendances'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_Person_CurrentId] ON [RDS].[FactK12StudentDailyAttendances]([Person_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentDisciplines (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentDisciplines'))
    ALTER TABLE [RDS].[FactK12StudentDisciplines] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentDisciplines_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentDisciplines] ADD CONSTRAINT [FK_FactK12StudentDisciplines_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentDisciplines_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentDisciplines'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDisciplines_K12Student_CurrentId] ON [RDS].[FactK12StudentDisciplines]([K12Student_CurrentId] ASC) WITH (FILLFACTOR = 80);
GO

-- FactPsStudentEnrollments (PsStudent_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentEnrollments'))
    ALTER TABLE [RDS].[FactPsStudentEnrollments] ADD [PsStudent_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactPsStudentEnrollments_PsStudent_CurrentId')
    ALTER TABLE [RDS].[FactPsStudentEnrollments] ADD CONSTRAINT [FK_FactPsStudentEnrollments_PsStudent_CurrentId] FOREIGN KEY ([PsStudent_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactPsStudentEnrollments_PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentEnrollments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentEnrollments_PsStudent_CurrentId] ON [RDS].[FactPsStudentEnrollments]([PsStudent_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12ProgramParticipations (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12ProgramParticipations'))
    ALTER TABLE [RDS].[FactK12ProgramParticipations] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12ProgramParticipations_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12ProgramParticipations] ADD CONSTRAINT [FK_FactK12ProgramParticipations_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12ProgramParticipations_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12ProgramParticipations'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12ProgramParticipations_K12Student_CurrentId] ON [RDS].[FactK12ProgramParticipations]([K12Student_CurrentId] ASC);
GO

-- FactK12StudentAssessments (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAssessments'))
    ALTER TABLE [RDS].[FactK12StudentAssessments] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentAssessments_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentAssessments] ADD CONSTRAINT [FK_FactK12StudentAssessments_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentAssessments_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAssessments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAssessments_K12Student_CurrentId] ON [RDS].[FactK12StudentAssessments]([K12Student_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactPsStudentAcademicAwards (PsStudent_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentAcademicAwards'))
    ALTER TABLE [RDS].[FactPsStudentAcademicAwards] ADD [PsStudent_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactPsStudentAcademicAwards_PsStudent_CurrentId')
    ALTER TABLE [RDS].[FactPsStudentAcademicAwards] ADD CONSTRAINT [FK_FactPsStudentAcademicAwards_PsStudent_CurrentId] FOREIGN KEY ([PsStudent_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactPsStudentAcademicAwards_PsStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactPsStudentAcademicAwards'))
    CREATE NONCLUSTERED INDEX [IXFK_FactPsStudentAcademicAwards_PsStudent_CurrentId] ON [RDS].[FactPsStudentAcademicAwards]([PsStudent_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StudentAttendanceRates (K12Student_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAttendanceRates'))
    ALTER TABLE [RDS].[FactK12StudentAttendanceRates] ADD [K12Student_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StudentAttendanceRates_K12Student_CurrentId')
    ALTER TABLE [RDS].[FactK12StudentAttendanceRates] ADD CONSTRAINT [FK_FactK12StudentAttendanceRates_K12Student_CurrentId] FOREIGN KEY ([K12Student_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StudentAttendanceRates_K12Student_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StudentAttendanceRates'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_K12Student_CurrentId] ON [RDS].[FactK12StudentAttendanceRates]([K12Student_CurrentId] ASC);
GO

-- BridgeK12IncidentIncidentWitnesses (Person_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentWitnesses'))
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentWitnesses] ADD [Person_CurrentId] BIGINT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_BridgeK12IncidentIncidentWitnesses_Person_CurrentId')
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentWitnesses] ADD CONSTRAINT [FK_BridgeK12IncidentIncidentWitnesses_Person_CurrentId] FOREIGN KEY ([Person_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_BridgeK12IncidentIncidentWitnesses_Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentWitnesses'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentWitnesses_Person_CurrentId] ON [RDS].[BridgeK12IncidentIncidentWitnesses]([Person_CurrentId] ASC);
GO

-- BridgeK12IncidentIncidentVictims (Person_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentVictims'))
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentVictims] ADD [Person_CurrentId] BIGINT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_BridgeK12IncidentIncidentVictims_Person_CurrentId')
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentVictims] ADD CONSTRAINT [FK_BridgeK12IncidentIncidentVictims_Person_CurrentId] FOREIGN KEY ([Person_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_BridgeK12IncidentIncidentVictims_Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentVictims'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentVictims_Person_CurrentId] ON [RDS].[BridgeK12IncidentIncidentVictims]([Person_CurrentId] ASC);
GO

-- BridgeK12IncidentIncidentReporters (Person_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentReporters'))
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentReporters] ADD [Person_CurrentId] BIGINT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_BridgeK12IncidentIncidentReporters_Person_CurrentId')
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentReporters] ADD CONSTRAINT [FK_BridgeK12IncidentIncidentReporters_Person_CurrentId] FOREIGN KEY ([Person_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_BridgeK12IncidentIncidentReporters_Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentReporters'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentReporters_Person_CurrentId] ON [RDS].[BridgeK12IncidentIncidentReporters]([Person_CurrentId] ASC);
GO

-- BridgeK12IncidentIncidentPerpetrators (Person_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentPerpetrators'))
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentPerpetrators] ADD [Person_CurrentId] BIGINT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_BridgeK12IncidentIncidentPerpetrators_Person_CurrentId')
    ALTER TABLE [RDS].[BridgeK12IncidentIncidentPerpetrators] ADD CONSTRAINT [FK_BridgeK12IncidentIncidentPerpetrators_Person_CurrentId] FOREIGN KEY ([Person_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_BridgeK12IncidentIncidentPerpetrators_Person_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12IncidentIncidentPerpetrators'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentIncidentPerpetrators_Person_CurrentId] ON [RDS].[BridgeK12IncidentIncidentPerpetrators]([Person_CurrentId] ASC);
GO

-- FactK12StaffCompensations (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCompensations'))
    ALTER TABLE [RDS].[FactK12StaffCompensations] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffCompensations_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffCompensations] ADD CONSTRAINT [FK_FactK12StaffCompensations_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffCompensations_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCompensations'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCompensations_K12Staff_CurrentId] ON [RDS].[FactK12StaffCompensations]([K12Staff_CurrentId] ASC);
GO

-- FactK12StaffAssessments (K12StaffPerson_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12StaffPerson_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffAssessments'))
    ALTER TABLE [RDS].[FactK12StaffAssessments] ADD [K12StaffPerson_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffAssessments_K12StaffPerson_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffAssessments] ADD CONSTRAINT [FK_FactK12StaffAssessments_K12StaffPerson_CurrentId] FOREIGN KEY ([K12StaffPerson_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffAssessments_K12StaffPerson_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffAssessments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffAssessments_K12StaffPerson_CurrentId] ON [RDS].[FactK12StaffAssessments]([K12StaffPerson_CurrentId] ASC);
GO

-- BridgeK12StudentCourseSectionK12Staff (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12StudentCourseSectionK12Staff'))
    ALTER TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_BridgeK12StudentCourseSectionK12Staff_K12Staff_CurrentId')
    ALTER TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff] ADD CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_BridgeK12StudentCourseSectionK12Staff_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.BridgeK12StudentCourseSectionK12Staff'))
    CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionK12Staff_K12Staff_CurrentId] ON [RDS].[BridgeK12StudentCourseSectionK12Staff]([K12Staff_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactK12StaffCounts (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCounts'))
    ALTER TABLE [RDS].[FactK12StaffCounts] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactK12StaffCounts_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactK12StaffCounts] ADD CONSTRAINT [FK_FactK12StaffCounts_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactK12StaffCounts_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactK12StaffCounts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactK12StaffCounts_K12Staff_CurrentId] ON [RDS].[FactK12StaffCounts]([K12Staff_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- FactOrganizationCounts (K12Staff_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactOrganizationCounts'))
    ALTER TABLE [RDS].[FactOrganizationCounts] ADD [K12Staff_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactOrganizationCounts_K12Staff_CurrentId')
    ALTER TABLE [RDS].[FactOrganizationCounts] ADD CONSTRAINT [FK_FactOrganizationCounts_K12Staff_CurrentId] FOREIGN KEY ([K12Staff_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactOrganizationCounts_K12Staff_CurrentId' AND object_id = OBJECT_ID('RDS.FactOrganizationCounts'))
    CREATE NONCLUSTERED INDEX [IXFK_FactOrganizationCounts_K12Staff_CurrentId] ON [RDS].[FactOrganizationCounts]([K12Staff_CurrentId] ASC) WITH (FILLFACTOR = 80);
GO

-- FactAeStudentEnrollments (AeStudent_CurrentId)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'AeStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactAeStudentEnrollments'))
    ALTER TABLE [RDS].[FactAeStudentEnrollments] ADD [AeStudent_CurrentId] BIGINT NOT NULL DEFAULT -1;
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_FactAeStudentEnrollments_AeStudent_CurrentId')
    ALTER TABLE [RDS].[FactAeStudentEnrollments] ADD CONSTRAINT [FK_FactAeStudentEnrollments_AeStudent_CurrentId] FOREIGN KEY ([AeStudent_CurrentId]) REFERENCES [RDS].[DimPeople_Current]([DimPersonId]);
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IXFK_FactAeStudentEnrollments_AeStudent_CurrentId' AND object_id = OBJECT_ID('RDS.FactAeStudentEnrollments'))
    CREATE NONCLUSTERED INDEX [IXFK_FactAeStudentEnrollments_AeStudent_CurrentId] ON [RDS].[FactAeStudentEnrollments]([AeStudent_CurrentId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

-- End of upgrade script
