CREATE TABLE [NHED].[DimEmploymentSeparationReasonCodes](
	[EmploymentSeparationReasonCodeID] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentSeparationReasonCode] [char](1) NOT NULL,
	[EmploymentSeparationReasonDescription] [varchar](20) NOT NULL,
  CONSTRAINT [PK_DimEmploymentSeparationReasonCodes] PRIMARY KEY CLUSTERED ([DimEmploymentSeparationReasonCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO