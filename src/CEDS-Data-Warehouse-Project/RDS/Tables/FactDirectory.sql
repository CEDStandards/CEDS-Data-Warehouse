CREATE TABLE [RDS].[FactDirectory]
(
	[FactDirectoryId] int NOT NULL IDENTITY (1, 1),
	[LeaId] int NOT NULL CONSTRAINT [DF_FactDirectory_LeaId] DEFAULT ((-1)),
	[OrganizationId] int NOT NULL CONSTRAINT [DF_FactDirectory_OrganizationId] DEFAULT ((-1)),
	[SeaId] int NOT NULL CONSTRAINT [DF_FactDirectory_SeaId] DEFAULT ((-1)),
	[PsInstitutionID] int NOT NULL CONSTRAINT [DF_FactDirectory_PsInstitutionID] DEFAULT ((-1)),
	[IeuId] int NOT NULL CONSTRAINT [DF_FactDirectory_IeuId] DEFAULT ((-1)),
	[K12SchoolId] int NOT NULL CONSTRAINT [DF_FactDirectory_K12SchoolId] DEFAULT ((-1)),
	[AeProviderId] int NOT NULL CONSTRAINT [DF_FactDirectory_AeProviderId] DEFAULT ((-1)),
	[ComprehensiveAndTargetedSupportId] int NOT NULL CONSTRAINT [DF_FactDirectory_ComprehensiveAndTargetedSupportId] DEFAULT ((-1)),
	[NOrDStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_NOrDStatusId] DEFAULT ((-1)),
	[CharterSchoolManagementOrganizationId] int NOT NULL CONSTRAINT [DF_FactDirectory_CharterSchoolManagementOrganizationId] DEFAULT ((-1)),
	[CharterSchoolStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_CharterSchoolStatusId] DEFAULT ((-1)),
	[CharterSchoolAuthorizerId] int NOT NULL CONSTRAINT [DF_FactDirectory_CharterSchoolAuthorizerId] DEFAULT ((-1)),
	[AlternativeSchoolStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_AlternativeSchoolStatusId] DEFAULT ((-1)),
	[K12SchoolStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_K12SchoolStatusId] DEFAULT ((-1)),
	[EarlyChildhoodOrganizationStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_EarlyChildhoodOrganizationStatusId] DEFAULT ((-1)),
	[EarlyLearningOrganizationId] int NOT NULL CONSTRAINT [DF_FactDirectory_EarlyLearningOrganizationId] DEFAULT ((-1)),
	[DataCollectionId] int NOT NULL CONSTRAINT [DF_FactDirectory_DataCollectionId] DEFAULT ((-1)),
	[SchoolYearId] int NOT NULL CONSTRAINT [DF_FactDirectory_SchoolYearId] DEFAULT ((-1)),
	[OrganizationTitleIStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_OrganizationTitleIStatusId] DEFAULT ((-1)),
	[PsInstitutionStatusId] int NOT NULL CONSTRAINT [DF_FactDirectory_PsInstitutionStatusId] DEFAULT ((-1))
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[FactDirectory] 
 ADD CONSTRAINT [PK_FactDirectory]
	PRIMARY KEY CLUSTERED ([FactDirectoryId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimAeProviders] 
 ON [RDS].[FactDirectory] ([AeProviderId] ASC)
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
 ON [RDS].[FactDirectory] ([ComprehensiveAndTargetedSupportId] ASC)
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

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimOrganizationTitleIStatuses]
 ON [RDS].[FactDirectory] ([OrganizationTitleIStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimPsInstitutionStatuses]
 ON [RDS].[FactDirectory] ([PsInstitutionStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimSchoolYears] 
 ON [RDS].[FactDirectory] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactDirectory_DimSeas] 
 ON [RDS].[FactDirectory] ([SeaId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_DimAeProviderId]
	FOREIGN KEY ([AeProviderId]) REFERENCES [RDS].[DimAeProviders] ([DimAeProviderId]) ON DELETE No Action ON UPDATE No Action
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
	FOREIGN KEY ([ComprehensiveAndTargetedSupportId]) REFERENCES [RDS].[DimComprehensiveAndTargetedSupports] ([DimComprehensiveAndTargetedSupportId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_DataCollectionId]
	FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_DimNOrDStatuses]
	FOREIGN KEY ([NOrDStatusId]) REFERENCES [RDS].[DimNOrDStatuses] ([DimNOrDStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_EarlyChildhoodOrganizationStatusId]
	FOREIGN KEY ([EarlyChildhoodOrganizationStatusId]) REFERENCES [RDS].[DimEarlyChildhoodOrganizationStatuses] ([DimEarlyChildhoodOrganizationStatusId]) ON DELETE No Action ON UPDATE No Action
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

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_OrganizationTitleIStatusId]
	FOREIGN KEY ([OrganizationTitleIStatusId]) REFERENCES [RDS].[DimOrganizationTitleIStatuses] ([DimOrganizationTitleIStatusId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [RDS].[FactDirectory] ADD CONSTRAINT [FK_FactDirectory_PsInstitutionStatusId]
	FOREIGN KEY ([PsInstitutionStatusId]) REFERENCES [RDS].[DimPsInstitutionStatuses] ([DimPsInstitutionStatusId]) ON DELETE No Action ON UPDATE No Action
GO