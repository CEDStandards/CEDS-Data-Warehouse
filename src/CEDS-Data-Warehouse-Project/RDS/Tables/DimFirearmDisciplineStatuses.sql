CREATE TABLE [RDS].[DimFirearmDisciplineStatuses] (
    [DimFirearmDisciplineStatusId]                        INT            IDENTITY (1, 1) NOT NULL,
    [DisciplineMethodForFirearmsIncidentsCode]            NVARCHAR (50)  NULL,
    [DisciplineMethodForFirearmsIncidentsDescription]     NVARCHAR (MAX) NULL,
    [DisciplineMethodForFirearmsIncidentsEdFactsCode]     NVARCHAR (50)  NULL,
    [IdeaDisciplineMethodForFirearmsIncidentsCode]        NVARCHAR (50)  NULL,
    [IdeaDisciplineMethodForFirearmsIncidentsDescription] NVARCHAR (MAX) NULL,
    [IdeaDisciplineMethodForFirearmsIncidentsEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimFirearmDisciplineStatuses] PRIMARY KEY CLUSTERED ([DimFirearmDisciplineStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

