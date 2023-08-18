CREATE TABLE [RDS].[BridgeK12StudentEnrollmentIdeaDisabilityTypes] (
    [BridgeK12StudentEnrollmentIdeaDisabilityTypeId] INT    IDENTITY (1, 1) NOT NULL,
    [FactK12StudentEnrollmentId]                     BIGINT NOT NULL,
    [IdeaDisabilityTypeId]                           INT    NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentEnrollmentIdeaDisabilityTypeId] PRIMARY KEY CLUSTERED ([BridgeK12StudentEnrollmentIdeaDisabilityTypeId] ASC),
    CONSTRAINT [FK_BridgeK12StudentEnrollmentIdeaDisabilityTypes_FactK12StudentEnrollmentId] FOREIGN KEY ([FactK12StudentEnrollmentId]) REFERENCES [RDS].[FactK12StudentEnrollments] ([FactK12StudentEnrollmentId]),
    CONSTRAINT [FK_BridgeK12StudentEnrollmentIdeaDisabilityTypes_IdeaDisabilityTypeId] FOREIGN KEY ([IdeaDisabilityTypeId]) REFERENCES [RDS].[DimIdeaDisabilityTypes] ([DimIdeaDisabilityTypeId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentIdeaDisabilityTypes_FactK12StudentEnrollments]
    ON [RDS].[BridgeK12StudentEnrollmentIdeaDisabilityTypes]([FactK12StudentEnrollmentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentEnrollmentIdeaDisabilityTypes_IdeaDisabilityTypeId]
    ON [RDS].[BridgeK12StudentEnrollmentIdeaDisabilityTypes]([IdeaDisabilityTypeId] ASC);


GO

