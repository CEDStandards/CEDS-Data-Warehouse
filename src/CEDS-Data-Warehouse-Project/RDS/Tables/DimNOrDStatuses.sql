CREATE TABLE [RDS].[DimNOrDStatuses] (
    [DimNOrDStatusId]                                INT            IDENTITY (1, 1) NOT NULL,
    [NeglectedOrDelinquentLongTermStatusCode]        NVARCHAR (50)  NULL,
    [NeglectedOrDelinquentLongTermStatusDescription] NVARCHAR (100) NULL,
    [NeglectedOrDelinquentLongTermStatusEdFactsCode] NVARCHAR (50)  NULL,
    [NeglectedOrDelinquentProgramTypeCode]           NVARCHAR (50)  NULL,
    [NeglectedOrDelinquentProgramTypeDescription]    NVARCHAR (100) NULL,
    [NeglectedOrDelinquentProgramTypeEdFactsCode]    NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimNorDStatuses] PRIMARY KEY NONCLUSTERED ([DimNOrDStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusEdFactsCodes]
    ON [RDS].[DimNOrDStatuses]([NeglectedOrDelinquentLongTermStatusEdFactsCode] ASC, [NeglectedOrDelinquentProgramTypeCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_NeglectedOrDelinquentProgramTypeEdFactsCode]
    ON [RDS].[DimNOrDStatuses]([NeglectedOrDelinquentProgramTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_Codes]
    ON [RDS].[DimNOrDStatuses]([NeglectedOrDelinquentLongTermStatusCode] ASC, [NeglectedOrDelinquentProgramTypeCode] ASC) WITH (FILLFACTOR = 80);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected or Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected or Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected or Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedOrDelinquentProgramTypeEdFactsCode';
GO