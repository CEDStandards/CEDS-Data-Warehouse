CREATE TABLE [RDS].[DimSchoolPerformanceIndicatorStateDefinedStatuses] (
    [DimSchoolPerformanceIndicatorStateDefinedStatusId]       INT            IDENTITY (1, 1) NOT NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusCode]        NVARCHAR (50)  NULL,
    [SchoolPerformanceIndicatorStateDefinedStatusDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimSchoolPerformanceIndicatorStateDefinedStatuses] PRIMARY KEY CLUSTERED ([DimSchoolPerformanceIndicatorStateDefinedStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolPerformanceIndicatorStateDefinedStatuses_SchoolPerformanceIndicatorStateDefinedStatusCode]
    ON [RDS].[DimSchoolPerformanceIndicatorStateDefinedStatuses]([SchoolPerformanceIndicatorStateDefinedStatusCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

