CREATE TABLE [RDS].[DimAlternativeSchoolStatuses]
(
	[DimAlternativeSchoolStatusId] int NOT NULL IDENTITY (1, 1),
	[AlternativeSchoolFocusTypeCode] nvarchar(50) NOT NULL,
	[AlternativeSchoolFocusTypeDescription] nvarchar(1000) NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimAlternativeSchoolStatuses] 
 ADD CONSTRAINT [PK_DimAlternativeSchoolStatuses]
	PRIMARY KEY CLUSTERED ([DimAlternativeSchoolStatusId] ASC)
GO