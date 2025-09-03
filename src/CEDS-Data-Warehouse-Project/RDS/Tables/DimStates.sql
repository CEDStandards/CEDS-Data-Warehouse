 CREATE TABLE [RDS].[DimStates](
        [DimStateId] [int] IDENTITY(1,1) NOT NULL,
        [StateAbbreviationCode] [varchar](2) NULL,
        [StateAbbreviationDescription] [varchar](25) NULL,
    CONSTRAINT [PK_DimState] PRIMARY KEY CLUSTERED ([DimStateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
    );
    GO