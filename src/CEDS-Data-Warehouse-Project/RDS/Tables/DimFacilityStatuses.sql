CREATE TABLE [RDS].[DimFacilityStatuses]
(
	[DimFacilityStatusId] int NOT NULL IDENTITY (1, 1),
	[FacilityLeaseAmountCategoryCode] nvarchar(50) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseAmountCategoryCode] DEFAULT ('MISSING'),
	[FacilityLeaseAmountCategoryDescription] nvarchar(200) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseAmountCategoryDescription] DEFAULT ('MISSING'),
	[FacilityLeaseTypeCode] nvarchar(50) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseTypeCode] DEFAULT ('MISSING'),
	[FacilityLeaseTypeDescription] nvarchar(200) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityLeaseTypeDescription] DEFAULT ('MISSING'),
	[FacilityMortgageInterestTypeCode] nvarchar(50) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageInterestTypeCode] DEFAULT ('MISSING'),
	[FacilityMortgageInterestTypeDescription] nvarchar(200) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageInterestTypeDescription] DEFAULT ('MISSING'),
	[FacilityMortgageTypeCode] nvarchar(50) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageTypeCode] DEFAULT ('MISSING'),
	[FacilityMortgageTypeDescription] nvarchar(200) NULL CONSTRAINT [DF_DimFacilityStatuses_FacilityMortgageTypeDescription] DEFAULT ('MISSING'),
	[FacilityOwnershipIndicatorCode] nvarchar(50) NULL,
	[FacilityOwnershipIndicatorDescription] nvarchar(200) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilityStatuses] 
 ADD CONSTRAINT [PK_DimFacilityStatuses]
	PRIMARY KEY CLUSTERED ([DimFacilityStatusId] ASC)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of payment that a school must pay to rent the facility that it is in.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Lease Amount Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001888' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001888' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of payment that a school must pay to rent the facility that it is in.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Lease Amount Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001888' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001888' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseAmountCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of agreement that allows the use and possession of a school, building, or other facility from a third party in return for a regularly scheduled installment payment over an agreed-upon period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Lease Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001889' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001889' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of agreement that allows the use and possession of a school, building, or other facility from a third party in return for a regularly scheduled installment payment over an agreed-upon period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Lease Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001889' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001889' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityLeaseTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of interest paid on a mortgage to the lender to compensate the lender for the use of money to purchase a building or facility.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Mortgage Interest Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001891' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001891' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of interest paid on a mortgage to the lender to compensate the lender for the use of money to purchase a building or facility.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Mortgage Interest Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001891' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001891' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageInterestTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of a mortgage as it relates to priority of payment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Mortgage Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001892' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001892' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The status of a mortgage as it relates to priority of payment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Mortgage Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001892' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001892' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityMortgageTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates the public or private entity holds legal title to the building and/or site.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Ownership Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates the public or private entity holds legal title to the building and/or site.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Facility Ownership Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001906' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimFacilityStatuses', @level2type=N'COLUMN',@level2name=N'FacilityOwnershipIndicatorDescription';
GO