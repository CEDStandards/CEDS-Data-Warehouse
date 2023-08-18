CREATE TABLE [RDS].[DimSchoolQualityOrStudentSuccessIndicators] (
    [DimSchoolQualityOrStudentSuccessIndicatorId]           INT            IDENTITY (1, 1) NOT NULL,
    [SchoolQualityOrStudentSuccessIndicatorTypeCode]        NVARCHAR (50)  NULL,
    [SchoolQualityOrStudentSuccessIndicatorTypeDescription] NVARCHAR (200) NULL,
    [SchoolQualityOrStudentSuccessIndicatorTypeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimSchoolQualityOrStudentSuccessIndicators] PRIMARY KEY CLUSTERED ([DimSchoolQualityOrStudentSuccessIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolQualityOrStudentSuccessIndicators_SchoolQualityOrStudentSuccessIndicatorTypeCode]
    ON [RDS].[DimSchoolQualityOrStudentSuccessIndicators]([SchoolQualityOrStudentSuccessIndicatorTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

