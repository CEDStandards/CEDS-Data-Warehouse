CREATE TABLE [RDS].[FactK12Incidents]
(
	[FactK12IncidentId] INT NOT NULL IDENTITY (1, 1),
    [SchoolYearId] INT NOT NULL,
    [CountDateId] INT NOT NULL,
    [RecordStartDateTime] DATETIME NOT NULL,
    [RecordEndDateTime] DATETIME NOT NULL,
    [IncidentDateId] INT NOT NULL,
    [IncidentTimeId] INT NOT NULL,
    [SeaId] INT NOT NULL,
	[IeuId] INT NOT NULL,
	[LeaID] INT NOT NULL,
	[K12SchoolId] INT NOT NULL,
    [IncidentId] INT NOT NULL,
    [IncidentSettingId] INT NOT NULL,
    [IncidentTimeIndicatorId] INT NOT NULL,
    [IncidentStatusId] INT NOT NULL,
    [IncidentCost] DECIMAL(18,2) NOT NULL,
	[DataCollectionId] [int] NOT NULL,
    [RecordStatusId] [int] NOT NULL,

	CONSTRAINT [PK_FactK12Incidents] PRIMARY KEY CLUSTERED ([FactK12IncidentId] ASC),
    CONSTRAINT [FK_FactK12Incidents_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_CountDateId] FOREIGN KEY ([CountDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IncidentDateId] FOREIGN KEY ([IncidentDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IncidentTimeId] FOREIGN KEY ([IncidentTimeId]) REFERENCES [RDS].[DimTimes] ([DimTimeId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IeuId] FOREIGN KEY ([IeuId]) REFERENCES [RDS].[DimIeus] ([DimIeuId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_LeaId] FOREIGN KEY ([LeaID]) REFERENCES [RDS].[DimLeas] ([DimLeaID]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IncidentId] FOREIGN KEY ([IncidentId]) REFERENCES [RDS].[DimIncidents] ([DimIncidentId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IncidentSettingId] FOREIGN KEY ([IncidentSettingId]) REFERENCES [RDS].[DimIncidentSettings] ([DimIncidentSettingId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IncidentTimeIndicatorId] FOREIGN KEY ([IncidentTimeIndicatorId]) REFERENCES [RDS].[DimIncidentTimeIndicators] ([DimIncidentTimeIndicatorId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_IncidentStatusId] FOREIGN KEY ([IncidentStatusId]) REFERENCES [RDS].[DimIncidentStatuses] ([DimIncidentStatusId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactK12Incidents_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]) ON DELETE No Action ON UPDATE No Action
    )
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimDataCollectionId] 
 ON [RDS].[FactK12Incidents] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIncidentId] 
 ON [RDS].[FactK12Incidents] ([IncidentId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIncidentSettingId] 
 ON [RDS].[FactK12Incidents] ([IncidentSettingId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIncidentStatusId] 
 ON [RDS].[FactK12Incidents] ([IncidentStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIncidentTimeIndicatorId] 
 ON [RDS].[FactK12Incidents] ([IncidentTimeIndicatorId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIncidentTimeId] 
 ON [RDS].[FactK12Incidents] ([IncidentTimeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimLeaId] 
 ON [RDS].[FactK12Incidents] ([LeaID] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimSchoolYearId] 
 ON [RDS].[FactK12Incidents] ([SchoolYearId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimSeaId] 
 ON [RDS].[FactK12Incidents] ([SeaId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimK12SchoolId] 
 ON [RDS].[FactK12Incidents] ([K12SchoolId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimCountDateId] 
 ON [RDS].[FactK12Incidents] ([CountDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIncidentDateId] 
 ON [RDS].[FactK12Incidents] ([IncidentDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimIeuId] 
 ON [RDS].[FactK12Incidents] ([IeuId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12Incidents_DimRecordStatusId] 
 ON [RDS].[FactK12Incidents] ([RecordStatusId] ASC)
GO



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of any quantifiable monetary loss directly resulting from the incident. Examples include the value of repairs necessitated by vandalism of a school facility, the value of personnel resources used for repairs or consumed by the incident, the value of stolen items, and the value of time consumed by an incident (e.g., instructional time involved in evacuating a school during a false fire alarm).  Cost may be reported by specific monetary amount or range.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Cost' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000505' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentCost';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000505' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentCost';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The end date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record End Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001918' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordEndDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date and, optionally, time that a record is active as used to support version control.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Record Start Date Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001917' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'RecordStartDateTime';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which the incident occurred.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000502' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000502' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the time of day the incident took place.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Time' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000503' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentTimeId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000503' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12Incidents', @level2type=N'COLUMN',@level2name=N'IncidentTimeId';
GO



