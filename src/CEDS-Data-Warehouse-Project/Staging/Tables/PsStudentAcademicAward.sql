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
    CONSTRAINT [PK_PsStudentAcademicAward] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day or year and month on which the academic award was conferred.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Award Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000001' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21001' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive title for the academic award.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Award Title' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000003' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21003' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'AcademicAwardTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'PescAwardLevelType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of award conferred by a college, university, or other postsecondary education institution as official recognition for the successful completion of a program of study.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'PescAwardLevelType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'PESC Award Level Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'PescAwardLevelType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001668' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'PescAwardLevelType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22649' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'PescAwardLevelType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the category of credential conferred by a state occupational licensing entity or industry organization for competency in a specific area measured by a set of pre-established standards.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional or Technical Credential Conferred' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000783' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21780' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'ProfessionalOrTechnicalCredentialConferred';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentAcademicAward', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO