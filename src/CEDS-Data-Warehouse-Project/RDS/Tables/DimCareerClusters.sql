CREATE TABLE [RDS].[DimCareerClusters](
        [DimCareerClusterId] [int] IDENTITY(1,1) NOT NULL,
        [CareerClusterCode] [char](2) NULL,
        [CareerClusterDescription] [varchar](100) NULL,
  CONSTRAINT [PK_DimCareerClusters] PRIMARY KEY CLUSTERED ([DimCareerClusterId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO
   
