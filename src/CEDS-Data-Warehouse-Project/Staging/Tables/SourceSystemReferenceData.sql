CREATE TABLE [Staging].[SourceSystemReferenceData] (
    [SourceSystemReferenceDataId] INT            IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                  SMALLINT       NOT NULL,
    [TableName]                   VARCHAR (100)  NOT NULL,
    [TableFilter]                 VARCHAR (100)  NULL,
    [InputCode]                   NVARCHAR (200) NULL,
    [OutputCode]                  NVARCHAR (200) NULL,
    [GlobalId]                    NVARCHAR (20)  NULL,
    [ElementName]                 NVARCHAR (150) NULL, 
    CONSTRAINT [PK_SourceSystemReferenceData] PRIMARY KEY CLUSTERED ([SourceSystemReferenceDataId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_SourceSystemReferenceData_Unique]
    ON [Staging].[SourceSystemReferenceData]([SchoolYear] DESC, [OutputCode] DESC, [TableName] ASC, [TableFilter] ASC, [InputCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'SourceSystemReferenceData', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'SourceSystemReferenceData', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'SourceSystemReferenceData', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'SourceSystemReferenceData', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'SourceSystemReferenceData', @level2type=N'COLUMN',@level2name=N'SchoolYear';
GO