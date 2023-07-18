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
    [IsActiveELChild]                                  BIT            NULL,
    [IsActiveK12Student]                               BIT            NULL,
    [IsActivePsStudent]                                BIT            NULL,
    [IsActiveAeStudent]                                BIT            NULL,
    [IsActiveWorkforceProgramParticipant]              BIT            NULL,
    [IsActiveELStaff]                                  BIT            NULL,
    [IsActiveK12Staff]                                 BIT            NULL,
    [IsActivePsStaff]                                  BIT            NULL,
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


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a staff member by a school, school system, a state, registry, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Member Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001070' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a staff member by a school, school system, a state, registry, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Member Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001070' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierDistrict';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierNationalMigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierNationalMigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierNationalMigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierNationalMigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierNationalMigrant';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'K12StudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21172' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A full legal middle name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Middle Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000184' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21184' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonIdentifierDriversLicense';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a person by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonIdentifierDriversLicense';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonIdentifierDriversLicense';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001572' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonIdentifierDriversLicense';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22551' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonIdentifierDriversLicense';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a staff member by a school, school system, a state, registry, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Member Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001070' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PsStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22899' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22898' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'WorkforceProgramParticipantPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a person by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'WorkforceProgramParticipantPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'WorkforceProgramParticipantPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001572' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'WorkforceProgramParticipantPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22551' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'WorkforceProgramParticipantPersonIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'AeStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'AeStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'AeStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'AeStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'AeStudentStudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person was born.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Birthdate' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000033' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21033' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'BirthDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21115' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELChild';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELChild';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELChild';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELChild';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELChild';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Student';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Student';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Student';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Student';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Student';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveAeStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveAeStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveAeStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveAeStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveAeStudent';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveWorkforceProgramParticipant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveWorkforceProgramParticipant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveWorkforceProgramParticipant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveWorkforceProgramParticipant';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveWorkforceProgramParticipant';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveELStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Staff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Staff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Staff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Staff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActiveK12Staff';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the way in which a person relates to an organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Role' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001946' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22959' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'IsActivePsStaff';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningChildChildIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a child by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningChildChildIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Child Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningChildChildIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001080' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningChildChildIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21781' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningChildChildIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a staff member by a school, school system, a state, registry, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Member Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001070' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21156' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'EarlyLearningStaffStaffMemberIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numbers, letters, and symbols used to identify an electronic mail (e-mail) user within the network to which the person or organization belongs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Electronic Mail Address' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressHome';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numbers, letters, and symbols used to identify an electronic mail (e-mail) user within the network to which the person or organization belongs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Electronic Mail Address' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressOrganizational';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The numbers, letters, and symbols used to identify an electronic mail (e-mail) user within the network to which the person or organization belongs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Electronic Mail Address' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21088' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'ElectronicMailAddressWork';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An appellation, if any, used to denote rank, placement, or status (e.g., Mr., Ms., Reverend, Sister, Dr., Colonel).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Personal Title or Prefix' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000212' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21212' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PersonalTitleOrPrefix';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name of a person''s position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Position Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000213' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21213' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberFax';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberHome';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberMobile';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The telephone number including the area code, and extension, if applicable.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Telephone Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberWork';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimPeople', @level2type=N'COLUMN',@level2name=N'TelephoneNumberWork';
GO