CREATE TABLE [RDS].[DimCohortStatuses] (
    [DimCohortStatusId]       INT           IDENTITY (1, 1) NOT NULL,
    [CohortStatusCode]        VARCHAR (50)  CONSTRAINT [DF_DimCohortStatuses_CohortStatusCode] DEFAULT ('MISSING') NOT NULL,
    [CohortStatusDescription] VARCHAR (200) CONSTRAINT [DF_DimCohortStatuses_CohortStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [CohortStatusEdFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimCohortStatuses_CohortStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimCohortStatus] PRIMARY KEY CLUSTERED ([DimCohortStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCohortStatuses_CohortStatusCode]
    ON [RDS].[DimCohortStatuses]([CohortStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

