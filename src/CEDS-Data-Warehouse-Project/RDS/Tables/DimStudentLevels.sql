CREATE TABLE [RDS].[DimStudentLevels] (
    [DimStudentLevelId]       INT            IDENTITY (1, 1) NOT NULL,
    [StudentLevelCode]        NVARCHAR (50)  NULL,
    [StudentLevelDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimStudentLevels] PRIMARY KEY CLUSTERED ([DimStudentLevelId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO