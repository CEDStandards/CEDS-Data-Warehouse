CREATE TABLE [RDS].[DimTeachingCredentialTypes](
		[DimTeachingCredentialTypeId] [int] IDENTITY(1,1) NOT NULL,
		[TeachingCredentialTypeCode] [varchar](10) NOT NULL,
		[TeachingCredentialTypeDescription] [varchar](200) NOT NULL,
	    CONSTRAINT [PK_DimTeachingCredentialTypes] PRIMARY KEY CLUSTERED ([DimTeachingCredentialTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO;