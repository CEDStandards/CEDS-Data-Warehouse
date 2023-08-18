CREATE TABLE [RDS].[DimStateDefinedCustomIndicators] (
    [DimStateDefinedCustomIndicatorId]       INT            IDENTITY (1, 1) NOT NULL,
    [StateDefinedCustomIndicatorCode]        NVARCHAR (50)  NULL,
    [StateDefinedCustomIndicatorDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimStateDefinedCustomIndicator] PRIMARY KEY CLUSTERED ([DimStateDefinedCustomIndicatorId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimStateDefinedCustomIndicators_StateDefinedCustomIndicatorCode]
    ON [RDS].[DimStateDefinedCustomIndicators]([StateDefinedCustomIndicatorCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

