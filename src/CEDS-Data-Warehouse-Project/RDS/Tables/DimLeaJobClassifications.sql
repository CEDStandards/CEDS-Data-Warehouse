CREATE TABLE [RDS].[DimLeaJobClassifications](
	[DimLeaJobClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[LeaIdentifierSea] [nvarchar](60) NOT NULL,
	[CodingSystemOranizationTypeCode] [nvarchar](50) NOT NULL,
	[CodingSystemOrganizationTypeDescription] [nvarchar](200) NOT NULL,
	[EducationJobTypeCode] [nvarchar](100) NOT NULL,
	[EducationJobTypeDescription] [nvarchar](2000) NOT NULL,
	[LocalJobFunctionCode] [nvarchar](100) NOT NULL,
	[LocalJobFunctionDescription] [nvarchar](2000) NOT NULL,
	[LocalJobFunctionDefinition] [nvarchar](2000) NOT NULL,
	[LocalJobCategoryCode] [nvarchar](100) NOT NULL,
	[LocalJobCategoryDescription] [nvarchar](2000) NOT NULL,
	[LocalJobCategoryDefinition] [nvarchar](2000) NOT NULL,
	[K12StaffClassificationCode] [nvarchar](100) NOT NULL,
	[K12StaffClassificationDescription] [nvarchar](2000) NOT NULL,
	[TitleIProgramStaffCategoryCode] [nvarchar](100) NOT NULL,
	[TitleIProgramStaffCategoryDescription] [nvarchar](2000) NOT NULL,
	[MigrantEducationProgramStaffCategoryCode] [nvarchar](100) NOT NULL,
	[MigrantEducationProgramStaffCategoryDescription] [nvarchar](2000) NOT NULL,
	[SpecialEducationSupportServicesCategoryCode] [nvarchar](100) NOT NULL,
	[SpecialEducationSupportServicesCategoryDescription] [nvarchar](2000) NOT NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[RecordEndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimLeaJobClassifications] PRIMARY KEY CLUSTERED 
(
	[DimLeaJobClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]