CREATE TABLE [RDS].[DimK12PositionStatuses]
(
	[DimK12PositionStatusId] int NOT NULL IDENTITY (1, 1),
	[ItinerantTeacherCode] nvarchar(50) NOT NULL DEFAULT 'MISSING',
	[ItinerantTeacherDescription] nvarchar(200) NOT NULL DEFAULT 'MISSING',
	CONSTRAINT [PK_DimK12PositionStatusId] PRIMARY KEY CLUSTERED ([DimK12PositionStatusId] ASC)
)
GO