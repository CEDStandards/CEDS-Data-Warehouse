CREATE TABLE [RDS].[DimAeDemographics] (
    [DimAeDemographicId]                           INT            IDENTITY (1, 1) NOT NULL,
    [EconomicDisadvantageStatusCode]               NVARCHAR (50)  NULL,
    [EconomicDisadvantageStatusDescription]        NVARCHAR (200) NULL,
    [HomelessnessStatusCode]                       NVARCHAR (50)  NULL,
    [HomelessnessStatusDescription]                NVARCHAR (200) NULL,
    [EnglishLearnerStatusCode]                     NVARCHAR (50)  NULL,
    [EnglishLearnerStatusDescription]              NVARCHAR (200) NULL,
    [MigrantStatusCode]                            NVARCHAR (50)  NULL,
    [MigrantStatusDescription]                     NVARCHAR (200) NULL,
    [MilitaryConnectedStudentIndicatorCode]        NVARCHAR (50)  NULL,
    [MilitaryConnectedStudentIndicatorDescription] NVARCHAR (200) NULL,
    [HomelessPrimaryNighttimeResidenceCode]        NVARCHAR (50)  NULL,
    [HomelessPrimaryNighttimeResidenceDescription] NVARCHAR (MAX) NULL,
    [HomelessUnaccompaniedYouthStatusCode]         NVARCHAR (50)  NULL,
    [HomelessUnaccompaniedYouthStatusDescription]  NVARCHAR (MAX) NULL,
    [SexCode]                                      NVARCHAR (50)  NULL,
    [SexDescription]                               NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimAeDemographics] PRIMARY KEY CLUSTERED ([DimAeDemographicId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeDemographics_Codes]
    ON [RDS].[DimAeDemographics]([EconomicDisadvantageStatusCode] ASC, [HomelessnessStatusCode] ASC, [EnglishLearnerStatusCode] ASC, [MigrantStatusCode] ASC, [MilitaryConnectedStudentIndicatorCode] ASC, [HomelessPrimaryNighttimeResidenceCode] ASC, [HomelessUnaccompaniedYouthStatusCode] ASC, [SexCode] ASC);


GO

