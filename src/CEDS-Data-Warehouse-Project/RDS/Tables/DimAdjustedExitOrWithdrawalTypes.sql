CREATE TABLE [RDS].[DimAdjustedExitOrWithdrawalTypes](
		[DimAdjustedExitOrWithdrawalTypeId] [int] IDENTITY(1,1) NOT NULL,
		[AdjustedExitOrWithdrawalTypeCode] [int] NOT NULL,
		[AdjustedExitOrWithdrawalTypeDescription] [varchar](250) NOT NULL,
	 CONSTRAINT [PK_DimNHSEISExitCodes] PRIMARY KEY CLUSTERED 
	(
		[DimAdjustedExitOrWithdrawalTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]