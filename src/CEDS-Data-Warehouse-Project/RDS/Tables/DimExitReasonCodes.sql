CREATE TABLE [RDS].[DimExitReasonCodes](
        [DimExitReasonCodeId]       INT            IDENTITY (1, 1) NOT NULL,
        [ExitReasonCode] [char](2) NOT NULL,
        [ExitReasonDescription] [nvarchar](255) NULL,

  CONSTRAINT [PK_DimExitReasonCodes] PRIMARY KEY CLUSTERED ([DimExitReasonCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);
GO