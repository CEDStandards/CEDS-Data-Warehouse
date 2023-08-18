CREATE TABLE [RDS].[DimCohortStatuses] (
    [DimCohortStatusId]       INT           IDENTITY (1, 1) NOT NULL,
    [CohortStatusCode]        VARCHAR (50)  NULL,
    [CohortStatusDescription] VARCHAR (200) NULL,
    [CohortStatusEdFactsCode] VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimCohortStatus] PRIMARY KEY CLUSTERED ([DimCohortStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCohortStatuses_CohortStatusCode]
    ON [RDS].[DimCohortStatuses]([CohortStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

