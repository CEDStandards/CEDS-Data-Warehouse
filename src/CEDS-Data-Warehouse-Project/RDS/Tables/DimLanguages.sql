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

