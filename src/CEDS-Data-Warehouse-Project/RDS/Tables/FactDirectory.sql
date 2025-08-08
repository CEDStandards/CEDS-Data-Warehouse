CREATE TABLE [RDS].[FactDirectory]
(
	[FactDirectoryId] int NOT NULL IDENTITY (1, 1),
	[LeaId] int NULL,
	[OrganizationId] int NULL,
	[SeaId] int NULL,
	[PsInstitutionID] int NULL,
	[IeuId] int NULL,
	[K12SchoolId] int NULL,
	[AdultEducationServiceProviderId] int NULL,
	[ComprehensiveAndTargetedSupportI] int NULL,
	[NOrDStatusId] int NULL,
	[CharterSchoolManagementOrganizationId] int NULL,
	[CharterSchoolStatusId] int NULL,
	[CharterSchoolAuthorizerId] int NULL,
	[AlternativeSchoolStatusId] int NULL,
	[K12SchoolStatusId] int NULL,
	[EarlyChildhoodOrganizationStatusId] int NULL,
	[EarlyLearningOrganizationId] int NULL,
	[DataCollectionId] int NULL,
	[SchoolYearId] int NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[FactDirectory] 
 ADD CONSTRAINT [PK_FactDirectory]
	PRIMARY KEY CLUSTERED ([FactDirectoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimAdultEducationServiceProviders] 
 ON [RDS].[FactDirectory] ([AdultEducationServiceProviderId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimAlternativeSchoolStatuses] 
 ON [RDS].[FactDirectory] ([AlternativeSchoolStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimCharterSchoolAuthorizers] 
 ON [RDS].[FactDirectory] ([CharterSchoolAuthorizerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimCharterSchoolManagementOrganizations] 
 ON [RDS].[FactDirectory] ([CharterSchoolManagementOrganizationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimCharterSchoolStatuses] 
 ON [RDS].[FactDirectory] ([CharterSchoolStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimComprehensiveAndTargetedSupports] 
 ON [RDS].[FactDirectory] ([ComprehensiveAndTargetedSupportI] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimDataCollections] 
 ON [RDS].[FactDirectory] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimEarlyLearningOrganizations] 
 ON [RDS].[FactDirectory] ([EarlyLearningOrganizationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimIeus] 
 ON [RDS].[FactDirectory] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimK12Schools] 
 ON [RDS].[FactDirectory] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimK12SchoolStatuses] 
 ON [RDS].[FactDirectory] ([K12SchoolStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimLeas] 
 ON [RDS].[FactDirectory] ([LeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimNOrDStatuses] 
 ON [RDS].[FactDirectory] ([NOrDStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimOrganizations] 
 ON [RDS].[FactDirectory] ([OrganizationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimPsInstitutions] 
 ON [RDS].[FactDirectory] ([PsInstitutionID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimSchoolYears] 
 ON [RDS].[FactDirectory] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimSeas] 
 ON [RDS].[FactDirectory] ([SeaId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirctory_DimAdultEducationServiceProviderId]
	FOREIGN KEY ([AdultEducationServiceProviderId]) REFERENCES [RDS].[DimAdultEducationServiceProviders] ([DimAdultEducationServiceProviderId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_AlternativeSchoolStatusId]
	FOREIGN KEY ([AlternativeSchoolStatusId]) REFERENCES [RDS].[DimAlternativeSchoolStatuses] ([DimAlternativeSchoolStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_CharterSchoolAuthorizerId ]
	FOREIGN KEY ([CharterSchoolAuthorizerId]) REFERENCES [RDS].[DimCharterSchoolAuthorizers] ([DimCharterSchoolAuthorizerId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_CharterSchoolManagementOrganizationId]
	FOREIGN KEY ([CharterSchoolManagementOrganizationId]) REFERENCES [RDS].[DimCharterSchoolManagementOrganizations] ([DimCharterSchoolManagementOrganizationId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_CharterSchoolStatusId ]
	FOREIGN KEY ([CharterSchoolStatusId]) REFERENCES [RDS].[DimCharterSchoolStatuses] ([DimCharterSchoolStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_ComprehensiveAndTargetedSupportId]
	FOREIGN KEY ([ComprehensiveAndTargetedSupportI]) REFERENCES [RDS].[DimComprehensiveAndTargetedSupports] ([DimComprehensiveAndTargetedSupportId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_DataCollectionId]
	FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_DimNOrDStatuses]
	FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_EarlyChildhoodOrganizationStatusId]
	FOREIGN KEY ([EarlyChildhoodOrganizationStatusId]) REFERENCES [RDS].[DimEarlyChildhoolOrganizationStatuses] ([DimEarlyChildhoodOrganizationStatuses]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_EarlyLearningOrganizationId]
	FOREIGN KEY ([EarlyLearningOrganizationId]) REFERENCES [RDS].[DimEarlyLearningOrganizations] ([DimEarlyLearningOrganizationId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_IeuId]
	FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_K12SchoolId]
	FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_K12SchoolStatusId]
	FOREIGN KEY ([K12SchoolStatusId]) REFERENCES [RDS].[DimK12SchoolStatuses] ([DimK12SchoolStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_LeaId]
	FOREIGN KEY ([LeaId]) REFERENCES  [RDS].[DimLeas] ([DimLeaId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_OrganizationId]
	FOREIGN KEY ([OrganizationId]) REFERENCES [RDS].[DimOrganizations] ([DimOrganizationId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_PsInstitutionId]
	FOREIGN KEY ([PsInstitutionID]) REFERENCES [RDS].[DimPsInstitutions] ([DimPsInstitutionId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_SchoolYearId]
	FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_SeaId]
	FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action
GO