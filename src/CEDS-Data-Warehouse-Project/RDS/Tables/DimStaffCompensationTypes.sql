CREATE TABLE [RDS].[DimStaffCompensationTypes](
	[DimStaffCompensationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[StaffCompensationTypeCode] [nvarchar](50) NOT NULL,
	[StaffCompensationTypeDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DimStaffCompensationTypes] PRIMARY KEY CLUSTERED 
(
	[DimStaffCompensationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

