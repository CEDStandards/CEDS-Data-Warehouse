CREATE TABLE [RDS].[DimK12AcademicAwardStatuses] (
    [DimK12AcademicAwardStatusId]      INT            IDENTITY (1, 1) NOT NULL,
    [HighSchoolDiplomaTypeCode]        NVARCHAR (100) NULL,
    [HighSchoolDiplomaTypeDescription] NVARCHAR (300) NULL,
    [HighSchoolDiplomaTypeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimK12AcademicAwardStatuses] PRIMARY KEY CLUSTERED ([DimK12AcademicAwardStatusId] ASC)
);


GO

