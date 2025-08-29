CREATE TABLE [RDS].[DimGradeLevels] (
    [DimGradeLevelId]       INT            IDENTITY (1, 1) NOT NULL,
    [GradeLevelCode]        NVARCHAR (50)  CONSTRAINT [DF_DimGradeLevels_GradeLevelCode] DEFAULT ('MISSING') NOT NULL,
    [GradeLevelDescription] NVARCHAR (200) CONSTRAINT [DF_DimGradeLevels_GradeLevelDescription] DEFAULT ('MISSING') NOT NULL,
    [GradeLevelEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimGradeLevels_GradeLevelEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimGradeLevels] PRIMARY KEY CLUSTERED ([DimGradeLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimGradeLevels_GradeLevelEdFactsCode]
    ON [RDS].[DimGradeLevels]([GradeLevelEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimGradeLevels_GradeLevelCode]
    ON [RDS].[DimGradeLevels]([GradeLevelCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

