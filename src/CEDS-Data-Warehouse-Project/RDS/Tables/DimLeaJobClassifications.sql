CREATE TABLE [RDS].[DimLeaJobClassifications](
	[DimLeaJobClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[LeaIdentifierSea] [nvarchar](60) NOT NULL,
	[CodingSystemOranizationTypeCode] [nvarchar](50) NOT NULL,
	[CodingSystemOrganizationTypeDescription] [nvarchar](200) NOT NULL,
	[LocalJobFunctionCode] [nvarchar](50) NOT NULL,
	[LocalJobFunctionDescription] [nvarchar](200) NOT NULL,
	[LocalJobCategoryCode] [nvarchar](50) NOT NULL,
	[LocalJobCategoryDescription] [nvarchar](200) NOT NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimLeaJobClassifications] PRIMARY KEY CLUSTERED 
(
	[DimLeaJobClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]