CREATE TABLE [RDS].[DimFacilityStatuses]
(
	[DimFacilityStatusId] int NOT NULL IDENTITY (1, 1),
	[FacilityLeaseAmountCategoryCode] nvarchar(50) NULL,
	[FacilityLeaseAmountCategoryDescription] nvarchar(200) NULL,
	[FacilityLeaseTypeCode] nvarchar(50) NULL,
	[FacilityLeaseTypeDescription] nvarchar(200) NULL,
	[FacilityMortgageInterestTypeCode] nvarchar(50) NULL,
	[FacilityMortgageInterestTypeDescription] nvarchar(200) NULL,
	[FacilityMortgageTypeCode] nvarchar(50) NULL,
	[FacilityMortgageTypeDescription] nvarchar(200) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimFacilityStatuses] 
 ADD CONSTRAINT [PK_DimFacilityStatuses]
	PRIMARY KEY CLUSTERED ([DimFacilityStatusId] ASC)
GO