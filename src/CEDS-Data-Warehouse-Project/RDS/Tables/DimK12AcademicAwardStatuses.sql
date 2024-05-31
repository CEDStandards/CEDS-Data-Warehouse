CREATE TABLE [RDS].[DimK12AcademicAwardStatuses] (
    [DimK12AcademicAwardStatusId]      INT            IDENTITY (1, 1) NOT NULL,
    [HighSchoolDiplomaTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimK12AcademicAwardStatuses_HighSchoolDiplomaTypeCode] DEFAULT ('MISSING') NOT NULL,
    [HighSchoolDiplomaTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimK12AcademicAwardStatuses_HighSchoolDiplomaTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [HighSchoolDiplomaTypeEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimK12AcademicAwardStatuses_HighSchoolDiplomaTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [ProjectedHighSchoolDiplomaTypeCode] NVARCHAR (100) CONSTRAINT [DF_DimK12AcademicAwardStatuses_ProjectedHighSchoolDiplomaTypeCode] DEFAULT ('MISSING') NOT NULL,
    [ProjectedHighSchoolDiplomaTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimK12AcademicAwardStatuses_ProjectedHighSchoolDiplomaTypeDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimK12AcademicAwardStatuses] PRIMARY KEY CLUSTERED ([DimK12AcademicAwardStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of diploma/credential that is awarded to a person in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Diploma Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of diploma/credential that is awarded to a person in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Diploma Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of diploma/credential that is awarded to a person in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'High School Diploma Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21138' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'HighSchoolDiplomaTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of projected diploma/credential a person would be awarded in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Projected High School Diploma Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002026' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002026' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of projected diploma/credential a person would be awarded in recognition of his/her completion of the curricular requirements.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Projected High School Diploma Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002026' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002026' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12AcademicAwardStatuses', @level2type=N'COLUMN',@level2name=N'ProjectedHighSchoolDiplomaTypeDescription';
GO