CREATE TABLE [RDS].[DimSchoolPerformanceIndicators] (
    [DimSchoolPerformanceIndicatorId]           INT           IDENTITY (1, 1) NOT NULL,
    [SchoolPerformanceIndicatorTypeCode]        VARCHAR (50)  NULL,
    [SchoolPerformanceIndicatorTypeDescription] VARCHAR (200) NULL,
    [SchoolPerformanceIndicatorTypeEdFactsCode] VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimSchoolPerformanceIndicators] PRIMARY KEY CLUSTERED ([DimSchoolPerformanceIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolPerformanceIndicators_SchoolPerformanceIndicatorTypeEdFactsCode]
    ON [RDS].[DimSchoolPerformanceIndicators]([SchoolPerformanceIndicatorTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolPerformanceIndicators_SchoolPerformanceIndicatorTypeCode]
    ON [RDS].[DimSchoolPerformanceIndicators]([SchoolPerformanceIndicatorTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

