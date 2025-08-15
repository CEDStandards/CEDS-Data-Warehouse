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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyLearningOrganizations', @level2type=N'COLUMN',@level2name=N'StateLicensedFacilityCapacity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The maximum number of children for which a state licensed a facility.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyLearningOrganizations', @level2type=N'COLUMN',@level2name=N'StateLicensedFacilityCapacity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Licensed Facility Capacity' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyLearningOrganizations', @level2type=N'COLUMN',@level2name=N'StateLicensedFacilityCapacity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000865' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyLearningOrganizations', @level2type=N'COLUMN',@level2name=N'StateLicensedFacilityCapacity';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000865' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimEarlyLearningOrganizations', @level2type=N'COLUMN',@level2name=N'StateLicensedFacilityCapacity';
GO