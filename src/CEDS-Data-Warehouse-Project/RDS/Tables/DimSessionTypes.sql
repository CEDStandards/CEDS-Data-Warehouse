CREATE TABLE [RDS].[DimSessionTypes](
		[DimSessionTypeId] [int] NOT NULL,
		[SessionTypeCode] [varchar](50) NULL,
		[SessionTypeDescription] [varchar](50) NULL,
	    CONSTRAINT [PK_DimSessionTypes] PRIMARY KEY CLUSTERED ([DimSessionTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO;