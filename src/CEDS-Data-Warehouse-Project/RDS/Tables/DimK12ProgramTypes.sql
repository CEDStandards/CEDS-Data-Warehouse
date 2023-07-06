CREATE TABLE [RDS].[DimK12ProgramTypes] (
    [DimK12ProgramTypeId]    INT            IDENTITY (1, 1) NOT NULL,
    [ProgramTypeCode]        NVARCHAR (50)  NOT NULL,
    [ProgramTypeDescription] NVARCHAR (60)  NULL,
    [ProgramTypeDefinition]  NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_DimK12ProgramTypes] PRIMARY KEY CLUSTERED ([DimK12ProgramTypeId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12ProgramTypes_ProgramTypeCode]
    ON [RDS].[DimK12ProgramTypes]([ProgramTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

