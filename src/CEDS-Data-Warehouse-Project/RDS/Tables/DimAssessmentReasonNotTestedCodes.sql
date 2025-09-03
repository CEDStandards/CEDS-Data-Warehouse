CREATE TABLE [RDS].[DimAssessmentReasonNotTestedCodes](
    [DimAssessmentReasonNotTestedCodeId] [int] IDENTITY(1,1) NOT NULL,
	[ReasonNotTestedCode] [varchar](1) NULL,
	[ReasonNotTestedDescription] [varchar](50) NULL,
  CONSTRAINT [PK_DimAssessmentReasonNotTestedCodes] PRIMARY KEY CLUSTERED ([DimAssessmentReasonNotTestedCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
      );

GO