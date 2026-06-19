 CREATE TABLE [RDS].[DimPrimaryDisabilityTypes](
        [DimPrimaryDisabiltyTypeId] [int] IDENTITY(1,1) NOT NULL,
        [PrimaryDisabilityTypeCode] [int]  NULL,
        [PrimaryDisabilityTypeDescription] [varchar](50) NULL,
       CONSTRAINT [PK_DimPrimaryDisabilityTypes] PRIMARY KEY CLUSTERED ([DimPrimaryDisabiltyTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO