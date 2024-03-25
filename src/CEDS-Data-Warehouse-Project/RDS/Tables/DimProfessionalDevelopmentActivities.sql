CREATE TABLE [RDS].[DimProfessionalDevelopmentActivities]
(
	[DimProfessionalDevelopmentActivityId] int NOT NULL IDENTITY (1, 1),
	[ProfessionalDevelopmentActivityIdentifier] nvarchar(40) NULL,
	[ProfessionalDevelopmentActivityTitle] nvarchar(60) NULL,
	[SponsoringAgencyName] nvarchar(60) NULL,
	[ProfessionalDevelopmentActivityTypeCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentActivityTypeDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentActivityDescription] nvarchar(max) NULL,
	[ProfessionalDevelopmentActivityEducationLevelsAddressedCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentActivityEducationLevelsAddressedDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentActivityObjective] nvarchar(max) NULL,
	[ProfessionalDevelopmentActivityLevelCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentActivityLevelDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentActivityCreditTypeCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentActivityCreditTypeDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentActivityTargetAudienceCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentActivityTargetAudienceDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentSessionLanguageCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentSessionLanguageDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentActivityExpirationDate] date NULL,
	[ProfessionalDevelopmentActivityApprovedPurposeCode] nvarchar(50) NOT NULL,
	[ProfessionalDevelopmentActivityApprovedPurposeDescription] nvarchar(200) NOT NULL,
	[ProfessionalDevelopmentActivityApprovalCode] nvarchar(30) NULL,
	[ProfessionalDevelopmentActivityCode] nvarchar(100) NULL,
	[ProfessionalDevelopmentActivityCost] decimal(18,2) NULL,
	CONSTRAINT [PK_DimProfessionalDevelopmentActivities] PRIMARY KEY CLUSTERED ([DimProfessionalDevelopmentActivityId] ASC)
)
GO