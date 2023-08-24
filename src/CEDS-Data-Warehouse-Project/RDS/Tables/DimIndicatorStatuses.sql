CREATE TABLE [RDS].[DimIndicatorStatuses] (
    [DimIndicatorStatusId]       INT           IDENTITY (1, 1) NOT NULL,
    [IndicatorStatusId]          INT           NULL,
    [IndicatorStatusCode]        VARCHAR (50)  NULL,
    [IndicatorStatusDescription] VARCHAR (200) NULL,
    [IndicatorStatusEdFactsCode] VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimIndicatorStatus] PRIMARY KEY CLUSTERED ([DimIndicatorStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatuses_IndicatorStatusEdFactsCode]
    ON [RDS].[DimIndicatorStatuses]([IndicatorStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatuses_IndicatorStatusCode]
    ON [RDS].[DimIndicatorStatuses]([IndicatorStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

