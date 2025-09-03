CREATE TABLE [RDS].[DimIncidentTimeIndicators] (
    [DimIncidentTimeIndicatorId]                                      INT            IDENTITY (1, 1) NOT NULL,
    [IncidentTimeDescriptionCodeCode]                                          NVARCHAR (50)  CONSTRAINT [DF_DimIncidentTimeIndicators_IncidentTimeDescriptionCodeCode] DEFAULT ('MISSING') NOT NULL,
    [IncidentTimeDescriptionCodeDescription]                                   NVARCHAR (200)  CONSTRAINT [DF_DimIncidentTimeIndicators_IncidentTimeDescriptionCodeDescription] DEFAULT ('MISSING') NOT NULL,
CONSTRAINT [PK_DimIncidentTimeIndicators] PRIMARY KEY CLUSTERED ([DimIncidentTimeIndicatorId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A code for the description of the time of day that an incident took place.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Time Description Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000515' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000515' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A code for the description of the time of day that an incident took place.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Time Description Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000515' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000515' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentTimeIndicators', @level2type=N'COLUMN',@level2name=N'IncidentTimeDescriptionCodeDescription';
GO