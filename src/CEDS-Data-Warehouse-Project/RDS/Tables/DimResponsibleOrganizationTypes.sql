CREATE TABLE [RDS].[DimResponsibleOrganizationTypes] (
    [DimResponsibleOrganizationTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ResponsibleDistrictTypeCode]        NVARCHAR (50)  NOT NULL,
    [ResponsibleDistrictTypeDescription] NVARCHAR (200) NOT NULL,
    [ResponsibleSchoolTypeCode]          NVARCHAR (50)  NOT NULL,
    [ResponsibleSchoolTypeDescription]   NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimResponsibleOrganizationTypes] PRIMARY KEY CLUSTERED ([DimResponsibleOrganizationTypeId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of responsibility the district has for the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible District Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000594' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21587' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of responsibility the district has for the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible District Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000594' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21587' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleDistrictTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services/instruction the school is responsible for providing to the student.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Responsible School Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000595' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21588' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimResponsibleOrganizationTypes', @level2type=N'COLUMN',@level2name=N'ResponsibleSchoolTypeDescription';
GO