CREATE TABLE [RDS].[BridgeK12StudentDisciplineIdeaDisabilityTypes] (
    [BridgeK12StudentDisciplineIdeaDisabilityTypeId] INT IDENTITY (1, 1) NOT NULL,
    [IdeaDisabilityTypeId]                           INT NULL,
    [FactK12StudentDisciplineId]                     INT NULL,
    CONSTRAINT [PK_BridgeK12StudentDisciplineIdeaDisabilityTypeId] PRIMARY KEY NONCLUSTERED ([BridgeK12StudentDisciplineIdeaDisabilityTypeId] ASC),
    CONSTRAINT [FK_BridgeK12StudentDisciplineIdeaDisabilityTypes_FactK12StudentDisciplines] FOREIGN KEY ([FactK12StudentDisciplineId]) REFERENCES [RDS].[FactK12StudentDisciplines] ([FactK12StudentDisciplineId]),
    CONSTRAINT [FK_BridgeK12StudentDisciplineIdeaDisabilityTypes_IdeaDisabilityTypeId] FOREIGN KEY ([IdeaDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineDisabilityTypes_DimIdeaDisabilityTypes]
    ON [RDS].[BridgeK12StudentDisciplineIdeaDisabilityTypes]([IdeaDisabilityTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineDisabilityTypes_FactK12StudentDisciplines]
    ON [RDS].[BridgeK12StudentDisciplineIdeaDisabilityTypes]([FactK12StudentDisciplineId] ASC);


GO

