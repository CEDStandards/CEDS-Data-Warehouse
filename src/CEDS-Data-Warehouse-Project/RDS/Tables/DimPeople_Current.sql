CREATE TABLE [RDS].[DimPeople_Current] (
    [DimPersonId]                                      BIGINT         IDENTITY (1, 1) NOT NULL,
    [FirstName]                                        NVARCHAR (75)  NULL,
    [MiddleName]                                       NVARCHAR (75)  NULL,
    [LastOrSurname]                                    NVARCHAR (75)  NULL,
    [Birthdate]                                        DATE           NULL,
    [ELChildChildIdentifierState]                      NVARCHAR (40)  NULL,
    [K12StudentStudentIdentifierState]                 NVARCHAR (40)  NULL,
    [K12StudentStudentIdentifierDistrict]              NVARCHAR (40)  NULL,
    [K12StudentStudentIdentifierNationalMigrant]       NVARCHAR (40)  NULL,
    [PsStudentStudentIdentifierState]                  NVARCHAR (40)  NULL,
    [AeStudentStudentIdentifierState]                  NVARCHAR (40)  NULL,
    [WorkforceProgramParticipantPersonIdentifierState] NVARCHAR (40)  NULL,
    [ELStaffStaffMemberIdentifierState]                NVARCHAR (40)  NULL,
    [K12StaffStaffMemberIdentifierState]               NVARCHAR (40)  NULL,
    [K12StaffStaffMemberIdentifierDistrict]            NVARCHAR (40)  NULL,
    [PsStaffStaffMemberIdentifierState]                NVARCHAR (40)  NULL,
    [PersonIdentifierDriversLicense]                   NVARCHAR (40)  NULL,
    [PersonIdentifierSSN]                              NVARCHAR (40)  NULL,
    [PersonIdentifierState]                            NVARCHAR (40)  NULL,
    [StudentIdentifierState]                           NVARCHAR (40)  NULL,
    [IsActiveELChild]                                  BIT            NULL,
    [IsActiveK12Student]                               BIT            NULL,
    [IsActivePsStudent]                                BIT            NULL,
    [IsActiveAeStudent]                                BIT            NULL,
    [IsActiveWorkforceProgramParticipant]              BIT            NULL,
    [IsActiveELStaff]                                  BIT            NULL,
    [IsActiveK12Staff]                                 BIT            NULL,
    [IsActivePsStaff]                                  BIT            NULL,
    [ElectronicMailAddressHome]                        NVARCHAR (252) NULL,
    [ElectronicMailAddressOrganizational]              NVARCHAR (252) NULL,
    [ElectronicMailAddressWork]                        NVARCHAR (252) NULL,
    [TelephoneNumberFax]                               NVARCHAR (48)  NULL,
    [TelephoneNumberHome]                              NVARCHAR (48)  NULL,
    [TelephoneNumberMobile]                            NVARCHAR (48)  NULL,
    [TelephoneNumberWork]                              NVARCHAR (48)  NULL,
    [PersonalTitleOrPrefix]                            NVARCHAR (200) NULL,
    [PositionTitle]                                    NVARCHAR (200) NULL,
    [GenerationCodeOrSuffix]                           NVARCHAR (75)   NULL,
    [HighestLevelOfEducationCompletedCode]             NVARCHAR (50)   NULL,
    [HighestLevelOfEducationCompletedDescription]      NVARCHAR (200)   NULL,

    CONSTRAINT [PK_DimPeople_Current] PRIMARY KEY CLUSTERED ([DimPersonId] ASC)
);


GO

-- Index analogs adapted from RDS.DimPeople (omitting RecordStartDateTime/RecordEndDateTime)
CREATE NONCLUSTERED INDEX [IX_DimPeople_Current_IsActiveK12Student]
    ON [RDS].[DimPeople_Current]([IsActiveK12Student] ASC)
    INCLUDE([DimPersonId]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_Current_IsActiveK12Student_IsActivePsStudent_WithIncludes]
    ON [RDS].[DimPeople_Current]([IsActiveK12Student] ASC, [IsActivePsStudent] ASC)
    INCLUDE([Birthdate], [K12StudentStudentIdentifierState]);


GO

CREATE NONCLUSTERED INDEX [IX_DimPeople_Current_K12Students]
    ON [RDS].[DimPeople_Current]([K12StudentStudentIdentifierState] ASC, [FirstName] ASC, [MiddleName] ASC, [LastOrSurname] ASC, [Birthdate] ASC);


GO
