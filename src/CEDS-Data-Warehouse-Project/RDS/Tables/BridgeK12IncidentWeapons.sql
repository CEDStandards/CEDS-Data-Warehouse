CREATE TABLE [RDS].[BridgeK12IncidentWeapons]
(
    [BridgeK12IncidentsWeaponId] int NOT NULL IDENTITY (1, 1),
    [FactK12IncidentId] INT NULL,
    [WeaponId] INT NULL,
    CONSTRAINT [PK_BridgeK12IncidentWeapons] PRIMARY KEY CLUSTERED ([BridgeK12IncidentsWeaponId] ASC),
    CONSTRAINT [FK_BridgeK12IncidentWeapons_FactK12IncidentId] FOREIGN KEY ([FactK12IncidentId]) REFERENCES [RDS].[FactK12Incidents] ([FactK12IncidentId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_BridgeK12IncidentWeapons_WeaponId] FOREIGN KEY ([WeaponId]) REFERENCES [RDS].[DimWeapons] ([DimWeaponId]) ON DELETE No Action ON UPDATE No Action
)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentWeapons_WeaponId] 
 ON [RDS].[BridgeK12IncidentWeapons] ([WeaponId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12IncidentWeapons_FactK12IncidentId] 
 ON [RDS].[BridgeK12IncidentWeapons] ([FactK12IncidentId] ASC)
GO