CREATE TABLE [RDS].[DimEconomicallyDisadvantagedStatuses] (
    [DimEconomicallyDisadvantagedStatusId]                              INT            IDENTITY (1, 1) NOT NULL,
    [EconomicDisadvantageStatusCode]                                    NVARCHAR (100) NOT NULL,
    [EconomicDisadvantageStatusDescription]                             NVARCHAR (300) NOT NULL,
    [EconomicDisadvantageStatusEdFactsCode]                             NVARCHAR (50)  NOT NULL,
    [EligibilityStatusForSchoolFoodServiceProgramsCode]                 NVARCHAR (100) NOT NULL,
    [EligibilityStatusForSchoolFoodServiceProgramsDescription]          NVARCHAR (300) NOT NULL,
    [EligibilityStatusForSchoolFoodServiceProgramsEdFactsCode]          NVARCHAR (50)  NOT NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicatorCode]        NVARCHAR (100) NOT NULL,
    [NationalSchoolLunchProgramDirectCertificationIndicatorDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimEconomicallyDisadvantagedStatusId] PRIMARY KEY CLUSTERED ([DimEconomicallyDisadvantagedStatusId] ASC)
);


GO

