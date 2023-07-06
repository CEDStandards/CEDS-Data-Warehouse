CREATE TABLE [RDS].[DimPsDemographics] (
    [DimPsDemographicId] INT            IDENTITY (1, 1) NOT NULL,
    [SexCode]            NVARCHAR (50)  NULL,
    [SexDescription]     NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimPsDemographics] PRIMARY KEY CLUSTERED ([DimPsDemographicId] ASC)
);


GO

