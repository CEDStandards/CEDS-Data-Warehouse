CREATE TABLE [Staging].[PsStudentCourseTranscript] (
    [Id]                                    INT IDENTITY (1, 1) NOT NULL,
    [InstitutionIpedsUnitId]                VARCHAR (50)    NULL,
    [StudentIdentifierState]                VARCHAR (50)    NULL,
    [FirstName]                             NVARCHAR (100)  NULL,
    [LastOrSurname]                         NVARCHAR (100)  NULL,
    [MiddleName]                            NVARCHAR (100)  NULL,
    [Birthdate]                             DATE            NULL,
    [Sex]                                   NVARCHAR (30)   NULL,
    [HispanicOrLatinoEthnicity]             NVARCHAR (30)   NULL,
    [AcademicTermDesignator]                NVARCHAR (50)   NULL,
    [StateCourseIdentifier]                 NVARCHAR (50)   NULL,
    [UniversityCourseIdentifier]            NVARCHAR (50)   NULL,
    [CipCode]                               NVARCHAR (50)   NULL,
    [CipUse]                                NVARCHAR (50)   NULL,
    [CipVersion]                            NVARCHAR (50)   NULL,
    [EnglishLearnerStatus]                  NVARCHAR (50)   NULL,
    [PerkinsEnglishLearnerStatus]           NVARCHAR (50)   NULL,
    [MigrantStatus]                         NVARCHAR (50)   NULL,
    [EconomicDisadvantageStatus]            NVARCHAR (50)   NULL,
    [HomelessnessStatus]                    NVARCHAR (50)   NULL,
    [PrimaryDisabilityType]                 NVARCHAR (50)   NULL,
    [IDEAIndicator]                         BIT   NULL,
    [DisabilityStatus]                      BIT   NULL,
    [Section504Status]                      BIT   NULL,
    [DisabilityConditionType]               NVARCHAR (50)   NULL,
    [TitleIIIImmigrantStatus]               BIT   NULL,
    [MilitaryConnectedStudentIndicator]     NVARCHAR (50)   NULL,
    [ActiveMilitaryStatusIndicator]         NVARCHAR (50)   NULL,
    [MilitaryBranch]                        NVARCHAR (50)   NULL,
    [MilitaryVeteranStatusIndicator]        NVARCHAR (50)   NULL,
    [NumberOfCreditsAttempted]              DECIMAL(9,2)    NULL,
    [NumberOfCreditsEarned]                 DECIMAL(9,2)    NULL,
    [StudentCourseSectionGradeEarned]       NVARCHAR(15)    NULL,
    [CourseGPAApplicability]                NVARCHAR(50)    NULL,
    [SchoolYear]                            SMALLINT        NULL,
    [DataCollectionName]                    NVARCHAR (50)   NULL,
    [RunDateTime]                           DATETIME        NULL,
    CONSTRAINT [PK_PsStudentCourseTranscript] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'InstitutionIpedsUnitId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Unique identification number assigned to postsecondary institutions surveyed through the Integrated Postsecondary Education Data System (IPEDS). Also referred to as UNITID or IPEDS ID.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'InstitutionIpedsUnitId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Institution IPEDS UnitID' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'InstitutionIpedsUnitId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000166' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'InstitutionIpedsUnitId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000166' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'InstitutionIpedsUnitId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElement', @value=N'Student Identification System' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementGlobalId', @value=N'001075' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionCode', @value=N'State' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_SuffixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/001075' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000055' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000055' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Course Code System' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'State' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StateCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000055' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000055' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElement', @value=N'Course Code System' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementGlobalId', @value=N'000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionCode', @value=N'University' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_PrefixConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/000056' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'UniversityCourseIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The academic term for which the data apply.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Academic Term Designator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000727' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000727' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'AcademicTermDesignator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates whether a person is an active member of the active duty forces, national guard, or reserve forces.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Active Military Status Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001577' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001577' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'ActiveMilitaryStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person was born.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Birthdate' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000033' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Birthdate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A six-digit code in the form xx.xxxx that identifies instructional program specialties within educational institutions.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Code' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000043' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000043' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipUse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether the CIP Code is referencing an enrollment program or an award program.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipUse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Use' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipUse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000044' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipUse';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000044' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipUse';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The version of CIP being reported.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Classification of Instructional Program Version' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000045' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000045' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CipVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of whether or not this course being described is included in the computation of the student’s Grade Point Average (GPA).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Course Grade Point Average Applicability' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000060' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicability';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000060' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicability';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityConditionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Codes identifying the set of disability conditions.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityConditionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Condition Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityConditionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001320' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityConditionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001320' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityConditionType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a person is classified as disabled under the American''s with Disability Act (ADA).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disability Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000577' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000577' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'DisabilityStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student met the State criteria for classification as having an economic disadvantage.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Economic Disadvantage Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000086' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000086' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EconomicDisadvantageStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In coordination with the state''s definition based on Section 8101(20) of the ESEA, as amended by the ESSA, the term ''English learner'', when used with respect to an individual, means an individual:
(A) who is aged 3 through 21;
(B) who is enrolled or preparing to enroll in an elementary school or a secondary school;
(C) 
(i) who was not born in the United States or whose native languages are languages other than English;
(ii) 
(I) who is a Native American or Alaska Native, or a native resident of the outlying areas; and
(II) who comes from an environment where a language other than English has had a significant impact on the individual''s level of English language proficiency; or
(iii) who is migratory, whose native language is a language other than English, and who come from an environment where a language other than English is dominant; and
(D) whose difficulties in speaking, reading, writing, or understanding the English language may be sufficient to deny the individual 
(i) the ability to meet the challenging State academic standards;
(ii) the ability to successfully achieve in classrooms where the language of instruction is English; or
(iii) the opportunity to participate fully in society.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'English Learner Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000180' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000180' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'EnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal first name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'First Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000115' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000115' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'FirstName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HispanicOrLatinoEthnicity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the person traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central and South America, and other Spanish cultures, regardless of race.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HispanicOrLatinoEthnicity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Hispanic or Latino Ethnicity' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HispanicOrLatinoEthnicity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000144' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HispanicOrLatinoEthnicity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000144' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HispanicOrLatinoEthnicity';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Children and youth who lack a fixed, regular, and adequate nighttime residence. Homeless children and youth include: 1) children and youth who are sharing the housing of other persons due to loss of housing, economic hardship, or a similar reason; are living in motels, hotels, trailer parks, or camping grounds due to the lack of alternative adequate accommodations; are living in emergency or transitional shelters; are abandoned in hospitals; or are awaiting foster care placement; 2) children and youth who have a primary nighttime residence that is a public or private place not designed for or originally used as a regular sleeping accommodation for human beings; or 3) children and youths who are living in cars, parks, public spaces, abandoned buildings, substandard housing, bus or train stations, or similar settings. 4) migratory children who qualify as homeless because the children are living in circumstances described in the above. (See Section 103 of the McKinney Act for a more detailed description of this data element).' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Homelessness Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000149' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000149' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'HomelessnessStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'IDEAIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A person having intellectual disability; hearing impairment, including deafness; speech or language impairment; visual impairment, including blindness; serious emotional disturbance (hereafter referred to as emotional disturbance); orthopedic impairment; autism; traumatic brain injury; developmental delay; other health impairment; specific learning disability; deaf-blindness; or multiple disabilities and who, by reason thereof, receive special education and related services under the Individuals with Disabilities Education Act (IDEA) according to an Individualized Education Program (IEP), Individual Family Service Plan (IFSP), or service plan.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'IDEAIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'IDEAIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000151' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'IDEAIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000151' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'IDEAIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full legal last name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Last or Surname' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000172' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000172' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'LastOrSurname';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A full legal middle name given to a person at birth, baptism, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Middle Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000184' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000184' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MiddleName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000189' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A branch of the U.S. Military applicable for specifying more details when using Military Connected Student Indicator, Military Active Student Indicator,  Military Veteran Student Indicator, and Military Enlistment After Exit elements.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Branch' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001640' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001640' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryBranch';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student''s parent or guardian is on Active Duty, in the National Guard, or in the Reserve components of the United States military services' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Connected Student Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001576' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001576' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryConnectedStudentIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a person is a veteran who served on Active Duty, in the National Guard, or in the Reserve components of the United States military services.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Military Veteran Status Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001578' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001578' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'MilitaryVeteranStatusIndicator';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits that a student can earn for enrolling in and completing a given course.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Credits Attempted' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000199' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000199' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsAttempted';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of credits an individual earns by the successful completion of a course.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Number of Credits Earned' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000200' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000200' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'NumberOfCreditsEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A secondary student, an adult, or an out-of-school youth, who has limited ability in speaking, reading, writing, or understanding English language, and (a) whose native language is a language other than English, or (b) who lives in a family or community environment in which a language other than English is the dominant language.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Perkins English Learner Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000581' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000581' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PerkinsEnglishLearnerStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PrimaryDisabilityType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The major or overriding disability condition that best describes a person''s impairment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PrimaryDisabilityType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Primary Disability Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PrimaryDisabilityType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000218' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PrimaryDisabilityType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000218' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'PrimaryDisabilityType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Section504Status';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Individuals with disabilities who are being provided with related aids and services under Section 504 of the Rehabilitation Act of 1973, as amended.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Section504Status';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Section 504 Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Section504Status';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000249' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Section504Status';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000249' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Section504Status';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The concept describing the biological traits that distinguish the males and females of a species.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sex' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000255' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000255' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'Sex';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A final indicator of student performance in a course section as submitted by the instructor.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Course Section Grade Earned' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000124' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000124' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'StudentCourseSectionGradeEarned';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the child is an immigrant according to the Title III of ESEA definition, meaning children who are aged 3 through 21; were not born in any state; and have not been attending one or more schools in any one or more States for more than 3 full academic years.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title III Immigrant Status' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000291' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatus';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000291' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'PsStudentCourseTranscript', @level2type=N'COLUMN',@level2name=N'TitleIIIImmigrantStatus';
GO




---Still right here, need to add in the rest of the metadata for the columns.