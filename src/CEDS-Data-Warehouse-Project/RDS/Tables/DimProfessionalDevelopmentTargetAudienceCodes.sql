CREATE TABLE [RDS].[DimProfessionalDevelopmentActivityTargetAudienceCodes](
	[DimProfessionalDevelopmentActivityTargetAudienceCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessionalDevelopmentActivityTargetAudienceCode] [varchar](10) NOT NULL,
	[ProfessionalDevelopmentActivityTargetAudienceDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DimProfessionalDevelopmentActivityTargetAudienceCodes] PRIMARY KEY CLUSTERED ([DimProfessionalDevelopmentActivityTargetAudienceCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO