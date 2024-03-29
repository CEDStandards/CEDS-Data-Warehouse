CREATE TABLE [RDS].[DimNOrDStatuses] (
    [DimNOrDStatusId]                                INT            IDENTITY (1, 1) NOT NULL,
    [NeglectedOrDelinquentLongTermStatusCode]        NVARCHAR (50)  CONSTRAINT [DF_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusCode] DEFAULT ('MISSING') NOT NULL,
    [NeglectedOrDelinquentLongTermStatusDescription] NVARCHAR (100) CONSTRAINT [DF_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [NeglectedOrDelinquentLongTermStatusEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [NeglectedProgramTypeCode]           NVARCHAR (50)  CONSTRAINT [DF_DimNOrDStatuses_NeglectedProgramTypeCode] DEFAULT ('MISSING') NOT NULL,
    [NeglectedProgramTypeDescription]    NVARCHAR (100) CONSTRAINT [DF_DimNOrDStatuses_NeglectedProgramTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [NeglectedProgramTypeEdFactsCode]    NVARCHAR (50)  CONSTRAINT [DF_DimNOrDStatuses_NeglectedProgramTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [DelinquentProgramTypeCode]           NVARCHAR (50)  CONSTRAINT [DF_DimNOrDStatuses_DelinquentProgramTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DelinquentProgramTypeDescription]    NVARCHAR (100) CONSTRAINT [DF_DimNOrDStatuses_DelinquentProgramTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [DelinquentProgramTypeEdFactsCode]    NVARCHAR (50)  CONSTRAINT [DF_DimNOrDStatuses_DelinquentProgramTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimNorDStatuses] PRIMARY KEY NONCLUSTERED ([DimNOrDStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusEdFactsCodes]
    ON [RDS].[DimNOrDStatuses]([NeglectedOrDelinquentLongTermStatusEdFactsCode] ASC, [NeglectedProgramTypeEdFactsCode] ASC, [DelinquentProgramTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_NeglectedProgramTypeEdFactsCode]
    ON [RDS].[DimNOrDStatuses]([NeglectedProgramTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_DelinquentProgramTypeEdFactsCode]
    ON [RDS].[DimNOrDStatuses]([DelinquentProgramTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimNOrDStatuses_Codes]
    ON [RDS].[DimNOrDStatuses]([NeglectedOrDelinquentLongTermStatusCode] ASC, [NeglectedProgramTypeCode] ASC, [DelinquentProgramTypeCode] ASC) WITH (FILLFACTOR = 80);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Neglected Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'NeglectedProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of program under ESEA Title I, Part D, Subpart 1 (state programs) or Subpart 2 (LEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Delinquent Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21194' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimNOrDStatuses', @level2type=N'COLUMN',@level2name=N'DelinquentProgramTypeEdFactsCode';
GO