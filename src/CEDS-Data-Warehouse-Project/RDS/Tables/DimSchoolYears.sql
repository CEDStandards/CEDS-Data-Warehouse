CREATE TABLE [RDS].[DimSchoolYears] (
    [DimSchoolYearId]  INT      IDENTITY (1, 1) NOT NULL,
    [SchoolYear]       SMALLINT NOT NULL,
    [SessionBeginDate] DATETIME NOT NULL,
    [SessionEndDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_DimSchoolYears] PRIMARY KEY CLUSTERED ([DimSchoolYearId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimSchoolYears_SchoolYear]
    ON [RDS].[DimSchoolYears]([SchoolYear] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

