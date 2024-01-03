CREATE TABLE [RDS].[DimSeaJobClassifications](
	[DimSeaJobClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[CodingSystemOrganizationTypeCode] [nvarchar](50) NOT NULL,
	[CodingSystemOrganizationTypeDescription] [nvarchar](200) NOT NULL,
	[LocalJobFunctionCode] [nvarchar](50) NOT NULL,
	[LocalJobFunctionDescription] [nvarchar](200) NOT NULL,
	[LocalJobCategoryCode] [nvarchar](50) NOT NULL,
	[LocalJobCategoryDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DimSeaJobClassifications] PRIMARY KEY CLUSTERED 
(
	[DimSeaJobClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


