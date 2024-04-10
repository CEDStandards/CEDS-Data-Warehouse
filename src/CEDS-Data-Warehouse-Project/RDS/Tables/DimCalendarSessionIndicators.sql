CREATE TABLE [RDS].[DimCalendarSessionIndicators] (
    [DimCalendarSessionIndicatorId]        INT            IDENTITY (1, 1) NOT NULL,
    [SessionTypeCode]        NVARCHAR (50)  NULL,
    [SessionTypeDescription] NVARCHAR (200) NULL,
    [SessionMarkingTermIndicatorCode]        NVARCHAR (50)  NULL,
    [SessionMarkingTermIndicatorDescription] NVARCHAR (200) NULL,
    [SessionSchedulingTermIndicatorCode]        NVARCHAR (50)  NULL,
    [SessionSchedulingTermIndicatorDescription] NVARCHAR (200) NULL,
    [SessionAttendanceTermIndicatorCode]        NVARCHAR (50)  NULL,
    [SessionAttendanceTermIndicatorDescription] NVARCHAR (200) NULL,
    CONSTRAINT [PK_DimCalendarSessionIndicators] PRIMARY KEY CLUSTERED ([DimCalendarSessionIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A prescribed span of time when an education institution is open, instruction is provided, and students are under the direction and guidance of teachers and/or education institution administration. A session may be interrupted by one or more vacations.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000254' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000254' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A prescribed span of time when an education institution is open, instruction is provided, and students are under the direction and guidance of teachers and/or education institution administration. A session may be interrupted by one or more vacations.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000254' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000254' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionTypeDescription';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is a marking term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Marking Term Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001272' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001272' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is a marking term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Marking Term Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001272' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001272' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionMarkingTermIndicatorDescription';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is a scheduling term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Scheduling Term Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is a scheduling term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Scheduling Term Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001273' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionSchedulingTermIndicatorDescription';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is an attendance term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Attendance Term Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001274' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001274' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorCode';
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Indicates that the session is an attendance term.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Session Attendance Term Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001274' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001274' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCalendarSessionIndicators', @level2type=N'COLUMN',@level2name=N'SessionAttendanceTermIndicatorDescription';
GO

