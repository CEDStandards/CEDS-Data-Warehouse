CREATE TABLE [RDS].[DimProgramTypes] (
    [DimProgramTypeId]       INT            IDENTITY (1, 1) NOT NULL,
    [ProgramTypeCode]        NVARCHAR (50)  NULL,
    [ProgramTypeDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimProgramType] PRIMARY KEY CLUSTERED ([DimProgramTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimProgramTypes_ProgramTypeCode]
    ON [RDS].[DimProgramTypes]([ProgramTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

