CREATE TABLE [RDS].[DimExtendedLearningOpportunitiesSubjectAreaCodes](
		[DimExtendedLearningOpportunitiesSubjectAreaCodeId]       INT IDENTITY (1, 1) NOT NULL,
		[SCEDCourseSubjectAreaCode] [int] NULL,
		[SCEDCourseSubjectAreaDescription] [nvarchar](255) NULL,
  CONSTRAINT [PK_DimExtendedLearningOpportunitiesSubjectAreaCodes] PRIMARY KEY CLUSTERED ([DimExtendedLearningOpportunitiesSubjectAreaCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO