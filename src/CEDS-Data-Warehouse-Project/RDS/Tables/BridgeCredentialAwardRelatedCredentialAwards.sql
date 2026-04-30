CREATE TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards](
	[BridgeCredentialAwardRelatedCredentialAwardId] [int] IDENTITY(1,1) NOT NULL,
	[FactCredentialAwardId] [int] NULL,
	[RelatedFactCredentialAwardId] [int] NULL,
	[CredentialAwardRelationshipTypeCode] [nvarchar](50) NOT NULL,
	[CredentialAwardRelationshipTypeDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_BridgeCredentialAwardRelatedCredentialAwards] PRIMARY KEY CLUSTERED 
(
	[BridgeCredentialAwardRelatedCredentialAwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards] ADD  DEFAULT ('MISSING') FOR [CredentialAwardRelationshipTypeCode]
GO

ALTER TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards] ADD  DEFAULT ('MISSING') FOR [CredentialAwardRelationshipTypeDescription]
GO

ALTER TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_BridgeCredentialAwardRelatedCredentialAwards_FactCredentialAwards] FOREIGN KEY([FactCredentialAwardId])
REFERENCES [RDS].[FactCredentialAwards] ([FactCredentialAwardId])
GO

ALTER TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards] CHECK CONSTRAINT [FK_BridgeCredentialAwardRelatedCredentialAwards_FactCredentialAwards]
GO

ALTER TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_BridgeCredentialAwardRelatedCredentialAwards_RelatedFactCredentialAwardId] FOREIGN KEY([RelatedFactCredentialAwardId])
REFERENCES [RDS].[FactCredentialAwards] ([FactCredentialAwardId])
GO

ALTER TABLE [RDS].[BridgeCredentialAwardRelatedCredentialAwards] CHECK CONSTRAINT [FK_BridgeCredentialAwardRelatedCredentialAwards_RelatedFactCredentialAwardId]
GO