CREATE TABLE [RDS].[DimTitleIStatuses](
	[DimTitleIStatusId] [int] IDENTITY(1,1) NOT NULL,
	[TitleIIndicatorCode] [nvarchar](50) NULL,
	[TitleIIndicatorDescription] [nvarchar](100) NULL,
	[TitleIIndicatorEdFactsCode] [nvarchar](50) NULL,
	[SchoolChoiceAppliedforTransferStatusCode] [nvarchar](50) NULL,
	[SchoolChoiceAppliedforTransferStatusDescription] [nvarchar](100) NULL,
	[SchoolChoiceEligibleforTransferStatusCode] [nvarchar](50) NULL,
	[SchoolChoiceEligibleforTransferStatusDescription] [nvarchar](100) NULL,
	[SchoolChoiceTransferStatusCode] [nvarchar](50) NULL,
	[SchoolChoiceTransferStatusDescription] [nvarchar](100) NULL,
	[TitleISchoolSupplementalServicesAppliedStatusCode] [nvarchar](50) NULL,
	[TitleISchoolSupplementalServicesAppliedStatusDescription] [nvarchar](100) NULL,
	[TitleISchoolSupplementalServicesEligibleStatusCode] [nvarchar](50) NULL,
	[TitleISchoolSupplementalServicesEligibleStatusDescription] [nvarchar](100) NULL,
	[TitleISchoolSupplementalServicesReceivedStatusCode] [nvarchar](50) NULL,
	[TitleISchoolSupplementalServicesReceivedStatusDescription] [nvarchar](100) NULL,
	[TitleISchoolwideProgramParticipationCode] [nvarchar](50) NULL,
	[TitleISchoolwideProgramParticipationDescription] [nvarchar](100) NULL,
	[TitleITargetedAssistanceParticipationCode] [nvarchar](50) NULL,
	[TitleITargetedAssistanceParticipationDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_DimTitleIStatuses] PRIMARY KEY CLUSTERED 
(
	[DimTitleIStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is participating in and served by programs under Title I, Part A of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000281' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000281' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is participating in and served by programs under Title I, Part A of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000281' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000281' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student is participating in and served by programs under Title I, Part A of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorEdFactsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorEdFactsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000281' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorEdFactsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000281' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorEdFactsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleIIndicatorEdFactsCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a student applied to transfer in the current year (regardless of whether the student transferred), OR previously applied and transferred under the public school choice provisions and continue to attend the transfer school in the current year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Choice Applied for Transfer Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000235' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000235' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a student applied to transfer in the current year (regardless of whether the student transferred), OR previously applied and transferred under the public school choice provisions and continue to attend the transfer school in the current year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Choice Applied for Transfer Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000235' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000235' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceAppliedforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication the student is eligible to transfer for the current school year under the public school choice provisions or who applied and transferred in the current school year under the public school choice provisions or previously applied and transferred under the public school choice provisions and continue to attend the transfer school in the current year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Choice Eligible for Transfer Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000236' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000236' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication the student is eligible to transfer for the current school year under the public school choice provisions or who applied and transferred in the current school year under the public school choice provisions or previously applied and transferred under the public school choice provisions and continue to attend the transfer school in the current year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Choice Eligible for Transfer Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000236' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000236' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceEligibleforTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an eligible student transferred to the school under the provisions for public school choice in accordance with Title I, Part A, Section 1116 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Choice Transfer Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000237' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000237' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an eligible student transferred to the school under the provisions for public school choice in accordance with Title I, Part A, Section 1116 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Choice Transfer Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000237' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000237' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'SchoolChoiceTransferStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an eligible student applied/requested to receive supplemental educational services under Title I, Part A, Section 1116 of ESEA as amended during the school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Supplemental Services Applied Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000286' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000286' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an eligible student applied/requested to receive supplemental educational services under Title I, Part A, Section 1116 of ESEA as amended during the school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Supplemental Services Applied Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000286' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000286' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesAppliedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student is eligible to receive supplemental educational services during the school year in accordance with Title I, Part A, Section 1116 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Supplemental Services Eligible Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student is eligible to receive supplemental educational services during the school year in accordance with Title I, Part A, Section 1116 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Supplemental Services Eligible Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000287' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesEligibleStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an eligible student received supplemental educational services during the school year in accordance with Title I, Part A, Section 1116 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Supplemental Services Received Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000288' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000288' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether an eligible student received supplemental educational services during the school year in accordance with Title I, Part A, Section 1116 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I School Supplemental Services Received Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000288' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000288' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolSupplementalServicesReceivedStatusDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student participates in and is served by a schoolwide program (SWP) under Title I of ESEA, Part A, Sections 1114.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Schoolwide Program Participation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student participates in and is served by a schoolwide program (SWP) under Title I of ESEA, Part A, Sections 1114.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Schoolwide Program Participation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000550' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleISchoolwideProgramParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student participates in and is served by a targeted assistance (TAS) program under Title I of ESEA, Part A, Sections 1115.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Targeted Assistance Participation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000551' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000551' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that the student participates in and is served by a targeted assistance (TAS) program under Title I of ESEA, Part A, Sections 1115.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Targeted Assistance Participation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000551' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000551' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimTitleIStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceParticipationDescription'
GO


