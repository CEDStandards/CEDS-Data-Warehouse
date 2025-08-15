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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of institution responsible for providing adult education instructional services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Provider Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001078' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001078' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of institution responsible for providing adult education instructional services.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Provider Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001078' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001078' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAdultEducationServiceProviders', @level2type=N'COLUMN',@level2name=N'AdultEducationProviderTypeDescription';
GO