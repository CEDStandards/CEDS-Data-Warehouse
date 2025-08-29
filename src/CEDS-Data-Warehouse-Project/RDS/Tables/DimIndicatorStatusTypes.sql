CREATE TABLE [RDS].[DimIndicatorStatusTypes] (
    [DimIndicatorStatusTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [IndicatorStatusTypeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimIndicatorStatusTypes_IndicatorStatusTypeCode] DEFAULT ('MISSING') NOT NULL,
    [IndicatorStatusTypeDescription] NVARCHAR (200) CONSTRAINT [DF_DimIndicatorStatusTypes_IndicatorStatusTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [IndicatorStatusTypeEdFactsCode] VARCHAR (50)   CONSTRAINT [DF_DimIndicatorStatusTypes_IndicatorStatusTypeEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimIndicatorStatusType] PRIMARY KEY CLUSTERED ([DimIndicatorStatusTypeId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatusTypes_IndicatorStatusTypeEdFactsCode]
    ON [RDS].[DimIndicatorStatusTypes]([IndicatorStatusTypeEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimIndicatorStatusTypes_IndicatorStatusTypeCode]
    ON [RDS].[DimIndicatorStatusTypes]([IndicatorStatusTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

