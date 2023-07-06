CREATE TABLE [RDS].[BridgeK12SchoolGradeLevels] (
    [K12SchoolId]  INT NOT NULL,
    [GradeLevelId] INT NOT NULL,
    CONSTRAINT [PK_BridgeK12SchoolGradeLevels] PRIMARY KEY CLUSTERED ([K12SchoolId] ASC, [GradeLevelId] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgeK12SchoolGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_BridgeK12SchoolGradeLevels_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevels_DimK12Schools]
    ON [RDS].[BridgeK12SchoolGradeLevels]([K12SchoolId] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

