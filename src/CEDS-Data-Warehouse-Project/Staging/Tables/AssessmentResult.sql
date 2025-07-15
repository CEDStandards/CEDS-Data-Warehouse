CREATE TABLE [Staging].[AssessmentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentIdentifierState] [nvarchar](40) NULL,
	[LeaIdentifierSeaAccountability] [nvarchar](50) NULL,
	[LeaIdentifierSeaAttendance] [nvarchar](50) NULL,
	[LeaIdentifierSeaFunding] [nvarchar](50) NULL,
	[LeaIdentifierSeaGraduation] [nvarchar](50) NULL,
	[LeaIdentifierSeaIndividualizedEducationProgram] [nvarchar](50) NULL,
	[SchoolIdentifierSea] [varchar](50) NULL,
	[AssessmentIdentifier] [varchar](50) NULL,
	[AssessmentTitle] [varchar](100) NULL,
	[AssessmentAcademicSubject] [varchar](100) NULL,
	[AssessmentPurpose] [varchar](100) NULL,
	[AssessmentType] [varchar](100) NULL,
	[AssessmentTypeAdministered] [varchar](100) NULL,
	[AssessmentTypeAdministeredToEnglishLearners] [varchar](100) NULL,
	[AssessmentAdministrationStartDate] [date] NULL,
	[AssessmentAdministrationFinishDate] [date] NULL,
	[AssessmentRegistrationParticipationIndicator] [bit] NULL,
	[GradeLevelWhenAssessed] [varchar](100) NULL,
	[ScoreValue] [varchar](50) NULL,
	[StateFullAcademicYear] [bit] NULL,
	[LEAFullAcademicYear] [bit] NULL,
	[SchoolFullAcademicYear] [bit] NULL,
	[AssessmentRegistrationReasonNotCompleting] [varchar](100) NULL,
	[AssessmentRegistrationReasonNotTested] [varchar](100) NULL,
	[AssessmentPerformanceLevelIdentifier] [varchar](100) NULL,
	[AssessmentPerformanceLevelLabel] [varchar](100) NULL,
	[AssessmentScoreMetricType] [varchar](100) NULL,
	[AssessmentAccommodationCategory] [nvarchar](100) NULL,
	[AccessibilityFeatureType] [nvarchar](100) NULL,
    [AccessibilityFeatureApplicationType] [nvarchar](100) NULL,
	[SchoolYear] [smallint] NULL,
	[DataCollectionName] [nvarchar](100) NULL,
	[RunDateTime] [datetime] NULL,
 CONSTRAINT [PK_AssessmentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'DataCollectionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'DataCollectionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'DataCollectionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'DataCollectionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'DataCollectionName'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a student by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001071' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21157' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StudentIdentifierState'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAccountability'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaAttendance'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaFunding'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaGraduation'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to a local education agency by a school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Local Education Agency Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001068' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21153' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LeaIdentifierSeaIndividualizedEducationProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an institution by a school, school system, a state, or other agency or entity.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001069' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21155' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolIdentifierSea'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title or name of the assessment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Title' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000028' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21028' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Academic Subject' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000021' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21021' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason for which an assessment is designed or delivered.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Purpose' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000026' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21026' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of an assessment based on format and content.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000029' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21029' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of assessment administered.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type Administered' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000415' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21405' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The types of assessments administered to English Learners.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type Administered to English Learners' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001995' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22974' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date of the time period designated for the assessment administration.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000962' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21963' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The finish date of the time period designated for the assessment administration.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Finish Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000964' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21965' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student participated in an assessment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Participation Indicator' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000025' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21025' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicator'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The grade or developmental level of a student when assessed.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'GradeLevelWhenAssessed'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Grade Level When Assessed' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'GradeLevelWhenAssessed'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000126' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'GradeLevelWhenAssessed'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21126' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'GradeLevelWhenAssessed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'GradeLevelWhenAssessed'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LEAFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LEAFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LEAFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LEAFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'LEAFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a participant did not complete an assessment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompleting'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Reason Not Completing' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompleting'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000540' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompleting'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21531' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompleting'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompleting'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an assessment performance level.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000717' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21693' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A label representing the performance level appropriate for use on a report.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Label' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000718' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21694' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The specific method used to report the performance and achievement of the assessment. This is the metric that is being used to derive the scores.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Score Metric Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000369' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21368' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'AssessmentScoreMetricType'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'AssessmentResult', @level2type=N'COLUMN',@level2name=N'SchoolYear'
GO


