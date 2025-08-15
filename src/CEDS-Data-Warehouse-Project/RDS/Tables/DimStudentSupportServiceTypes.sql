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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of related or ancillary services offered or provided to a person or a group of persons within the formal educational system or by an outside agency which provides non-instructional services to support the general welfare of students. This includes physical and emotional health, the ability to select an appropriate course of study, admission to appropriate educational programs, and the ability to adjust to and remain in school through the completion of programs. In serving a student with an identified disability, related services include developmental, corrective, or supportive services required to ensure that the person benefits from special education.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Support Service Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Type of related or ancillary services offered or provided to a person or a group of persons within the formal educational system or by an outside agency which provides non-instructional services to support the general welfare of students. This includes physical and emotional health, the ability to select an appropriate course of study, admission to appropriate educational programs, and the ability to adjust to and remain in school through the completion of programs. In serving a student with an identified disability, related services include developmental, corrective, or supportive services required to ensure that the person benefits from special education.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Support Service Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimStudentSupportServiceTypes', @level2type=N'COLUMN',@level2name=N'StudentSupportServiceTypeDescription';
GO