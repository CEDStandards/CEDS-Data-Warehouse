CREATE TABLE [RDS].[BridgeCredentialAwardCompetencyDefinitions](
	[BridgeCredentialAwardCompetencyDefinitionId] [int] IDENTITY(1,1) NOT NULL,
	[FactCredentialAwardId] [int] NULL,
	[CompetencyDefinitionId] [int] NULL,
 CONSTRAINT [PK_FactCredentialAward] PRIMARY KEY CLUSTERED 
(
	[BridgeCredentialAwardCompetencyDefinitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[BridgeCredentialAwardCompetencyDefinitions]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwardCompetencyDefinitions_CompetencyDefinitionId] FOREIGN KEY([CompetencyDefinitionId])
REFERENCES [RDS].[DimCompetencyDefinitions] ([DimCompetencyDefinitionId])
GO

ALTER TABLE [RDS].[BridgeCredentialAwardCompetencyDefinitions] CHECK CONSTRAINT [FK_FactCredentialAwardCompetencyDefinitions_CompetencyDefinitionId]
GO

ALTER TABLE [RDS].[BridgeCredentialAwardCompetencyDefinitions]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwardCompetencyDefinitions_FactCredentialAwards] FOREIGN KEY([FactCredentialAwardId])
REFERENCES [RDS].[FactCredentialAwards] ([FactCredentialAwardId])
GO

ALTER TABLE [RDS].[BridgeCredentialAwardCompetencyDefinitions] CHECK CONSTRAINT [FK_FactCredentialAwardCompetencyDefinitions_FactCredentialAwards]
GO


