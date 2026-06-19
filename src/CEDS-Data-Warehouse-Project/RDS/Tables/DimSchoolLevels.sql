CREATE TABLE [RDS].[DimSchoolLevels](
		[DimSchoolLevelId] [int] IDENTITY(1,1) NOT NULL,
		[SchoolLevelCode] [varchar](3) NOT NULL,
		[SchoolLevelCodeDescription] [varchar](50) NULL,
	    CONSTRAINT [PK_DimSchoolLevels] PRIMARY KEY CLUSTERED ([DimSchoolLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO
