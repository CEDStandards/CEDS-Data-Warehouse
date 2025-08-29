CREATE TABLE [RDS].[DimSchoolPerformanceIndicatorCategories] (
    [DimSchoolPerformanceIndicatorCategoryId]       INT            IDENTITY (1, 1) NOT NULL,
    [SchoolPerformanceIndicatorCategoryCode]        NVARCHAR (50)  CONSTRAINT [DF_DimSchoolPerformanceIndicatorCategories_SchoolPerformanceIndicatorCategoryCode] DEFAULT ('MISSING') NOT NULL,
    [SchoolPerformanceIndicatorCategoryDescription] NVARCHAR (200) CONSTRAINT [DF_DimSchoolPerformanceIndicatorCategories_SchoolPerformanceIndicatorCategoryDescription] DEFAULT ('MISSING') NOT NULL,
    [SchoolPerformanceIndicatorCategoryEdFactsCode] VARCHAR (50)   CONSTRAINT [DF_DimSchoolPerformanceIndicatorCategories_SchoolPerformanceIndicatorCategoryEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimSchoolPerformanceIndicatorCategories] PRIMARY KEY CLUSTERED ([DimSchoolPerformanceIndicatorCategoryId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolPerformanceIndicatorCategories_SchoolPerformanceIndicatorCategoryCode]
    ON [RDS].[DimSchoolPerformanceIndicatorCategories]([SchoolPerformanceIndicatorCategoryCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolPerformanceIndicatorCategories_SchoolPerformanceIndicatorCategoryEdFactsCode]
    ON [RDS].[DimSchoolPerformanceIndicatorCategories]([SchoolPerformanceIndicatorCategoryEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

