CREATE TABLE [RDS].[DimEndOfTermStatuses](
        [DimEndOfTermStatusId]       INT            IDENTITY (1, 1) NOT NULL,
        [EndOfTermStatusCode] [char](2) NOT NULL,
        [EndOfTermStatusDescription] [nvarchar](255) NULL,

  CONSTRAINT [PK_DimEndOfTermStatuses] PRIMARY KEY CLUSTERED ([DimEndOfTermStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO