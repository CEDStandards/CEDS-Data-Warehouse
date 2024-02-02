<<<<<<< Updated upstream
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


=======
CREATE TABLE [RDS].[DimCredentialDefinitions]
(
	[DimCredentialDefinitionId] int NOT NULL IDENTITY (1, 1),
	[CredentialDefinitionIdentifierCtid] nvarchar(512) NULL,
	[CredentialDefinitionTitle] nvarchar(300) NULL,
	[CredentialDefinitionDescription] nvarchar(300) NULL,
	[CredentialTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionCategorySystem] nvarchar(30) NULL,
	[CredentialDefinitionCategoryType] nvarchar(60) NULL,
	[CredentialDefinitionStatusTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionStatusTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionIntendedPurposeTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionIntendedPurposeTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionAssessmentMethodTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionAssessmentMethodTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionCriteria] nvarchar(300) NULL,
	[CredentialDefinitionCriteriaURL] nvarchar(512) NULL,
	[CredentialDefinitionKeywords] nvarchar(max) NULL,
	[CredentialDefinitionValidationMethodDescription] nvarchar(max) NULL,
	[CredentialImageURL] nvarchar(512) NULL,
	[CredentialDefinitionDateEffective] date NULL,
	[CTDLAudienceLevelTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CTDLAudienceLevelTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionTerminalDegreeIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionTerminalDegreeIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionScedCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionLowGradeLevelCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[CredentialDefinitionHighGradeLevelCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimCredentialDefinitions] PRIMARY KEY CLUSTERED ([DimCredentialDefinitionId] ASC)
)
GO
>>>>>>> Stashed changes
