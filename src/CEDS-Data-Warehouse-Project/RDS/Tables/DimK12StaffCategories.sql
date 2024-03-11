CREATE TABLE [RDS].[DimK12StaffCategories] (
    [DimK12StaffCategoryId]                                 INT            IDENTITY (1, 1) NOT NULL,
    [K12StaffClassificationCode]                            NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_K12StaffClassificationCode] DEFAULT ('MISSING') NOT NULL,
    [K12StaffClassificationDescription]                     NVARCHAR (100) CONSTRAINT [DF_DimK12StaffCategories_K12StaffClassificationDescription] DEFAULT ('MISSING') NOT NULL,
    [K12StaffClassificationEdFactsCode]                     NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_K12StaffClassificationEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationSupportServicesCategoryCode]           NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_SpecialEducationSupportServicesCategoryCode] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationSupportServicesCategoryDescription]    NVARCHAR (200) CONSTRAINT [DF_DimK12StaffCategories_SpecialEducationSupportServicesCategoryDescription] DEFAULT ('MISSING') NOT NULL,
    [SpecialEducationSupportServicesCategoryEdFactsCode]    NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_SpecialEducationSupportServicesCategoryEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [TitleIProgramStaffCategoryCode]                        NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_TitleIProgramStaffCategoryCode] DEFAULT ('MISSING') NOT NULL,
    [TitleIProgramStaffCategoryDescription]                 NVARCHAR (100) CONSTRAINT [DF_DimK12StaffCategories_TitleIProgramStaffCategoryDescription] DEFAULT ('MISSING') NOT NULL,
    [TitleIProgramStaffCategoryEdFactsCode]                 NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_TitleIProgramStaffCategoryEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [MigrantEducationProgramStaffCategoryCode]              NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_MigrantEducationProgramStaffCategoryCode] DEFAULT 'MISSING' NOT NULL,
    [MigrantEducationProgramStaffCategoryDescription]       NVARCHAR (200) CONSTRAINT [DF_DimK12StaffCategories_MigrantEducationProgramStaffCategoryDescription] DEFAULT 'MISSING' NOT NULL,
    [ProfessionalEducationalJobClassificationCode]          NVARCHAR (50)  CONSTRAINT [DF_DimK12StaffCategories_ProfessionalEducationalJobClassificationCode] DEFAULT 'MISSING' NOT NULL,
    [ProfessionalEducationalJobClassificationDescription]   NVARCHAR (200) CONSTRAINT [DF_DimK12StaffCategories_ProfessionalEducationalJobClassificationDescription] DEFAULT 'MISSING' NOT NULL,
    CONSTRAINT [PK_DimK12StaffCategories] PRIMARY KEY CLUSTERED ([DimK12StaffCategoryId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_Codes]
    ON [RDS].[DimK12StaffCategories]([K12StaffClassificationCode] ASC, [SpecialEducationSupportServicesCategoryCode] ASC, [TitleIProgramStaffCategoryCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_TitleIProgramStaffCategoryEdFactsCode]
    ON [RDS].[DimK12StaffCategories]([TitleIProgramStaffCategoryEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_SpecialEducationSupportServicesCategoryEdFactsCode]
    ON [RDS].[DimK12StaffCategories]([SpecialEducationSupportServicesCategoryEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12StaffCategories_K12StaffClassificationEdFactsCode]
    ON [RDS].[DimK12StaffCategories]([K12StaffClassificationEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The titles of employment, official status, or rank of education staff.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'K12 Staff Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The titles of employment, official status, or rank of education staff.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'K12 Staff Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The titles of employment, official status, or rank of education staff.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'K12 Staff Classification' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21087' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'K12StaffClassificationEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of personnel employed and contracted to provide special education and related services for children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Support Services Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000558' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21549' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of personnel employed and contracted to provide special education and related services for children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Support Services Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000558' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21549' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of personnel employed and contracted to provide special education and related services for children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Special Education Support Services Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000558' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21549' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'SpecialEducationSupportServicesCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of employment, official status, or rank for staff working in a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Staff Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of employment, official status, or rank for staff working in a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Staff Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Titles of employment, official status, or rank for staff working in a Title I program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Title I Program Staff Category' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21283' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12StaffCategories', @level2type=N'COLUMN',@level2name=N'TitleIProgramStaffCategoryEdFactsCode';
GO