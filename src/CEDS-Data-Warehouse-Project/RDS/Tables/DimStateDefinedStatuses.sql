CREATE TABLE [RDS].[DimStateDefinedStatuses] (
    [DimStateDefinedStatusId]       INT            IDENTITY (1, 1) NOT NULL,
    [StateDefinedStatusCode]        NVARCHAR (50)  CONSTRAINT [DF_DimStateDefinedStatuses_StateDefinedStatusCode] DEFAULT ('MISSING') NOT NULL,
    [StateDefinedStatusDescription] NVARCHAR (200) CONSTRAINT [DF_DimStateDefinedStatuses_StateDefinedStatusDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimStateDefinedStatus] PRIMARY KEY CLUSTERED ([DimStateDefinedStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimStateDefinedStatuses_StateDefinedStatusCode]
    ON [RDS].[DimStateDefinedStatuses]([StateDefinedStatusCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

