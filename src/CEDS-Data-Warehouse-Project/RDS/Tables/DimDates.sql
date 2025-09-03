CREATE TABLE [RDS].[DimDates] (
    [DimDateId]      INT           IDENTITY (1, 1) NOT NULL,
    [DateValue]      DATETIME2 (7) CONSTRAINT [DF_DimDates_DateValue] DEFAULT ('1/1/1900') NOT NULL,
    [Day]            INT           CONSTRAINT [DF_DimDates_Day] DEFAULT ((0)) NOT NULL,
    [DayOfWeek]      NVARCHAR (50) CONSTRAINT [DF_DimDates_DayOfWeek] DEFAULT ('MISSING') NOT NULL,
    [DayOfYear]      INT           CONSTRAINT [DF_DimDates_DayOfYear] DEFAULT ((0)) NOT NULL,
    [Month]          INT           CONSTRAINT [DF_DimDates_Month] DEFAULT ((0)) NOT NULL,
    [MonthName]      NVARCHAR (50) CONSTRAINT [DF_DimDates_MonthName] DEFAULT ('MISSING') NOT NULL,
    [SubmissionYear] NVARCHAR (50) CONSTRAINT [DF_DimDates_SubmissionYear] DEFAULT ('MISSING') NOT NULL,
    [Year]           INT           CONSTRAINT [DF_DimDates_Year] DEFAULT ((0)) NOT NULL,
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

