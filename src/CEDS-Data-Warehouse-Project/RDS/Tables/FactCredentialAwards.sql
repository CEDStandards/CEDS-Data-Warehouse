CREATE TABLE [RDS].[FactCredentialAwards](
	[FactCredentialAwardId] [int] IDENTITY(1,1) NOT NULL,
	[CredentialAwardCount] [int] NOT NULL,
	[CredentialIssuerId] [int] NULL,
	[CredentialDefinitionId] [int] NULL,
	[CredentialAwardRecipientPersonId] [bigint] NULL,
	[CredentialAwardStatusId] [int] NULL,
	[SchoolYearId] [int] NULL,
	[CredentialAwardId] [int] NULL,
	[AssessmentId] [int] NULL,
	[DataCollectionId] [int] NULL,
	[K12DemographicId] [int] NULL,
	[RelatedCredentialAwardId] [int] NULL,
 CONSTRAINT [PK_FactCredentialAwards] PRIMARY KEY CLUSTERED 
(
	[FactCredentialAwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[FactCredentialAwards] ADD  DEFAULT ((1)) FOR [CredentialAwardCount]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_AssessmentId] FOREIGN KEY([AssessmentId])
REFERENCES [RDS].[DimAssessments] ([DimAssessmentId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_AssessmentId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_CredentialAwardId] FOREIGN KEY([CredentialAwardId])
REFERENCES [RDS].[DimCredentialAwards] ([DimCredentialAwardId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_CredentialAwardId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_CredentialAwardRecipientId] FOREIGN KEY([CredentialAwardRecipientPersonId])
REFERENCES [RDS].[DimPeople] ([DimPersonId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_CredentialAwardRecipientId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_CredentialAwardStatusId] FOREIGN KEY([CredentialAwardStatusId])
REFERENCES [RDS].[DimCredentialAwardStatuses] ([DimCredentialAwardStatusId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_CredentialAwardStatusId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_CredentialDefinitionId] FOREIGN KEY([CredentialDefinitionId])
REFERENCES [RDS].[DimCredentialDefinitions] ([DimCredentialDefinitionId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_CredentialDefinitionId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_CredentialIssuerId] FOREIGN KEY([CredentialIssuerId])
REFERENCES [RDS].[DimCredentialIssuers] ([DimCredentialIssuerId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_CredentialIssuerId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_DataCollectionId] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_DataCollectionId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_K12DemographicId] FOREIGN KEY([K12DemographicId])
REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_K12DemographicId]
GO

ALTER TABLE [RDS].[FactCredentialAwards]  WITH CHECK ADD  CONSTRAINT [FK_FactCredentialAwards_SchoolYearId] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactCredentialAwards] CHECK CONSTRAINT [FK_FactCredentialAwards_SchoolYearId]
GO


