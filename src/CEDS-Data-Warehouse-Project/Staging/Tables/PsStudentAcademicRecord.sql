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
    CONSTRAINT [PK_PsStudentAcademicRecord] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_PsStudentAcademicRecord_SchoolYear_DC_StudentId]
    ON [Staging].[PsStudentAcademicRecord]([SchoolYear] ASC, [DataCollectionName] ASC, [StudentIdentifierState] ASC)
    INCLUDE([InstitutionIpedsUnitId], [AcademicTermDesignator], [EntryDate], [ExitDate]);


GO

CREATE NONCLUSTERED INDEX [IX_PsStudentAcademicRecord_AcademicTermDesignator]
    ON [Staging].[PsStudentAcademicRecord]([AcademicTermDesignator] ASC)
    INCLUDE([StudentIdentifierState], [SchoolYear], [EntryDate]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21703' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The month and year on which the diploma/credential is awarded to a student in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Diploma or Credential Award Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000081' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21081' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'DiplomaOrCredentialAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credit hours and/or contact hours successfully completed by a person during a term.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Instructional Activity Hours Completed' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000362' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21361' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'InstructionalActivityHoursCompletedCredit';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of credential conferred by a state occupational licensing entity or industry organization for competency in a specific area measured by a set of pre-established standards.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional or Technical Credential Conferred' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000783' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21780' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicRecord', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO