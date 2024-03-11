CREATE TABLE [RDS].[DimK12Positions]
(
	[DimK12PositionId] int NOT NULL IDENTITY (1, 1),
	[PositionIdentifierSea] nvarchar(60) NULL,
	[PositionIdentifierLea] nvarchar(60) NULL,
	[PositionTitle] nvarchar(400) NULL,
	[PositionPostedDate] date NOT NULL,
	[PositionExpectedStartDate] date NOT NULL,
	[PositionExpirationDate] date NULL,
	[PositionExpirationReasonCode] nvarchar(50) NULL,
	[PositionExpirationReasonDescription] nvarchar(200) NULL,
	[HourlyWage] [decimal](10, 2) NULL,
	[StaffCompensationBaseSalary] [decimal](10, 2) NULL,
	CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED ([DimK12PositionId] ASC)
)
GO

