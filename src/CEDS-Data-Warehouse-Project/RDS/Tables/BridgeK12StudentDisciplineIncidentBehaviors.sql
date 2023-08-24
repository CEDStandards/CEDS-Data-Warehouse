CREATE TABLE [RDS].[BridgeK12StudentDisciplineIncidentBehaviors] (
    [BridgeK12StudentDisciplineIncidentBehaviorId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentDisciplineId]                   INT NULL,
    [IncidentBehaviorId]                           INT NULL,
    CONSTRAINT [PK_BridgeK12StudentDisciplineIncidentBehaviorId] PRIMARY KEY CLUSTERED ([BridgeK12StudentDisciplineIncidentBehaviorId] ASC),
    CONSTRAINT [FK_BridgeK12StudentDisciplineIncidentBehaviors_DimIncidentBehaviors] FOREIGN KEY ([IncidentBehaviorId]) REFERENCES [RDS].[DimIncidentBehaviors] ([DimIncidentBehaviorId]),
    CONSTRAINT [FK_BridgeK12StudentDisciplineIncidentBehaviors_FactK12StudentDisciplines] FOREIGN KEY ([FactK12StudentDisciplineId]) REFERENCES [RDS].[FactK12StudentDisciplines] ([FactK12StudentDisciplineId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineIncidentBehaviors_FactK12StudentDisciplines]
    ON [RDS].[BridgeK12StudentDisciplineIncidentBehaviors]([FactK12StudentDisciplineId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineIncidentBehaviors_DimIncidentBehaviors]
    ON [RDS].[BridgeK12StudentDisciplineIncidentBehaviors]([IncidentBehaviorId] ASC);


GO

