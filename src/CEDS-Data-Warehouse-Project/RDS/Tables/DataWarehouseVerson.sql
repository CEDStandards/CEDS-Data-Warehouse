CREATE TABLE [RDS].[DataWarehouseVersion] (
    [DataWarehouseVersionId]             INT            IDENTITY (1, 1) NOT NULL,
    [DataWarehouseVersion]               NVARCHAR (50)  NOT NULL,
    [DataWarehouseVersionReleaseDate]    DATETIME       NOT NULL,
    CONSTRAINT [PK_DataWarehouseVersion] PRIMARY KEY CLUSTERED ([DataWarehouseVersionId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO