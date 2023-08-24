CREATE TABLE [RDS].[DimSchoolYearDataMigrationTypes] (
    [DimSchoolYearId]     INT NOT NULL,
    [DataMigrationTypeId] INT NOT NULL,
    [IsSelected]          BIT NULL,
    CONSTRAINT [PK_DimSchoolYear_DimSchoolYearMigrationTypes] PRIMARY KEY CLUSTERED ([DimSchoolYearId] ASC, [DataMigrationTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

