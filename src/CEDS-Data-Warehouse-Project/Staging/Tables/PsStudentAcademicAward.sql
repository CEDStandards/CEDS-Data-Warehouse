CREATE TABLE [Staging].[PsStudentAcademicAward] (
    [Id]                                         INT            IDENTITY (1, 1) NOT NULL,
    [InstitutionIpedsUnitId]                     VARCHAR (50)   NULL,
    [StudentIdentifierState]                     NVARCHAR (40)  NULL,
    [ProfessionalOrTechnicalCredentialConferred] NVARCHAR (50)  NULL,
    [AcademicAwardDate]                          DATETIME       NULL,
    [PescAwardLevelType]                         NVARCHAR (200) NULL,
    [AcademicAwardTitle]                         NVARCHAR (200) NULL,
    [EntryDate]                                  DATETIME       NULL,
    [ExitDate]                                   DATETIME       NULL,
    [SchoolYear]                                 SMALLINT       NULL,
    [DataCollectionName]                         NVARCHAR (50)  NULL,
    [OrganizationId]                             INT            NULL,
    [PersonId]                                   INT            NULL,
    [OrganizationPersonRoleId]                   INT            NULL,
    [PsStudentAcademicAwardId]                   INT            NULL,
    CONSTRAINT [PK_PsStudentAcademicAward] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

