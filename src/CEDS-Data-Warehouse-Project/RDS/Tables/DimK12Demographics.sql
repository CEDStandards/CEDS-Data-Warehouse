CREATE TABLE [RDS].[DimK12Demographics] (
    [DimK12DemographicId] INT            IDENTITY (1, 1) NOT NULL,
    [SexCode]             NVARCHAR (50)  NULL,
    [SexDescription]      NVARCHAR (200) NULL,
    [SexEdFactsCode]      NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimK12Demographics] PRIMARY KEY CLUSTERED ([DimK12DemographicId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12Demographics_SexEdFactsCode]
    ON [RDS].[DimK12Demographics]([SexEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

