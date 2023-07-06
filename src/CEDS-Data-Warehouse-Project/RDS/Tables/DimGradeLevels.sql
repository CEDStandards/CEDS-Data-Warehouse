CREATE TABLE [RDS].[DimGradeLevels] (
    [DimGradeLevelId]       INT            IDENTITY (1, 1) NOT NULL,
    [GradeLevelCode]        NVARCHAR (50)  NULL,
    [GradeLevelDescription] NVARCHAR (200) NULL,
    [GradeLevelEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimGradeLevels] PRIMARY KEY CLUSTERED ([DimGradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimGradeLevels_GradeLevelEdFactsCode]
    ON [RDS].[DimGradeLevels]([GradeLevelEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimGradeLevels_GradeLevelCode]
    ON [RDS].[DimGradeLevels]([GradeLevelCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

