CREATE TABLE [RDS].[DimWorkBasedLearningOpportunityTypes](
	[DimWorkBasedLearningOpportunityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[WorkBasedLearningOpportunityTypeCode] [varchar](10) NOT NULL,
	[WorkBasedLearningOpportunityTypeDescription] [nvarchar](255) NULL,
CONSTRAINT [PK_DimWorkBasedLearningOpportunityType] PRIMARY KEY CLUSTERED ([DimWorkBasedLearningOpportunityTypesId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);

GO