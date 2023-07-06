CREATE TABLE [RDS].[DimDisabilityStatuses] (
    [DimDisabilityStatusId]                        INT            IDENTITY (1, 1) NOT NULL,
    [DisabilityStatusCode]                         NVARCHAR (100) NULL,
    [DisabilityStatusDescription]                  NVARCHAR (300) NULL,
    [Section504StatusCode]                         NVARCHAR (100) NULL,
    [Section504StatusDescription]                  NVARCHAR (300) NULL,
    [Section504StatusEdFactsCode]                  NVARCHAR (50)  NULL,
    [DisabilityConditionTypeCode]                  NVARCHAR (100) NULL,
    [DisabilityConditionTypeDescription]           NVARCHAR (300) NULL,
    [DisabilityDeterminationSourceTypeCode]        NVARCHAR (100) NULL,
    [DisabilityDeterminationSourceTypeDescription] NVARCHAR (300) NULL,
    CONSTRAINT [PK_DimDisabilityStatuses] PRIMARY KEY CLUSTERED ([DimDisabilityStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisabilityStatuses_Codes]
    ON [RDS].[DimDisabilityStatuses]([DisabilityStatusCode] ASC, [Section504StatusCode] ASC, [DisabilityConditionTypeCode] ASC, [DisabilityDeterminationSourceTypeCode] ASC);


GO

