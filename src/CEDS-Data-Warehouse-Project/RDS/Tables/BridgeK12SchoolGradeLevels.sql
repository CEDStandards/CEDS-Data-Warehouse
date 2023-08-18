CREATE TABLE [RDS].[BridgeK12SchoolGradeLevels] (
    [BridgeK12SchoolGradeLevelId] INT IDENTITY (1,1) NOT NULL,
    [K12SchoolId]  INT CONSTRAINT [DF_BridgeK12SchoolGradeLevels_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelId] INT CONSTRAINT [DF_BridgeK12SchoolGradeLevels_GradeLevelId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12SchoolGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12SchoolGradeLevelId] ASC),
    CONSTRAINT [FK_BridgeK12SchoolGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_BridgeK12SchoolGradeLevels_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
);
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevels_DimK12Schools]
    ON [RDS].[BridgeK12SchoolGradeLevels]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12SchoolGradeLevels_GradeLevelId]
    ON [RDS].[BridgeK12SchoolGradeLevels]([GradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
