CREATE TABLE [RDS].[DimEarlyLearningOrganizations]
(
	[DimEarlyLearningOrganizationId] int NOT NULL IDENTITY (1, 1),
	[StateLicensedFacilityCapacity] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimEarlyLearningOrganizations] 
 ADD CONSTRAINT [PK_DimEarlyLearningOrganizations]
	PRIMARY KEY CLUSTERED ([DimEarlyLearningOrganizationId] ASC)
GO