CREATE TABLE [RDS].[BridgeK12IncidentFirearms]
(
    [BridgeK12IncidentsFirearmId] int NOT NULL IDENTITY (1, 1),
    [FactK12IncidentId] int NULL,
    [FirearmId] int NULL,
    CONSTRAINT [PK_BridgeK12IncidentFirearms] PRIMARY KEY CLUSTERED ([BridgeK12IncidentsFirearmId] ASC),
    CONSTRAINT [FK_BridgeK12IncidentFirearms_FactK12IncidentId] FOREIGN KEY ([FactK12IncidentId]) REFERENCES [RDS].[FactK12Incidents] ([FactK12IncidentId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_BridgeK12IncidentFirearms_FirearmId] FOREIGN KEY ([FirearmId]) REFERENCES [RDS].[DimFirearms] ([DimFirearmId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentFirearms_FirearmId] 
 ON [RDS].[BridgeK12IncidentFirearms] ([FirearmId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentFirearms_FactK12IncidentId] 
 ON [RDS].[BridgeK12IncidentFirearms] ([FactK12IncidentId] ASC)
GO