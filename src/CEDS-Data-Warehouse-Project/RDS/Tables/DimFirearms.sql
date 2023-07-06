CREATE TABLE [RDS].[DimFirearms] (
    [DimFirearmId]           INT           IDENTITY (1, 1) NOT NULL,
    [FirearmTypeCode]        VARCHAR (50)  NULL,
    [FirearmTypeDescription] VARCHAR (200) NULL,
    [FirearmTypeEdFactsCode] VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimFirearms] PRIMARY KEY CLUSTERED ([DimFirearmId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimFirearms_FirearmTypeCode]
    ON [RDS].[DimFirearms]([FirearmTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimFirearms_FirearmTypeEdFactsCode]
    ON [RDS].[DimFirearms]([FirearmTypeEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

