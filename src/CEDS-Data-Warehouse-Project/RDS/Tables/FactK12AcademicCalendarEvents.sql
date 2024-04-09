CREATE TABLE [RDS].[FactK12AcademicCalendarEvents](
	[FactK12AcademicCalendarEventId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
    [CalendarEventDateId] [int] NOT NULL,
    [StartTimeId] [int] NOT NULL,
    [EndTimeId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
    [CalendarEventIndicatorId] [int] NOT NULL,
    [CalendarSessionIndicatorId] [int] NOT NULL,
    [CalendarSessionId] [int] NOT NULL,
    [MinutesPerDay] [int] NOT NULL,
    [InstructionalMinutesPerDay] [int] NOT NULL,
    [LunchMinutesPerDay] [int] NOT NULL,
    [RecessMinutesPerDay] [int] NOT NULL,
    [CalendarEventDayId] [int] NOT NULL,
	[AcademicTermDesignatorId] [int] NOT NULL,
    [CalendarCrisisId] [int] NOT NULL,
    [DataCollectionId] [int] NOT NULL,
 CONSTRAINT [PK_FactK12AcademicCalendarEvents] PRIMARY KEY NONCLUSTERED 
(
	[FactK12AcademicCalendarEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_SchoolYearId] ON [RDS].[FactK12AcademicCalendarEvents]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_CalendarEventDateId] ON [RDS].[FactK12AcademicCalendarEvents]([CalendarEventDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_StartTimeId] ON [RDS].[FactK12AcademicCalendarEvents]([StartTimeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_EndTimeId] ON [RDS].[FactK12AcademicCalendarEvents]([EndTimeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_SeaId] ON [RDS].[FactK12AcademicCalendarEvents]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_IeuId] ON [RDS].[FactK12AcademicCalendarEvents]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_LeaId] ON [RDS].[FactK12AcademicCalendarEvents]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_K12SchoolId] ON [RDS].[FactK12AcademicCalendarEvents]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_CalendarEventIndicatorId] ON [RDS].[FactK12AcademicCalendarEvents]([CalendarEventIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_CalendarSessionIndicatorId] ON [RDS].[FactK12AcademicCalendarEvents]([CalendarSessionIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_CalendarSessionId] ON [RDS].[FactK12AcademicCalendarEvents]([CalendarSessionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_AcademicTermDesignatorId] ON [RDS].[FactK12AcademicCalendarEvents]([AcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_CalendarCrisisId] ON [RDS].[FactK12AcademicCalendarEvents]([CalendarCrisisId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendarEvents_DataCollectionId] ON [RDS].[FactK12AcademicCalendarEvents]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_SchoolYearId]  DEFAULT ((-1)) FOR [SchoolYearId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_CalendarEventDateId]  DEFAULT ((-1)) FOR [CalendarEventDateId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_StartTimeId]  DEFAULT ((-1)) FOR [StartTimeId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_EndTimeId]  DEFAULT ((-1)) FOR [EndTimeId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_CalendarEventIndicatorId]  DEFAULT ((-1)) FOR [CalendarEventIndicatorId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_CalendarSessionIndicatorId]  DEFAULT ((-1)) FOR [CalendarSessionIndicatorId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_CalendarSessionId]  DEFAULT ((-1)) FOR [CalendarSessionId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_AcademicTermDesignatorId]  DEFAULT ((-1)) FOR [AcademicTermDesignatorId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_CalendarCrisisId]  DEFAULT ((-1)) FOR [CalendarCrisisId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] ADD  CONSTRAINT [DF_FactK12AcademicCalendarEvents_DataCollectionId]  DEFAULT ((-1)) FOR [DataCollectionId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_SchoolYearId] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarEventDateId] FOREIGN KEY([CalendarEventDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarEventDateId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_StartTimeId] FOREIGN KEY([StartTimeId])
REFERENCES [RDS].[DimTimes] ([DimTimeId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_StartTimeId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_EndTimeId] FOREIGN KEY([EndTimeId])
REFERENCES [RDS].[DimTimes] ([DimTimeId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_EndTimeId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_SeaId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_IeuId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_LeaId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarEventIndicatorId] FOREIGN KEY([CalendarEventIndicatorId])
REFERENCES [RDS].[DimCalendarEventIndicators] ([DimCalendarEventIndicatorId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarEventIndicatorId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarSessionIndicatorId] FOREIGN KEY([CalendarSessionIndicatorId])
REFERENCES [RDS].[DimCalendarSessionIndicators] ([DimCalendarSessionIndicatorId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarSessionIndicatorId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarSessionId] FOREIGN KEY([CalendarSessionId])
REFERENCES [RDS].[DimCalendarSessions] ([DimCalendarSessionId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarSessionId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_AcademicTermDesignatorId] FOREIGN KEY([AcademicTermDesignatorId])
REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_AcademicTermDesignatorId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarCrisisId] FOREIGN KEY([CalendarCrisisId])
REFERENCES [RDS].[DimCalendarCrises] ([DimCalendarCrisisId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_CalendarCrisisId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendarEvents_DataCollectionId] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendarEvents] CHECK CONSTRAINT [FK_FactK12AcademicCalendarEvents_DataCollectionId]
GO

-- Extended Properties

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date of the scheduled or unscheduled calendar event.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'CalendarEventDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Calendar Event Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'CalendarEventDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001275' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'CalendarEventDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001275' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'CalendarEventDateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'CalendarEventDateId'
GO


EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The starting hour, minute and second.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'StartTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Start Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'StartTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001919' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'StartTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001919' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'StartTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'StartTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The ending hour, minute and second.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'EndTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'End Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'EndTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001920' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'EndTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001920' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'EndTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'EndTimeId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000500' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000500' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'MinutesPerDay'
GO


EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of instructional minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Instructional Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002099' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'InstructionalMinutesPerDay'
GO


EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of lunch minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Lunch Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002100' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002100' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'LunchMinutesPerDay'
GO


EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of recess minutes in the day in which the school is normally in session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Recess Minutes Per Day' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'002101' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/002101' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendarEvents', @level2type=N'COLUMN',@level2name=N'RecessMinutesPerDay'
GO



