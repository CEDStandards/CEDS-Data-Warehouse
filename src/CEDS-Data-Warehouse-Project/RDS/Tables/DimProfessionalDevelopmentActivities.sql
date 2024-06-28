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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A code given to an activity by an approval organization to designate it as an approved activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Approval Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001432' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001432' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A code assigned to an professional development activity by the organization offering the activity that is unique to the non-variable activity details.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001434' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001434' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The cost for an attendee to participate in a professional development activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Cost' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001435' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001435' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCost';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the content covered in the professional development activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001438' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001438' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month, and day on which any certificate awarded as part of a professional development activity expires.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Expiration Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001451' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001451' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityExpirationDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to the Professional Development Activity as assigned by the organization offering the training.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000809' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000809' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityObjective';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The expected outcomes of a participant in an activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityObjective';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Objective' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityObjective';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001440' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityObjective';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001440' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityObjective';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title of an activity designed for the purpose of developing someone professionally.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000810' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000810' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'SponsoringAgencyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name of the sponsoring agency.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'SponsoringAgencyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Sponsoring Agency Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'SponsoringAgencyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001489' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'SponsoringAgencyName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001489' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'SponsoringAgencyName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The purposes for which an activity is approved.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Approved Purpose' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001433' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001433' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The purposes for which an activity is approved.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Approved Purpose' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001433' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001433' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityApprovedPurposeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of credit awarded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Credit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001436' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001436' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of credit awarded.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Credit Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001436' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001436' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityCreditTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An age group or education level to which the professional development activity''s content pertains.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Education Levels Addressed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An age group or education level to which the professional development activity''s content pertains.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Education Levels Addressed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001279' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityEducationLevelsAddressedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the level of a professional development activity on the beginner to advanced continuum.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001439' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001439' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indicator of the level of a professional development activity on the beginner to advanced continuum.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Level' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001439' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001439' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityLevelDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A categorization of the audience for which the professional development activity is intended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Target Audience' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001492' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001492' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A categorization of the audience for which the professional development activity is intended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Target Audience' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001492' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001492' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTargetAudienceDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The indication of the type of professional development activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001442' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001442' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The indication of the type of professional development activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Activity Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001442' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001442' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentActivityTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The language in which the professional development session is delivered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Session Language' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The language in which the professional development session is delivered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Professional Development Session Language' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimProfessionalDevelopmentActivities', @level2type=N'COLUMN',@level2name=N'ProfessionalDevelopmentSessionLanguageDescription';
GO