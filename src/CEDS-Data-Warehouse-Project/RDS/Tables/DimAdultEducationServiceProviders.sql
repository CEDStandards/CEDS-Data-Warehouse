CREATE TABLE [RDS].[DimAdultEducationServiceProviders]
(
	[DimAdultEducationServiceProviderId] int NOT NULL IDENTITY (1, 1),
	[AdultEducationServiceProviderIdentifierSea] nvarchar(40) NULL,
	[AdultEducationProviderTypeCode] nvarchar(50) NULL,
	[AdultEducationProviderTypeDescription] nvarchar(200) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimAdultEducationServiceProviders] 
 ADD CONSTRAINT [PK_DimAdultEducationServiceProviders]
	PRIMARY KEY CLUSTERED ([DimAdultEducationServiceProviderId] ASC)
GO