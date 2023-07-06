CREATE TABLE [RDS].[DimHomelessnessStatuses] (
    [DimHomelessnessStatusId]                      INT            IDENTITY (1, 1) NOT NULL,
    [HomelessnessStatusCode]                       NVARCHAR (100) NOT NULL,
    [HomelessnessStatusDescription]                NVARCHAR (300) NOT NULL,
    [HomelessnessStatusEdFactsCode]                NVARCHAR (50)  NULL,
    [HomelessPrimaryNighttimeResidenceCode]        NVARCHAR (100) NOT NULL,
    [HomelessPrimaryNighttimeResidenceDescription] NVARCHAR (300) NOT NULL,
    [HomelessPrimaryNighttimeResidenceEdfactsCode] NVARCHAR (50)  NOT NULL,
    [HomelessServicedIndicatorCode]                NVARCHAR (100) NOT NULL,
    [HomelessServicedIndicatorDescription]         NVARCHAR (300) NOT NULL,
    [HomelessUnaccompaniedYouthStatusCode]         NVARCHAR (100) NOT NULL,
    [HomelessUnaccompaniedYouthStatusDescription]  NVARCHAR (300) NOT NULL,
    [HomelessUnaccompaniedYouthStatusEdfactsCode]  NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimHomelessnessStatusId] PRIMARY KEY CLUSTERED ([DimHomelessnessStatusId] ASC)
);


GO

