CREATE TABLE [RDS].[DimCredentialDefinitions](
	[DimCredentialDefinitionId] [int] IDENTITY(1,1) NOT NULL,
	[CredentialDefinitionIdentifierCtid] [nvarchar](512) NULL,
	[CredentialDefinitionTitle] [nvarchar](300) NULL,
	[CredentialDefinitionDescription] [nvarchar](300) NULL,
	[CredentialTypeCode] [nvarchar](50) NOT NULL,
	[CredentialTypeDescription] [nvarchar](200) NOT NULL,
	[CredentialDefinitionCategorySystem] [nvarchar](30) NULL,
	[CredentialDefinitionCategoryType] [nvarchar](60) NULL,
	[CredentialDefinitionStatusTypeCode] [nvarchar](50) NOT NULL,
	[CredentialDefinitionStatusTypeDescription] [nvarchar](200) NOT NULL,
	[CredentialDefinitionIntendedPurposeTypeCode] [nvarchar](50) NOT NULL,
	[CredentialDefinitionIntendedPurposeTypeDescription] [nvarchar](200) NOT NULL,
	[CredentialDefinitionAssessmentMethodTypeCode] [nvarchar](50) NOT NULL,
	[CredentialDefinitionAssessmentMethodTypeDescription] [nvarchar](200) NOT NULL,
	[CredentialDefinitionCriteria] [nvarchar](300) NULL,
	[CredentialDefinitionCriteriaURL] [nvarchar](512) NULL,
	[CredentialDefinitionKeywords] [nvarchar](max) NULL,
	[CredentialDefinitionValidationMethodDescription] [nvarchar](max) NULL,
	[CredentialImageURL] [nvarchar](512) NULL,
	[CredentialDefinitionDateEffective] [date] NULL,
	[CredentialOfferedStartDate] [date] NULL,
	[CredentialOfferedEndDate] [date] NULL,
	[CoreAcademicCourseCode] nvarchar(50) NULL,
	[CoreAcademicCourseDescription] nvarchar(200) NULL,
	[CTDLAudienceLevelTypeCode] [nvarchar](50) NOT NULL,
	[CTDLAudienceLevelTypeDescription] [nvarchar](200) NOT NULL,
	[CredentialDefinitionTerminalDegreeIndicatorCode] [nvarchar](50) NOT NULL,
	[CredentialDefinitionTerminalDegreeIndicatorDescription] [nvarchar](200) NOT NULL,
	[CredentialDefinitionScedCode] [nvarchar](50) NOT NULL,
	[CredentialDefinitionLowGradeLevelCode] [nvarchar](50) NOT NULL,
	[CredentialDefinitionHighGradeLevelCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimCredentialDefinitions] PRIMARY KEY CLUSTERED 
(
	[DimCredentialDefinitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionStatusTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionStatusTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionIntendedPurposeTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionIntendedPurposeTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionAssessmentMethodTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionAssessmentMethodTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CTDLAudienceLevelTypeCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CTDLAudienceLevelTypeDescription]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionTerminalDegreeIndicatorCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionTerminalDegreeIndicatorDescription]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionScedCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionLowGradeLevelCode]
GO

ALTER TABLE [RDS].[DimCredentialDefinitions] ADD  DEFAULT ('MISSING') FOR [CredentialDefinitionHighGradeLevelCode]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The course meets the state definition of a core academic course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Core Academic Course' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000518' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000518' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The course meets the state definition of a core academic course.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Core Academic Course' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000518' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000518' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CoreAcademicCourseDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to conduct the assessment being referenced.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Assessment Method Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001738' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001738' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The method used to conduct the assessment being referenced.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Assessment Method Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001738' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001738' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionAssessmentMethodTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The intended type of application of the credential by the holder.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Intended Purpose Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001749' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001749' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The intended type of application of the credential by the holder.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Intended Purpose Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001749' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001749' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionIntendedPurposeTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of the credential offered by a credentialing organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of the credential offered by a credentialing organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001740' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'This degree is the highest degree that can be awarded in this classification of instructional programs field or program area.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Terminal Degree Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001953' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001953' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'This degree is the highest degree that can be awarded in this classification of instructional programs field or program area.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Definition Terminal Degree Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001953' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001953' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialDefinitionTerminalDegreeIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of credential a person holds.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the category of credential a person holds.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Credential Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000071' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CredentialTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of level indicating a point in a progression through an educational or training context, for which the credential is intended; select from an existing enumeration of such types.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'CTDL Audience Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001913' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001913' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of level indicating a point in a progression through an educational or training context, for which the credential is intended; select from an existing enumeration of such types.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'CTDL Audience Level Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001913' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001913' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCredentialDefinitions', @level2type=N'COLUMN',@level2name=N'CTDLAudienceLevelTypeDescription';
GO