CREATE TABLE [RDS].[DimPsAcademicAwardTitles] (
    [DimPsAcademicAwardTitleId] INT            IDENTITY (1, 1) NOT NULL,
    [AcademicAwardTitle]        NVARCHAR (160) NOT NULL,
    CONSTRAINT [PK_DimPsAcademicAwardTitles] PRIMARY KEY CLUSTERED ([DimPsAcademicAwardTitleId] ASC) WITH (FILLFACTOR = 80)
);


GO

