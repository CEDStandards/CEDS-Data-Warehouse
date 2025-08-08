CREATE TABLE [RDS].[DimEarlyChildhoolOrganizationStatuses]
(
	[DimEarlyChildhoodOrganizationStatuses] int NOT NULL IDENTITY (1, 1),
	[EarlyChildhoodProgramEnrollmentTypeCode] nvarchar(50) NOT NULL,
	[EarlyChildhoodProgramEnrollmentTypeDescription] nvarchar(300) NOT NULL,
	[EarlyLearningOtherFederalFundingSourcesCode] nvarchar(50) NOT NULL,
	[EarlyLearningOtherFederalFundingSourcesDescription] nvarchar(300) NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimEarlyChildhoolOrganizationStatuses] 
 ADD CONSTRAINT [PK_DimEarlyChildhoolOrganizationStatuses]
	PRIMARY KEY CLUSTERED ([DimEarlyChildhoodOrganizationStatuses] ASC)
GO