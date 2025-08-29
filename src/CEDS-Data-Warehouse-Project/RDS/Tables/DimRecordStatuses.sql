CREATE TABLE [RDS].[DimRecordStatuses] (
    [DimRecordStatusId]       INT            IDENTITY (1, 1) NOT NULL,
    [RecordStatusTypeCode]        NVARCHAR (50)  CONSTRAINT [DF_DimRecordStatuses_RecordStatusTypeCode] DEFAULT ('MISSING')          NOT NULL,
    [RecordStatusTypeDescription] NVARCHAR (200) CONSTRAINT [DF_DimRecordStatuses_RecordStatusTypeDescription] DEFAULT ('MISSING')   NOT NULL,
    [RecordStatusCreatorEntityCode]        NVARCHAR (50)  CONSTRAINT [DF_DimRecordStatuses_RecordStatusCreatorEntityCode] DEFAULT ('MISSING')          NOT NULL,
    [RecordStatusCreatorEntityDescription] NVARCHAR (200) CONSTRAINT [DF_DimRecordStatuses_RecordStatusCreatorEntityDescription] DEFAULT ('MISSING')   NOT NULL,

    CONSTRAINT [PK_DimRecordStatuses] PRIMARY KEY CLUSTERED ([DimRecordStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimRecordStatuses_RecordStatusTypeCode]
    ON [RDS].[DimRecordStatuses]([RecordStatusTypeCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A process indicator of the level of stability, quality, and/or preparedness of the record.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001972' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001972' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A process indicator of the level of stability, quality, and/or preparedness of the record.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001972' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001972' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of entity that created or indicated the Record Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Status Creator Entity' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001974' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001974' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of entity that created or indicated the Record Status Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Status Creator Entity' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001974' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001974' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimRecordStatuses', @level2type=N'COLUMN',@level2name=N'RecordStatusCreatorEntityDescription';
GO
