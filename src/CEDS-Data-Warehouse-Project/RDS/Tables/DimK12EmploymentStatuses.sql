CREATE TABLE [RDS].[DimK12EmploymentStatuses]
(
	[DimK12EmploymentStatusId] int NOT NULL IDENTITY (1, 1),
	[EmploymentStatusCode] 								nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentStatusCode] DEFAULT ('MISSING') NOT NULL,
	[EmploymentStatusDescription] 						nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentStatusDescription] DEFAULT ('MISSING') NOT NULL,
	[EmploymentSeparationReasonCode] 					nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentSeparationReasonCode] DEFAULT ('MISSING') NOT NULL,
	[EmploymentSeparationReasonDescription] 			nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentSeparationReasonDescription] DEFAULT ('MISSING') NOT NULL,
	[EmploymentSeparationTypeCode] 						nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentSeparationTypeCode] DEFAULT ('MISSING') NOT NULL,
	[EmploymentSeparationTypeDescription] 				nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_EmploymentSeparationTypeDescription] DEFAULT ('MISSING') NOT NULL,
	[TitleITargetedAssistanceStaffFundedCode] 			nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_TitleITargetedAssistanceStaffFundedCode] DEFAULT ('MISSING') NOT NULL,
	[TitleITargetedAssistanceStaffFundedDescription] 	nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_TitleITargetedAssistanceStaffFundedDescription] DEFAULT ('MISSING') NOT NULL,
	[MEPPersonnelIndicatorCode] 						nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_MEPPersonnelIndicatorCode] DEFAULT ('MISSING') NOT NULL,
	[MEPPersonnelIndicatorDescription] 					nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_MEPPersonnelIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
	[SalaryForTeachingAssignmentOnlyIndicatorCode] 		nvarchar(50) 	CONSTRAINT [DF_DimK12EmploymentStatuses_SalaryForTeachingAssignmentOnlyIndicatorCode] DEFAULT ('MISSING') NOT NULL,	
	[SalaryForTeachingAssignmentOnlyIndicatorDescription] nvarchar(200) 	CONSTRAINT [DF_DimK12EmploymentStatuses_SalaryForTeachingAssignmentOnlyIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
	CONSTRAINT [PK_DimK12EmploymentStatuses] PRIMARY KEY CLUSTERED ([DimK12EmploymentStatusId] ASC)
)
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason for the termination of the employment relationship.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Separation Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000620' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000620' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason for the termination of the employment relationship.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Separation Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000620' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000620' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A designation of the type of separation occurring between a person and the organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Separation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000621' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000621' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A designation of the type of separation occurring between a person and the organization.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Separation Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000621' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000621' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentSeparationTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The condition under which a person has agreed to serve as an employee.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000347' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000347' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The condition under which a person has agreed to serve as an employee.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000347' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000347' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'EmploymentStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a staff member''s salary is paid by the Title I, Part C Migrant Education Program (MEP) of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Personnel Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000543' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000543' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a staff member''s salary is paid by the Title I, Part C Migrant Education Program (MEP) of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Personnel Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000543' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000543' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'MEPPersonnelIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicator to determine whether the teacher''s base salary includes pay for teaching assignments alone.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Salary for Teaching Assignment Only Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000234' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000234' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicator to determine whether the teacher''s base salary includes pay for teaching assignments alone.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Salary for Teaching Assignment Only Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000234' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000234' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'SalaryForTeachingAssignmentOnlyIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a staff member is targeted assistance (TAS) program staff funded by Title I, Part A, Section 1115 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Targeted Assistance Staff Funded' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a staff member is targeted assistance (TAS) program staff funded by Title I, Part A, Section 1115 of ESEA as amended.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Targeted Assistance Staff Funded' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12EmploymentStatuses', @level2type=N'COLUMN',@level2name=N'TitleITargetedAssistanceStaffFundedDescription';
GO