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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDefinition';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDefinition';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDefinition';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDefinition';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDefinition';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The system outlining instructional or non-instructional activities and procedures designed to accomplish a predetermined educational objective or set of objectives or to provide support services to a person and/or the community.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Program Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21225' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimK12ProgramTypes', @level2type=N'COLUMN',@level2name=N'ProgramTypeDescription';
GO