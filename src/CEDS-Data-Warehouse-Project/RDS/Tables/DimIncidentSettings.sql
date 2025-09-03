CREATE TABLE [RDS].[DimIncidentSettings] (
    [DimIncidentSettingId]                    INT            IDENTITY (1, 1) NOT NULL,
    [IncidentLocationCode]                     NVARCHAR (50)  CONSTRAINT [DF_DimIncidentSettings_IncidentLocationCode] DEFAULT ('MISSING') NOT NULL,
    [IncidentLocationDescription]              NVARCHAR (200)  CONSTRAINT [DF_DimIncidentSettings_IncidentLocationDescription] DEFAULT ('MISSING') NOT NULL,
    [IncidentActivityCode]                     NVARCHAR (50)  CONSTRAINT [DF_DimIncidentSettings_IncidentActivityCode] DEFAULT ('MISSING') NOT NULL,
    [IncidentActivityDescription]              NVARCHAR (200)  CONSTRAINT [DF_DimIncidentSettings_IncidentActivityDescription] DEFAULT ('MISSING') NOT NULL,
CONSTRAINT [PK_DimIncidentSettings] PRIMARY KEY CLUSTERED ([DimIncidentSettingId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The activity taking place during the occurrence. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Activity' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The activity taking place during the occurrence. ' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Activity' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002110' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentActivityDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies where the incident occurred and whether or not it occurred on campus.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Location' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies where the incident occurred and whether or not it occurred on campus.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Location' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000617' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentSettings', @level2type=N'COLUMN',@level2name=N'IncidentLocationDescription';
GO