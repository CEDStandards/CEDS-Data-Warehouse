CREATE TABLE [RDS].[BridgeLeaGradeLevels] (
    [BridgeLeaGradeLevelId] INT IDENTITY (1, 1) NOT NULL,
    [LeaId]                 INT CONSTRAINT [DF_BridgeLeaGradeLevels_LeaId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelId]          INT CONSTRAINT [DF_BridgeLeaGradeLevels_GradeLevelId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeLeaGradeLevels] PRIMARY KEY CLUSTERED ([BridgeLeaGradeLevelId] ASC),
    CONSTRAINT [FK_BridgeLeaGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_BridgeLeaGradeLevels_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeLeaGradeLevels_LeaId]
    ON [RDS].[BridgeLeaGradeLevels]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeLeaGradeLevels_GradeLevelId]
    ON [RDS].[BridgeLeaGradeLevels]([GradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

