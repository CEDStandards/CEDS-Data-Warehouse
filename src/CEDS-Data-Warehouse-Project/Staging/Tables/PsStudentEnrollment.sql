CREATE TABLE [Staging].[PsStudentEnrollment] (
    [Id]                                INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]            NVARCHAR (100) NULL,
    [InstitutionIpedsUnitId]            NVARCHAR (100) NULL,
    [FirstName]                         VARCHAR (100)  NULL,
    [LastOrSurname]                     VARCHAR (100)  NULL,
    [MiddleName]                        VARCHAR (100)  NULL,
    [Birthdate]                         DATE           NULL,
    [Sex]                               VARCHAR (30)   NULL,
    [HispanicLatinoEthnicity]           BIT            NULL,
    [PostsecondaryExitOrWithdrawalType] NVARCHAR (100) NULL,
    [EntryDateIntoPostsecondary]        DATETIME       NULL,
    [EntryDate]                         DATETIME       NULL,
    [ExitDate]                          DATETIME       NULL,
    [AcademicTermDesignator]            VARCHAR (100)  NULL,
    [SchoolYear]                        SMALLINT       NULL,
    [RecordStartDateTime]               DATETIME       NULL,
    [RecordEndDateTime]                 DATETIME       NULL,
    [DataCollectionName]                NVARCHAR (100) NULL,
    [DataCollectionId]                  INT            NULL,
    [PersonId]                          INT            NULL,
    [OrganizationPersonRoleId]          INT            NULL,
    [OrganizationId_PsInstitution]      INT            NULL,
    CONSTRAINT [PK_PsTermEnrollment] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_PsStudentEnrollment_StudentIdentifierState_EntryDate_DataCollectionName]
    ON [Staging].[PsStudentEnrollment]([StudentIdentifierState] ASC, [SchoolYear] ASC, [PostsecondaryExitOrWithdrawalType] ASC, [EntryDate] ASC, [DataCollectionName] ASC)
    INCLUDE([AcademicTermDesignator], [Birthdate], [EntryDateIntoPostsecondary], [ExitDate], [FirstName], [HispanicLatinoEthnicity], [InstitutionIpedsUnitId], [LastOrSurname], [MiddleName], [Sex]);


GO

CREATE NONCLUSTERED INDEX [IX_PsStudentEnrollment_StudentId_InstitutionIpedsId_HispanicLatino_EntryDate_DataCollectionName]
    ON [Staging].[PsStudentEnrollment]([DataCollectionName] ASC, [EntryDate] ASC, [StudentIdentifierState] ASC, [InstitutionIpedsUnitId] ASC, [HispanicLatinoEthnicity] ASC, [AcademicTermDesignator] ASC, [ExitDate] ASC);


GO

