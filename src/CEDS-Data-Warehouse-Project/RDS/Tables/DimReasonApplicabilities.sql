CREATE TABLE [RDS].[DimReasonApplicabilities] (
    [DimReasonApplicabilityId]       INT           IDENTITY (1, 1) NOT NULL,
    [ReasonApplicabilityCode]        VARCHAR (50)  CONSTRAINT [DF_DimReasonApplicabilities_ReasonApplicabilityCode] DEFAULT ('MISSING') NOT NULL,
    [ReasonApplicabilityDescription] VARCHAR (200) CONSTRAINT [DF_DimReasonApplicabilities_ReasonApplicabilityDescription] DEFAULT ('MISSING') NOT NULL,
    [ReasonApplicabilityEdFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimReasonApplicabilities_ReasonApplicabilityEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimReasonApplicability] PRIMARY KEY CLUSTERED ([DimReasonApplicabilityId] ASC)
);


GO

