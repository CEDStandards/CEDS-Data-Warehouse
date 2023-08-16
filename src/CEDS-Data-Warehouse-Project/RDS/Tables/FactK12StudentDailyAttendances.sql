CREATE TABLE [RDS].[FactK12StudentDailyAttendances](
	[FactK12StudentDailyAttendanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[AttendanceEventDateId] [int] NOT NULL,
	[DataCollectionId] [int] NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[AttendanceId] [int] NOT NULL,
	[AttendanceEventDurationDay] [decimal](9, 2) NOT NULL,
	[AttendanceEventDurationMinutes] [decimal](9, 2) NOT NULL,
	[AttendanceEventDurationHours] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_FactK12StudentDailyAttendances] PRIMARY KEY NONCLUSTERED 
(
	[FactK12StudentDailyAttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_SchoolYearId] ON [RDS].[FactK12StudentDailyAttendances]([SchoolYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_AttendanceEventDateId] ON [RDS].[FactK12StudentDailyAttendances]([AttendanceEventDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_DataCollectionId] ON [RDS].[FactK12StudentDailyAttendances]([DataCollectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_SeaId] ON [RDS].[FactK12StudentDailyAttendances]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_IeuId] ON [RDS].[FactK12StudentDailyAttendances]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_LeaId] ON [RDS].[FactK12StudentDailyAttendances]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_K12SchoolId] ON [RDS].[FactK12StudentDailyAttendances]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_PersonId] ON [RDS].[FactK12StudentDailyAttendances]([PersonId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentDailyAttendances_AttendanceId] ON [RDS].[FactK12StudentDailyAttendances]([AttendanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_SchoolYearId]  DEFAULT ((-1)) FOR [SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_AttendanceEventDateId]  DEFAULT ((-1)) FOR [AttendanceEventDateId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_DataCollectionId]  DEFAULT ((-1)) FOR [DataCollectionId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_PersonId]  DEFAULT ((-1)) FOR [PersonId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] ADD  CONSTRAINT [DF_FactK12StudentDailyAttendances_AttendanceId]  DEFAULT ((-1)) FOR [AttendanceId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_SchoolYearId] FOREIGN KEY([SchoolYearId])
REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_SchoolYearId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_AttendanceEventDateId] FOREIGN KEY([AttendanceEventDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_AttendanceEventDateId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_DataCollectionId] FOREIGN KEY([DataCollectionId])
REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_DataCollectionId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_SeaId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_IeuId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_LeaId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_PersonId] FOREIGN KEY([PersonId])
REFERENCES [RDS].[DimPeople] ([DimPersonId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_PersonId]
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12StudentDailyAttendances_AttendanceId] FOREIGN KEY([AttendanceId])
REFERENCES [RDS].[DimAttendances] ([DimAttendanceId])
GO

ALTER TABLE [RDS].[FactK12StudentDailyAttendances] CHECK CONSTRAINT [FK_FactK12StudentDailyAttendances_AttendanceId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The duration of the attendance event captured as one whole day or a portion of a day.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Duration Day' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationDay'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The duration of the attendance event in minutes.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Duration Minutes' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationMinutes'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The duration of the attendance event in hours.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Attendance Event Duration Hours' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'TBD V12' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://github.com/CEDStandards/CEDS-Elements/issues/552' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentDailyAttendances', @level2type=N'COLUMN',@level2name=N'AttendanceEventDurationHours'
GO









