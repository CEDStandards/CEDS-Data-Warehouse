CREATE TABLE [RDS].[DimIndicatorStatuses] (
    [DimIndicatorStatusId]       INT           IDENTITY (1, 1) NOT NULL,
    [IndicatorStatusCode]        VARCHAR (50)  CONSTRAINT [DF_DimIndicatorStatuses_IndicatorStatusCode] DEFAULT ('MISSING') NOT NULL,
    [IndicatorStatusDescription] VARCHAR (200) CONSTRAINT [DF_DimIndicatorStatuses_IndicatorStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [IndicatorStatusEdFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimIndicatorStatuses_IndicatorStatusEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimIndicatorStatus] PRIMARY KEY CLUSTERED ([DimIndicatorStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatuses_IndicatorStatusEdFactsCode]
    ON [RDS].[DimIndicatorStatuses]([IndicatorStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatuses_IndicatorStatusCode]
    ON [RDS].[DimIndicatorStatuses]([IndicatorStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

