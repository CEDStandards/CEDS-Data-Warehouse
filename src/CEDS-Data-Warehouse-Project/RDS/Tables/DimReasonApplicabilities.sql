CREATE TABLE [RDS].[DimReasonApplicabilities] (
    [DimReasonApplicabilityId]       INT           IDENTITY (1, 1) NOT NULL,
    [ReasonApplicabilityCode]        VARCHAR (50)  NULL,
    [ReasonApplicabilityDescription] VARCHAR (200) NULL,
    [ReasonApplicabilityEdFactsCode] VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimReasonApplicability] PRIMARY KEY CLUSTERED ([DimReasonApplicabilityId] ASC)
);


GO

