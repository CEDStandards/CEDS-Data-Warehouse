CREATE TABLE [RDS].[DimK12StaffCategories] (
    [DimK12StaffCategoryId]                              INT            IDENTITY (1, 1) NOT NULL,
    [K12StaffClassificationCode]                         NVARCHAR (50)  NULL,
    [K12StaffClassificationDescription]                  NVARCHAR (100) NULL,
    [K12StaffClassificationEdFactsCode]                  NVARCHAR (50)  NULL,
    [SpecialEducationSupportServicesCategoryCode]        NVARCHAR (50)  NULL,
    [SpecialEducationSupportServicesCategoryDescription] NVARCHAR (200) NULL,
    [SpecialEducationSupportServicesCategoryEdFactsCode] NVARCHAR (50)  NULL,
    [TitleIProgramStaffCategoryCode]                     NVARCHAR (50)  NULL,
    [TitleIProgramStaffCategoryDescription]              NVARCHAR (100) NULL,
    [TitleIProgramStaffCategoryEdFactsCode]              NVARCHAR (50)  NULL,
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

