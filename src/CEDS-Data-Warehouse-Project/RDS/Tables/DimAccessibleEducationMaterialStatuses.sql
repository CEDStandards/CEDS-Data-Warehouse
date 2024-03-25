CREATE TABLE [RDS].[DimAccessibleEducationMaterialStatuses]
(
	[DimAccessibleEducationMaterialStatusId] int NOT NULL IDENTITY (1, 1),
	[AccessibleFormatIssuedIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatIssuedIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatRequiredIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatRequiredIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimAccessibleEducationMaterialStatuses]	PRIMARY KEY CLUSTERED ([DimAccessibleEducationMaterialStatusId] ASC)
)
GO

