CREATE TABLE [RDS].[BridgeSpecialEducationIdeaDisabilityTypes] (
    [BridgeSpecialEducationIdeaDisabilityTypeId] INT IDENTITY (1, 1) NOT NULL,
    [FactSpecialEducationId]                     INT CONSTRAINT [DF_BridgeSpecialEducationIdeaDisabilityTypes_FactSpecialEducationId] DEFAULT ((-1)) NOT NULL,
    [IdeaDisabilityTypeId]                       INT CONSTRAINT [DF_BridgeSpecialEducationIdeaDisabilityTypes_IdeaDisabilityTypeId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeSpecialEducationIdeaDisabilityTypes] PRIMARY KEY CLUSTERED ([BridgeSpecialEducationIdeaDisabilityTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgeSpecialEducationIdeaDisabilityTypes_FactSpecialEducationId] FOREIGN KEY ([FactSpecialEducationId]) REFERENCES [RDS].[FactSpecialEducation] ([FactSpecialEducationId]),
    CONSTRAINT [FK_BridgeSpecialEducationIdeaDisabilityTypes_IdeaDisabilityTypeId] FOREIGN KEY ([IdeaDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeSpecialEducationIdeaDisabilityTypes_IdeaDisabilityTypeId]
    ON [RDS].[BridgeSpecialEducationIdeaDisabilityTypes]([IdeaDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeSpecialEducationIdeaDisabilityTypes_FactSpecialEducation]
    ON [RDS].[BridgeSpecialEducationIdeaDisabilityTypes]([FactSpecialEducationId] ASC);


GO

