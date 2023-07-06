CREATE TABLE [RDS].[DimAges] (
    [DimAgeId]       INT            IDENTITY (1, 1) NOT NULL,
    [AgeCode]        NVARCHAR (50)  NULL,
    [AgeDescription] NVARCHAR (200) NULL,
    [AgeEdFactsCode] NVARCHAR (50)  NULL,
    [AgeValue]       INT            NOT NULL,
    CONSTRAINT [PK_DimAges] PRIMARY KEY CLUSTERED ([DimAgeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAges_AgeCode]
    ON [RDS].[DimAges]([AgeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimAges_AgeValue]
    ON [RDS].[DimAges]([AgeValue] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

