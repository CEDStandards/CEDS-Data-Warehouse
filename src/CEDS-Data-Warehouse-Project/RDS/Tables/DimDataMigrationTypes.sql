CREATE TABLE [RDS].[DimDataMigrationTypes] (
    [DimDataMigrationTypeId] INT          IDENTITY (1, 1) NOT NULL,
    [DataMigrationTypeCode]  VARCHAR (50) NULL,
    [DataMigrationTypeName]  VARCHAR (50) NULL,
    CONSTRAINT [PK_DimDataMigrationTypes] PRIMARY KEY CLUSTERED ([DimDataMigrationTypeId] ASC)
);


GO

