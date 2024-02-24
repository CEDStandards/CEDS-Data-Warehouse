CREATE TABLE [RDS].[DimK12EmploymentStatuses]
(
	[DimK12EmploymentStatusId] int NOT NULL IDENTITY (1, 1),
	[EmploymentStatusCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[EmploymentStatusDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[EmploymentSeparationReasonCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[EmploymentSeparationReasonDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[TitleITargetedAssistanceStaffFundedCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[TitleITargetedAssistanceStaffFundedDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	[MEPPersonnelIndicatorCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[MEPPersonnelIndicatorDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimK12EmploymentStatuses] PRIMARY KEY CLUSTERED ([DimK12EmploymentStatusId] ASC)
)
GO

