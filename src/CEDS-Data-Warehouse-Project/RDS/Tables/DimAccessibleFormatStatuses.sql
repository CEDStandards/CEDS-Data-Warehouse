CREATE TABLE [RDS].[DimAccessibleFormatStatuses]
(
	[DimAccessibleFormatStatusId] int NOT NULL IDENTITY (1, 1),
	[AccessibleFormatRequiredIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatRequiredIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatTypeCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[AccessibleFormatTypeDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimAccessibleFormatStatuses]	PRIMARY KEY CLUSTERED ([DimAccessibleFormatStatusId] ASC)	
)
GO