CREATE TABLE [RDS].[DimFactTypes] (
    [DimFactTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [FactTypeCode]        NVARCHAR (100) NOT NULL,
    [FactTypeDescription] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_DimFactTypes] PRIMARY KEY CLUSTERED ([DimFactTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimFactTypes_FactTypeCode]
    ON [RDS].[DimFactTypes]([FactTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

