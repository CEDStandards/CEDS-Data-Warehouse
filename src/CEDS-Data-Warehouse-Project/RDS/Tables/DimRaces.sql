CREATE TABLE [RDS].[DimRaces] (
    [DimRaceId]       INT            IDENTITY (1, 1) NOT NULL,
    [RaceCode]        NVARCHAR (50)  NULL,
    [RaceDescription] NVARCHAR (200) NULL,
    [RaceEdFactsCode] NVARCHAR (100) NULL,
    CONSTRAINT [PK_DimRaces] PRIMARY KEY CLUSTERED ([DimRaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimRaces_RaceCode]
    ON [RDS].[DimRaces]([RaceCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

