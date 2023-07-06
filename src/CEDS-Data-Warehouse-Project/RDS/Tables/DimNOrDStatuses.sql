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

