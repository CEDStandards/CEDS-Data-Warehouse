CREATE TABLE [RDS].[FactK12AcademicCalendars](
	[FactK12AcademicCalendarId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[CalendarSessionId] [int] NOT NULL,
	[CalendarSessionIndicatorId] [int] NOT NULL,
	[AcademicTermDesignatorId] [int] NOT NULL,
    [CalendarCrisisId] [int] NOT NULL,
    [DataCollectionId] [int] NOT NULL,
 CONSTRAINT [PK_FactK12AcademicCalendars] PRIMARY KEY NONCLUSTERED 
(
	[FactK12AcademicCalendarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_SchoolYearId] ON [RDS].[FactK12AcademicCalendars]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_DataCollectionId] ON [RDS].[FactK12AcademicCalendars]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_SeaId] ON [RDS].[FactK12AcademicCalendars]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_IeuId] ON [RDS].[FactK12AcademicCalendars]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_LeaId] ON [RDS].[FactK12AcademicCalendars]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_K12SchoolId] ON [RDS].[FactK12AcademicCalendars]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_CalendarSessionId] ON [RDS].[FactK12AcademicCalendars]([CalendarSessionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_CalendarSessionIndicatorId] ON [RDS].[FactK12AcademicCalendars]([CalendarSessionIndicatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_AcademicTermDesignatorId] ON [RDS].[FactK12AcademicCalendars]([AcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12AcademicCalendars_CalendarCrisisId] ON [RDS].[FactK12AcademicCalendars]([CalendarCrisisId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_SchoolYearId]  DEFAULT ((-1)) FOR [SchoolYearId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_DataCollectionId]  DEFAULT ((-1)) FOR [DataCollectionId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_CalendarSessionId]  DEFAULT ((-1)) FOR [CalendarSessionId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_CalendarSessionIndicatorId]  DEFAULT ((-1)) FOR [CalendarSessionIndicatorId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_AcademicTermDesignatorId]  DEFAULT ((-1)) FOR [AcademicTermDesignatorId]
GO
ALTER TABLE [RDS].[FactK12AcademicCalendars] ADD  CONSTRAINT [DF_FactK12AcademicCalendars_CalendarCrisisId]  DEFAULT ((-1)) FOR [CalendarCrisisId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_SchoolYearId] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_DataCollectionId] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_DataCollectionId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_SeaId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_IeuId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_LeaId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_CalendarSessionId] FOREIGN KEY([CalendarSessionId])
REFERENCES [RDS].[DimCalendarSessions] ([DimCalendarSessionId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_CalendarSessionId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_CalendarSessionIndicatorId] FOREIGN KEY([CalendarSessionIndicatorId])
REFERENCES [RDS].[DimCalendarSessionIndicators] ([DimCalendarSessionIndicatorId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_CalendarSessionIndicatorId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_AcademicTermDesignatorId] FOREIGN KEY([AcademicTermDesignatorId])
REFERENCES [RDS].[DimAcademicTermDesignators] ([DimAcademicTermDesignatorId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_AcademicTermDesignatorId]
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars]  WITH CHECK ADD  CONSTRAINT [FK_FactK12AcademicCalendars_CalendarCrisisId] FOREIGN KEY([CalendarCrisisId])
REFERENCES [RDS].[DimCrises] ([DimCalendarCrisisId])
GO

ALTER TABLE [RDS].[FactK12AcademicCalendars] CHECK CONSTRAINT [FK_FactK12AcademicCalendars_CalendarCrisisId]
GO

-- Extended Properties

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendars', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendars', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendars', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendars', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12AcademicCalendars', @level2type=N'COLUMN',@level2name=N'SchoolYearId'
GO









