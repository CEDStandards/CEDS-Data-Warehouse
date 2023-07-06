CREATE TABLE [RDS].[DimPeople] (
    [DimPersonId]                                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [FirstName]                                        NVARCHAR (50)  NULL,
    [MiddleName]                                       NVARCHAR (50)  NULL,
    [LastOrSurname]                                    NVARCHAR (50)  NULL,
    [BirthDate]                                        DATE           NULL,
    [EarlyLearningChildChildIdentifierState]           NVARCHAR (40)  NULL,
    [K12StudentStudentIdentifierState]                 NVARCHAR (40)  NULL,
    [K12StudentStudentIdentifierDistrict]              NVARCHAR (40)  NULL,
    [K12StudentStudentIdentifierNationalMigrant]       NVARCHAR (40)  NULL,
    [PsStudentStudentIdentifierState]                  NVARCHAR (40)  NULL,
    [AeStudentStudentIdentifierState]                  NVARCHAR (40)  NULL,
    [WorkforceProgramParticipantPersonIdentifierState] NVARCHAR (40)  NULL,
    [EarlyLearningStaffStaffMemberIdentifierState]     NVARCHAR (40)  NULL,
    [K12StaffStaffMemberIdentifierState]               NVARCHAR (40)  NULL,
    [K12StaffStaffMemberIdentifierDistrict]            NVARCHAR (40)  NULL,
    [PsStaffStaffMemberIdentifierState]                NVARCHAR (40)  NULL,
    [PersonIdentifierDriversLicense]                   NVARCHAR (40)  NULL,
    [IsActiveEarlyLearningChild]                       BIT            NULL,
    [IsActiveK12Student]                               BIT            NULL,
    [IsActivePsStudent]                                BIT            NULL,
    [IsActiveAeStudent]                                BIT            NULL,
    [IsActiveWorkforceProgramParticipant]              BIT            NULL,
    [IsActiveEarlyLearningStaffMember]                 BIT            NULL,
    [IsActiveK12StaffMember]                           BIT            NULL,
    [IsActivePsStaffMember]                            BIT            NULL,
    [RecordStartDateTime]                              DATETIME       NULL,
    [RecordEndDateTime]                                DATETIME       NULL,
    [ElectronicMailAddressHome]                        NVARCHAR (252) NULL,
    [ElectronicMailAddressOrganizational]              NVARCHAR (252) NULL,
    [ElectronicMailAddressWork]                        NVARCHAR (252) NULL,
    [TelephoneNumberFax]                               NVARCHAR (48)  NULL,
    [TelephoneNumberHome]                              NVARCHAR (48)  NULL,
    [TelephoneNumberMobile]                            NVARCHAR (48)  NULL,
    [TelephoneNumberWork]                              NVARCHAR (48)  NULL,
    [PersonalTitleOrPrefix]                            NVARCHAR (200) NULL,
    [PositionTitle]                                    NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPersonId] PRIMARY KEY CLUSTERED ([DimPersonId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_IsActiveK12Student]
    ON [RDS].[DimPeople]([IsActiveK12Student] ASC)
    INCLUDE([DimPersonId]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_IsActiveK12Student_IsActivePsStudent_WithIncludes]
    ON [RDS].[DimPeople]([IsActiveK12Student] ASC, [IsActivePsStudent] ASC)
    INCLUDE([BirthDate], [K12StudentStudentIdentifierState], [RecordStartDateTime]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_K12Students]
    ON [RDS].[DimPeople]([K12StudentStudentIdentifierState] ASC, [FirstName] ASC, [MiddleName] ASC, [LastOrSurname] ASC, [BirthDate] ASC, [RecordStartDateTime] ASC, [RecordEndDateTime] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_RecordStartDateTime_WithIncludes]
    ON [RDS].[DimPeople]([RecordStartDateTime] ASC)
    INCLUDE([FirstName], [MiddleName], [LastOrSurname], [BirthDate], [K12StudentStudentIdentifierState], [PsStudentStudentIdentifierState], [K12StaffStaffMemberIdentifierState]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_RecordStartDateTime_K12ID_PSID_RecordEndDateTime]
    ON [RDS].[DimPeople]([RecordStartDateTime] ASC)
    INCLUDE([K12StudentStudentIdentifierState], [PsStudentStudentIdentifierState], [RecordEndDateTime]);


GO

