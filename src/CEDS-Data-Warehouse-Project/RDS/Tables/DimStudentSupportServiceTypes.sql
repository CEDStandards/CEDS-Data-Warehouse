CREATE TABLE [RDS].[DimStudentSupportServiceTypes]
(
	[DimStudentSupportServiceTypeId] int NOT NULL IDENTITY (1, 1),
	[StudentSupportServiceTypeCode] nvarchar(50) NULL,
	[StudentSupportServiceTypeDescription] nvarchar(200) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [RDS].[DimStudentSupportServiceTypes] 
 ADD CONSTRAINT [PK_DimStudentSupportServiceTypes]
	PRIMARY KEY CLUSTERED ([DimStudentSupportServiceTypeId] ASC)
GO
