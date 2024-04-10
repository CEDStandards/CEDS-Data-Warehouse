CREATE TABLE [RDS].[FactK12ParentOrGuardians]
(
	[FactK12ParentOrGuardianId] INT NOT NULL IDENTITY (1, 1),
    [SchoolYearId] INT NOT NULL,
    [CountDateId] INT NOT NULL,
	[DataCollectionId] [int] NOT NULL,
    [SeaId] INT NOT NULL,
	[IeuId] INT NOT NULL,
	[LeaID] INT NOT NULL,
	[K12SchoolId] INT NOT NULL,
	[K12StudentId] BIGINT NOT NULL,
	[ParentOrGuardianId] BIGINT NOT NULL,
    [ParentOrGuardianPersonAddressId] INT NOT NULL,
    [PersonRelationshipToLearnerContactInformationId] INT NOT NULL,
    [ContactIndicatorId] INT NOT NULL,
    [PersonRelationshipId] INT NOT NULL,
    [ParentOrGuardianIndicatorId] INT NOT NULL,
	CONSTRAINT [PK_FactK12ParentOrGuardians] PRIMARY KEY CLUSTERED ([FactK12ParentOrGuardianId] ASC),
    CONSTRAINT [FK_FactK12ParentOrGuardians_SchoolYears] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_DataCollections] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_Seas] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_Ieus] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_Leas] FOREIGN KEY ([LeaID]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_K12Schools] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_K12Students] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactK12ParentOrGuardians_ParentOrGuardians] FOREIGN KEY ([ParentOrGuardianId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_PersonRelationshipToLearnerContactInformation] FOREIGN KEY ([PersonRelationshipToLearnerContactInformationId]) REFERENCES [RDS].[DimPersonRelationshipToLearnerContactInformation] ([DimPersonRelationshipToLearnerContactInformationId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_ContactIndicators] FOREIGN KEY ([ContactIndicatorId]) REFERENCES [RDS].[DimContactIndicators] ([DimContactIndicatorId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_PersonRelationships] FOREIGN KEY ([PersonRelationshipId]) REFERENCES [RDS].[DimPersonRelationships] ([DimPersonRelationshipId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_PersonOrGuardianPersonAddress] FOREIGN KEY ([ParentOrGuardianPersonAddressId]) REFERENCES [RDS].[DimPersonAddresses] ([DimPersonAddressId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12ParentOrGuardians_ParentOrGuardianIndicators] FOREIGN KEY ([ParentOrGuardianIndicatorId]) REFERENCES [RDS].[DimParentOrGuardianIndicators] ([DimParentOrGuardianIndicatorId]) ON DELETE No Action ON UPDATE No Action)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_DimDataCollections] 
 ON [RDS].[FactK12ParentOrGuardians] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_DimIeus] 
 ON [RDS].[FactK12ParentOrGuardians] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_DimK12Schools] 
 ON [RDS].[FactK12ParentOrGuardians] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_K12Student] 
 ON [RDS].[FactK12ParentOrGuardians] ([K12StudentId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_ParentOrGuardian] 
 ON [RDS].[FactK12ParentOrGuardians] ([ParentOrGuardianId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_DimSchoolYears] 
 ON [RDS].[FactK12ParentOrGuardians] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_DimSeas] 
 ON [RDS].[FactK12ParentOrGuardians] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_Leas] 
 ON [RDS].[FactK12ParentOrGuardians] ([LeaID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_PersonRelationshipToLearnerContactInformation] 
 ON [RDS].[FactK12ParentOrGuardians] ([PersonRelationshipToLearnerContactInformationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_ContactIndicators] 
 ON [RDS].[FactK12ParentOrGuardians] ([ContactIndicatorId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_PersonRelationships] 
 ON [RDS].[FactK12ParentOrGuardians] ([PersonRelationshipId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12ParentOrGuardians_ParentOrGuardianIndicators] 
 ON [RDS].[FactK12ParentOrGuardians] ([ParentOrGuardianIndicatorId] ASC)
GO

