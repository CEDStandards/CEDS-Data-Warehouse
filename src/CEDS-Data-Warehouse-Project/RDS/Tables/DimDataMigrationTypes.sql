CREATE TABLE [RDS].[DimDataMigrationTypes] (
    [DimDataMigrationTypeId] INT          IDENTITY (1, 1) NOT NULL,
    [DataMigrationTypeCode]  VARCHAR (50) CONSTRAINT [DF_DimDataMigrationTypes_DataMigrationTypeCode] DEFAULT ('MISSING') NOT NULL,
    [DataMigrationTypeName]  VARCHAR (50) CONSTRAINT [DF_DimDataMigrationTypes_DataMigrationTypeName] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimDataMigrationTypes] PRIMARY KEY CLUSTERED ([DimDataMigrationTypeId] ASC)
);


GO

