CREATE TABLE [RDS].[DimK12JobPositions]
(
	[DimK12JobPositionId] int NOT NULL IDENTITY (1, 1),
	[JobPositionIdentifierSea] nvarchar(40) NULL,
	[JobPositionIdentifierLea] nvarchar(40) NULL,
	[JobPostitionIdentiferSchool] nvarchar(40) NULL,
	[PositionTitle] nvarchar(400) NULL,
	[HourlyWage] [decimal](10, 2) NULL,
	[StaffCompensationBaseSalary] [decimal](10, 2) NULL,
	CONSTRAINT [PK_DimK12JobPositions] PRIMARY KEY CLUSTERED ([DimK12JobPositionId] ASC)
)
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code used to identify a job position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Job Position Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElement', @value=N'Job Position Identification System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElementGlobalId', @value=N'002076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionCode', @value=N'SEA' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/002076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierSea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code used to identify a job position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Job Position Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElement', @value=N'Job Position Identification System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElementGlobalId', @value=N'002076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionCode', @value=N'LEA' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/002076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPositionIdentifierLea';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code used to identify a job position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Job Position Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElement', @value=N'Job Position Identification System' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElementGlobalId', @value=N'002076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionCode', @value=N'School' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_ConcatenatedOptionElementURL', @value=N'https://ceds.ed.gov/element/002076' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'JobPostitionIdentiferSchool';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The descriptive name of a person''s position.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Position Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000213' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000213' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'PositionTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'HourlyWage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Hourly wage associated with the employment position being reported.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'HourlyWage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Hourly Wage' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'HourlyWage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000797' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'HourlyWage';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000797' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'HourlyWage';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'StaffCompensationBaseSalary';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The salary or wage a person is paid before deductions (excluding differentials) but including annuities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'StaffCompensationBaseSalary';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Staff Compensation Base Salary' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'StaffCompensationBaseSalary';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000032' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'StaffCompensationBaseSalary';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000032' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12JobPositions', @level2type=N'COLUMN',@level2name=N'StaffCompensationBaseSalary';
GO