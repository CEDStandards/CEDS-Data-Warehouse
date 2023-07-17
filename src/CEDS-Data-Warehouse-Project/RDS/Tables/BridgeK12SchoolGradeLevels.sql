CREATE TABLE [RDS].[BridgeK12SchoolGradeLevels] (
    [BridgeK12SchoolGradeLevelId] INT IDENTITY (1,1) NOT NULL,
    [K12SchoolId]  INT NOT NULL,
    [GradeLevelId] INT NOT NULL,
    CONSTRAINT [PK_BridgeK12SchoolGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12SchoolGradeLevelId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_BridgeK12SchoolGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_BridgeK12SchoolGradeLevels_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevels_DimK12Schools]
    ON [RDS].[BridgeK12SchoolGradeLevels]([K12SchoolId] ASC) WITH (FILLFACTOR = 80);


GO

