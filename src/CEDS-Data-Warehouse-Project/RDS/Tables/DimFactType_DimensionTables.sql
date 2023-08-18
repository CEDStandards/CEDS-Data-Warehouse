CREATE TABLE [RDS].[DimFactType_DimensionTables] (
    [DimFactTypeId]    INT NOT NULL,
    [DimensionTableId] INT NOT NULL,
    CONSTRAINT [PK_DimFactType_DimensionTables] PRIMARY KEY CLUSTERED ([DimFactTypeId] ASC, [DimensionTableId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_DimFactType_DimensionTables_DimFactTypes_DimFactTypeId] FOREIGN KEY ([DimFactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]) ON DELETE CASCADE
);


GO

