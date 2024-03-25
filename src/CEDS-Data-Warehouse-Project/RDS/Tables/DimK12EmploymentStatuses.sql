CREATE TABLE [RDS].[DimK12EmploymentStatuses]
(
	[DimK12EmploymentStatusId] int NOT NULL IDENTITY (1, 1),
	[EmploymentStatusCode] 								nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentStatusCode] DEFAULT ('MISSING') NOT NULL,
	[EmploymentStatusDescription] 						nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentStatusDescription] DEFAULT ('MISSING') NOT NULL,
	[EmploymentSeparationReasonCode] 					nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentSeparationReasonCode] DEFAULT ('MISSING') NOT NULL,
	[EmploymentSeparationReasonDescription] 			nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentSeparationReasonDescription] DEFAULT ('MISSING') NOT NULL,
	[TitleITargetedAssistanceStaffFundedCode] 			nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_TitleITargetedAssistanceStaffFundedCode] DEFAULT ('MISSING') NOT NULL,
	[TitleITargetedAssistanceStaffFundedDescription] 	nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_TitleITargetedAssistanceStaffFundedDescription] DEFAULT ('MISSING') NOT NULL,
	[MEPPersonnelIndicatorCode] 						nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_MEPPersonnelIndicatorCode] DEFAULT ('MISSING') NOT NULL,
	[MEPPersonnelIndicatorDescription] 					nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_MEPPersonnelIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
	CONSTRAINT [PK_DimK12EmploymentStatuses] PRIMARY KEY CLUSTERED ([DimK12EmploymentStatusId] ASC)
)
GO

