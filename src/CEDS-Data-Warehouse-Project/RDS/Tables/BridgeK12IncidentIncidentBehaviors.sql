CREATE TABLE [RDS].[BridgeK12IncidentsIncidentBehaviors]
(
    [BridgeK12IncidentsIncidentBehaviorId] int NOT NULL IDENTITY (1, 1),
    [FactK12IncidentId] INT NULL,
    [IncidentBehaviorId] int NULL,
    CONSTRAINT [PK_BridgeK12IncidentsIncidentBehaviors] PRIMARY KEY CLUSTERED ([BridgeK12IncidentsIncidentBehaviorId] ASC),
    CONSTRAINT [FK_BridgeK12IncidentsIncidentBehaviors_FactK12IncidentId] FOREIGN KEY ([FactK12IncidentId]) REFERENCES [RDS].[FactK12Incidents] ([FactK12IncidentId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_BridgeK12IncidentsIncidentBehaviors_IncidentBehaviorId] FOREIGN KEY ([IncidentBehaviorId]) REFERENCES [RDS].[DimIncidentBehaviors] ([DimIncidentBehaviorId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentsIncidentBehaviors_IncidentBehaviorId] 
 ON [RDS].[BridgeK12IncidentsIncidentBehaviors] ([IncidentBehaviorId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentsIncidentBehaviors_FactK12IncidentId] 
 ON [RDS].[BridgeK12IncidentsIncidentBehaviors] ([FactK12IncidentId] ASC)
GO