CREATE TABLE [RDS].[DimIndicatorStatusTypes] (
    [DimIndicatorStatusTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [IndicatorStatusTypeId]          INT            NULL,
    [IndicatorStatusTypeCode]        NVARCHAR (50)  NULL,
    [IndicatorStatusTypeDescription] NVARCHAR (200) NULL,
    [IndicatorStatusTypeEdFactsCode] VARCHAR (50)   NULL,
    CONSTRAINT [PK_DimIndicatorStatusType] PRIMARY KEY CLUSTERED ([DimIndicatorStatusTypeId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatusTypes_IndicatorStatusTypeEdFactsCode]
    ON [RDS].[DimIndicatorStatusTypes]([IndicatorStatusTypeEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatusTypes_IndicatorStatusTypeCode]
    ON [RDS].[DimIndicatorStatusTypes]([IndicatorStatusTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

