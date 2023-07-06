CREATE TABLE [Staging].[PsStudentAcademicRecord] (
    [Id]                                         INT             IDENTITY (1, 1) NOT NULL,
    [InstitutionIpedsUnitId]                     VARCHAR (50)    NULL,
    [StudentIdentifierState]                     VARCHAR (50)    NULL,
    [DiplomaOrCredentialAwardDate]               DATETIME        NULL,
    [AcademicTermDesignator]                     NVARCHAR (50)   NULL,
    [ProfessionalOrTechnicalCredentialConferred] VARCHAR (50)    NULL,
    [InstructionalActivityHoursCompletedCredit]  DECIMAL (10, 2) NULL,
    [SchoolYear]                                 SMALLINT        NULL,
    [EntryDate]                                  DATETIME        NULL,
    [ExitDate]                                   DATETIME        NULL,
    [DataCollectionName]                         NVARCHAR (50)   NULL,
    [DataCollectionID]                           INT             NULL,
    [PersonId]                                   INT             NULL,
    [OrganizationId]                             INT             NULL,
    [OrganizationPersonRoleId]                   INT             NULL,
    [PsStudentAcademicRecordId]                  INT             NULL,
    CONSTRAINT [PK_PsStudentAcademicRecord] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_PsStudentAcademicRecord_SchoolYear_DC_StudentId]
    ON [Staging].[PsStudentAcademicRecord]([SchoolYear] ASC, [DataCollectionName] ASC, [StudentIdentifierState] ASC)
    INCLUDE([InstitutionIpedsUnitId], [AcademicTermDesignator], [EntryDate], [ExitDate]);


GO

CREATE NONCLUSTERED INDEX [IX_PsStudentAcademicRecord_AcademicTermDesignator]
    ON [Staging].[PsStudentAcademicRecord]([AcademicTermDesignator] ASC)
    INCLUDE([StudentIdentifierState], [SchoolYear], [EntryDate], [OrganizationId], [DataCollectionID]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

