CREATE TABLE [RDS].[DimAeProgramYears] (
    [DimAeProgramYearId] INT      IDENTITY (1, 1) NOT NULL,
    [AeProgramYear]      SMALLINT NOT NULL,
    [SessionBeginDate]   DATETIME NOT NULL,
    [SessionEndDate]     DATETIME NOT NULL,
    CONSTRAINT [PK_DimAeProgramYears] PRIMARY KEY CLUSTERED ([DimAeProgramYearId] ASC)
);


GO

