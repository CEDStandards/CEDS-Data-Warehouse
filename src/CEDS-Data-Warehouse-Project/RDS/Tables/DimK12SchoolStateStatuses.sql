CREATE TABLE [RDS].[DimK12SchoolStateStatuses] (
    [DimK12SchoolStateStatusId]    INT            IDENTITY (1, 1) NOT NULL,
    [SchoolStateStatusCode]        NVARCHAR (200) CONSTRAINT [DF_DimK12SchoolStateStatuses_SchoolStateStatusCode] DEFAULT ('MISSING') NOT NULL,
    [SchoolStateStatusDescription] NVARCHAR (50)  CONSTRAINT [DF_DimK12SchoolStateStatuses_SchoolStateStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [SchoolStateStatusEdFactsCode] NVARCHAR (50)  CONSTRAINT [DF_DimK12SchoolStateStatuses_SchoolStateStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimK12SchoolStateStatus] PRIMARY KEY CLUSTERED ([DimK12SchoolStateStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12SchoolStateStatuses_SchoolStateStatusCode]
    ON [RDS].[DimK12SchoolStateStatuses]([SchoolStateStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimRaces_SchoolStateStatusCode]
    ON [RDS].[DimK12SchoolStateStatuses]([SchoolStateStatusCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimRaces_SchoolStateStatusEdFactsCode]
    ON [RDS].[DimK12SchoolStateStatuses]([SchoolStateStatusEdFactsCode] ASC);


GO

