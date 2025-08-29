CREATE TABLE [RDS].[DimK12Jobs]
(
	[DimK12JobId] int NOT NULL IDENTITY (1, 1),
	[JobIdentifierLea] NVARCHAR(40) NULL,
	[JobIdentifierSchool] NVARCHAR(40) NULL,
	[JobIdentifierSea] NVARCHAR(40) NULL,
	[JobTitle] nvarchar(200) NULL,
	CONSTRAINT [PK_DimK12Jobs] PRIMARY KEY CLUSTERED ([DimK12JobId] ASC)
)
GO