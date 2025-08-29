CREATE TABLE [RDS].[DimEarlyChildhoolOrganizationStatuses]
(
	[DimEarlyChildhoodOrganizationStatusId] INT           IDENTITY (1, 1) NOT NULL,
	[EarlyChildhoodProgramEnrollmentTypeCode] nvarchar(50) NOT NULL,
	[EarlyChildhoodProgramEnrollmentTypeDescription] nvarchar(300) NOT NULL,
	[EarlyLearningOtherFederalFundingSourcesCode] nvarchar(50) NOT NULL,
	[EarlyLearningOtherFederalFundingSourcesDescription] nvarchar(300) NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimEarlyChildhoolOrganizationStatuses] 
 ADD CONSTRAINT [PK_DimEarlyChildhoolOrganizationStatuses]
	PRIMARY KEY CLUSTERED ([DimEarlyChildhoodOrganizationStatusId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining activities and procedures based on a set of required services and standards in which the child is enrolled.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Early Childhood Program Enrollment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000829' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000829' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining activities and procedures based on a set of required services and standards in which the child is enrolled.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Early Childhood Program Enrollment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000829' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000829' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyChildhoodProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The other contributing funding sources.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Early Learning Other Federal Funding Sources' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001335' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001335' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The other contributing funding sources.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Early Learning Other Federal Funding Sources' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001335' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001335' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyChildhoolOrganizationStatuses', @level2type=N'COLUMN',@level2name=N'EarlyLearningOtherFederalFundingSourcesDescription';
GO