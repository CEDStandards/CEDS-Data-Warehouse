CREATE TABLE [RDS].[DimDates] (
    [DimDateId]      INT           IDENTITY (1, 1) NOT NULL,
    [DateValue]      DATETIME2 (7) NULL,
    [Day]            INT           NULL,
    [DayOfWeek]      NVARCHAR (50) NULL,
    [DayOfYear]      INT           NULL,
    [Month]          INT           NULL,
    [MonthName]      NVARCHAR (50) NULL,
    [SubmissionYear] NVARCHAR (50) NULL,
    [Year]           INT           NULL,
    CONSTRAINT [PK_DimDates] PRIMARY KEY CLUSTERED ([DimDateId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDates_DateValue]
    ON [RDS].[DimDates]([DateValue] ASC)
    INCLUDE([DimDateId]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimDates_SubmissionYear]
    ON [RDS].[DimDates]([SubmissionYear] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

