CREATE TABLE [RDS].[BridgeCredentialAwardRaces]
(
	[BridgeCredentialAwardRaceId] int IDENTITY (1, 1) NOT NULL,
	[FactCredentialAwardId] int NULL,
	[RaceId] int NULL,

	CONSTRAINT [PK_BridgeCredentialAwardRaces] PRIMARY KEY CLUSTERED ([BridgeCredentialAwardRaceId] ASC),
	CONSTRAINT [FK_BridgeCredentialAwardRaces_FactCredentialAwardId] FOREIGN KEY ([FactCredentialAwardId]) REFERENCES [RDS].[FactCredentialAwards] ([FactCredentialAwardId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_BridgeCredentialAwardRaces_RaceId] FOREIGN KEY ([RaceId]) REFERENCES [RDS].[DimRaces] ([DimRaceId]) ON DELETE No Action ON UPDATE No Action

)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeCredentialAwardRaces_FactCredentialAwardId] 
 ON [RDS].[BridgeCredentialAwardRaces] ([FactCredentialAwardId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeCredentialAwardRaces_RaceId] 
 ON [RDS].[BridgeCredentialAwardRaces] ([RaceId] ASC)
GO
