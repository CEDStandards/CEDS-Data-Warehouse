CREATE TABLE [RDS].[DimLanguages] (
    [DimLanguageId]                  INT            IDENTITY (1, 1) NOT NULL,
    [Iso6392LanguageCodeCode]        NVARCHAR (50)  NULL,
    [Iso6392LanguageCodeDescription] NVARCHAR (200) NULL,
    [Iso6392LanguageCodeEdFactsCode] NVARCHAR (50)  NULL,
    [Iso6393LanguageCodeCode]        NVARCHAR (50)  NULL,
    [Iso6393LanguageCodeDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimLanguages] PRIMARY KEY CLUSTERED ([DimLanguageId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The code for the specific language or dialect that a person uses to communicate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'ISO 639-2 Language Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The code for the specific language or dialect that a person uses to communicate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'ISO 639-2 Language Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The code for the specific language or dialect that a person uses to communicate.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'ISO 639-2 Language Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimLanguages', @level2type=N'COLUMN',@level2name=N'Iso6392LanguageCodeEdFactsCode';
GO