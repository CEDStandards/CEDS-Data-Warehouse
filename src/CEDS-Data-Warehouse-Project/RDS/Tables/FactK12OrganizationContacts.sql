CREATE TABLE [RDS].[FactK12OrganizationContacts]
(
	[FactK12OrganizationContactId] INT NOT NULL IDENTITY (1, 1),
    [SchoolYearId] INT NOT NULL,
    [CountDateId] INT NOT NULL,
	[DataCollectionId] [int] NOT NULL,
    [SeaId] INT NOT NULL,
	[IeuId] INT NOT NULL,
	[LeaID] INT NOT NULL,
	[K12SchoolId] INT NOT NULL,
	[ContactId] BIGINT NOT NULL,
    [ContactPersonAddressId] INT NOT NULL,
    [ContactIndicatorId] INT NOT NULL,
	CONSTRAINT [PK_FactK12OrganizationContacts] PRIMARY KEY CLUSTERED ([FactK12OrganizationContactId] ASC),
    CONSTRAINT [FK_FactK12OrganizationContacts_SchoolYears] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_DataCollections] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_Seas] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_Ieus] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_Leas] FOREIGN KEY ([LeaID]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_Contacts] FOREIGN KEY ([ContactId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_ContactIndicators] FOREIGN KEY ([ContactIndicatorId]) REFERENCES [RDS].[DimContactIndicators] ([DimContactIndicatorId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12OrganizationContacts_ContactPersonAddresses] FOREIGN KEY ([ContactPersonAddressId]) REFERENCES [RDS].[DimPersonAddresses] ([DimPersonAddressId]) ON DELETE No Action ON UPDATE No Action)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_DimDataCollections] 
 ON [RDS].[FactK12OrganizationContacts] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_DimIeus] 
 ON [RDS].[FactK12OrganizationContacts] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_DimK12Schools] 
 ON [RDS].[FactK12OrganizationContacts] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_Contact] 
 ON [RDS].[FactK12OrganizationContacts] ([ContactId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_DimSchoolYears] 
 ON [RDS].[FactK12OrganizationContacts] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_DimSeas] 
 ON [RDS].[FactK12OrganizationContacts] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_Leas] 
 ON [RDS].[FactK12OrganizationContacts] ([LeaID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12OrganizationContacts_ContactIndicators] 
 ON [RDS].[FactK12OrganizationContacts] ([ContactIndicatorId] ASC)
GO


