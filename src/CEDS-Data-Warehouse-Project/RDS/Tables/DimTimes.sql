CREATE TABLE [RDS].[DimTimes] (
    [DimTimeId]       INT            IDENTITY (1, 1) NOT NULL,
    [TimeTime]        TIME  NULL,
    [TimeHour]        INT  NULL,
    [TimeMinute]      INT  NULL,
    CONSTRAINT [PK_DimTimes] PRIMARY KEY CLUSTERED ([DimTimeId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimTimes_TimeTime]
    ON [RDS].[DimTimes]([TimeTime] ASC) WITH (DATA_COMPRESSION = PAGE);

GO
