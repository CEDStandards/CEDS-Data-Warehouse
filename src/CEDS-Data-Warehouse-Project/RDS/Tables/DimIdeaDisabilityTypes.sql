CREATE TABLE [RDS].[DimIdeaDisabilityTypes] (
    [DimIdeaDisabilityTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [IdeaDisabilityTypeCode]        NVARCHAR (100) NULL,
    [IdeaDisabilityTypeDescription] NVARCHAR (300) NULL,
    [IdeaDisabilityTypeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimIdeaDisabilityTypes] PRIMARY KEY CLUSTERED ([DimIdeaDisabilityTypeId] ASC)
);


GO

