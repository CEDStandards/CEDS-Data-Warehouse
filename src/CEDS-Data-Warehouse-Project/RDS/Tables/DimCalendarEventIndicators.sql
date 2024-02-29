CREATE TABLE [RDS].[DimCalendarEventIndicators] (
    [DimCalendarEventIndicatorId]        INT            IDENTITY (1, 1) NOT NULL,
    [CalendarEventTypeCode]        NVARCHAR (50)  NULL,
    [CalendarEventTypeDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimCalendarEventIndicators] PRIMARY KEY CLUSTERED ([DimCalendarEventIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A type of scheduled or unscheduled calendar event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Event Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000603' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000603' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A type of scheduled or unscheduled calendar event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Event Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000603' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000603' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'CalendarEventTypeDescription';
GO
