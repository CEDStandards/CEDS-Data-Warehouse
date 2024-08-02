CREATE TABLE [RDS].[FactQuarterlyEmployments]
(
	[FactQuarterlyEmploymentId] int NOT NULL IDENTITY (1, 1),
	[EmploymentRecordReferencePeriodStartDateId] int NOT NULL,
	[EmploymentRecordReferencePeriodEndDateId] int NOT NULL,
	[EmployerId] int NULL,
	[PersonId] bigint NOT NULL,
	[OnetSocOccupationTypeId] int NOT NULL,
	[StandardOccupationalClassificationId] int NOT NULL,
    [NaicsCodeId] int NOT NULL,
    [EmploymentLocationId] int NOT NULL,
    [EmploymentRecordSourceId] int NOT NULL,
	[EmploymentStartDateId] int NOT NULL,
	[EmploymentEndDateId] int NOT NULL,
	[HireDateId] int NOT NULL,
    [QuarterlyEarnings] decimal(18,2) NULL,
    [PersonEmployedInMultipleJobsCount] int NULL,
    [FullTimeEquivalency] decimal(3,2) NULL,
	[DataCollectionId] int NULL,
	[RecordStatusId] int NOT NULL,

	--Need to add in the demographic data as well

	CONSTRAINT [PK_FactQuarterlyEmployments] PRIMARY KEY CLUSTERED ([FactQuarterlyEmploymentId] ASC),
    CONSTRAINT [FK_FactQuarterlyEmployments_EmploymentRecordReferencePeriodStartDateId] FOREIGN KEY ([EmploymentRecordReferencePeriodStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactQuarterlyEmployments_EmploymentRecordReferencePeriodEndDateId] FOREIGN KEY ([EmploymentRecordReferencePeriodEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactQuarterlyEmployments_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [RDS].[DimEmployers] ([DimEmployerId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_PersonId] FOREIGN KEY ([PersonId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_OnetSocOccupationTypeId] FOREIGN KEY ([OnetSocOccupationTypeId]) REFERENCES [RDS].[DimOnetSocOccupationTypes] ([DimOnetSocOccupationTypeId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_StandardOccupationalClassificationId] FOREIGN KEY ([StandardOccupationalClassificationId]) REFERENCES [RDS].[DimStandardOccupationalClassifications] ([DimStandardOccupationalClassificationId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactQuarterlyEmployments_NaicsCodeId] FOREIGN KEY ([NaicsCodeId]) REFERENCES [RDS].[DimNaicsCodes] ([DimNaicsCodeId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactQuarterlyEmployments_EmploymentLocationId] FOREIGN KEY ([EmploymentLocationId]) REFERENCES [RDS].[DimEmploymentLocations] ([DimEmploymentLocationId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactQuarterlyEmployments_EmploymentRecordSourceId] FOREIGN KEY ([EmploymentRecordSourceId]) REFERENCES [RDS].[DimEmploymentRecordSources] ([DimEmploymentRecordSourceId]) ON DELETE No Action ON UPDATE No Action,
    CONSTRAINT [FK_FactQuarterlyEmployments_EmploymentStartDateId] FOREIGN KEY ([EmploymentStartDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_EmploymentEndDateId] FOREIGN KEY ([EmploymentEndDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_HireDateId] FOREIGN KEY ([HireDateId]) REFERENCES [RDS].[DimDates] ([DimDateId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_DataCollectionId] FOREIGN KEY ([DataCollectionId]) REFERENCES [RDS].[DimDataCollections] ([DimDataCollectionId]) ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT [FK_FactQuarterlyEmployments_RecordStatusId] FOREIGN KEY ([RecordStatusId]) REFERENCES [RDS].[DimRecordStatuses] ([DimRecordStatusId]) ON DELETE No Action ON UPDATE No Action

)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_EmployerId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmployerId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_OnetSocOccupationTypeId] 
 ON [RDS].[FactQuarterlyEmployments] ([OnetSocOccupationTypeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_StandardOccupationalClassificationId] 
 ON [RDS].[FactQuarterlyEmployments] ([StandardOccupationalClassificationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_EmploymentStartDateId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmploymentStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_EmploymentEndDateId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmploymentEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_HireDateId] 
 ON [RDS].[FactQuarterlyEmployments] ([HireDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_DataCollectionId] 
 ON [RDS].[FactQuarterlyEmployments] ([DataCollectionId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_FactQuarterlyEmployments_RecordStatusId] 
 ON [RDS].[FactQuarterlyEmployments] ([RecordStatusId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_PersonId] 
 ON [RDS].[FactQuarterlyEmployments] ([PersonId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_EmploymentRecordReferencePeriodStartDateId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmploymentRecordReferencePeriodStartDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_EmploymentRecordReferencePeriodEndDateId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmploymentRecordReferencePeriodEndDateId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_NaicsCodeId] 
 ON [RDS].[FactQuarterlyEmployments] ([NaicsCodeId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_EmploymentLocationId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmploymentLocationId] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FactQuarterlyEmployments_EmploymentRecordSourceId] 
 ON [RDS].[FactQuarterlyEmployments] ([EmploymentRecordSourceId] ASC)
GO




EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The time a person is enrolled, employed, involved, or participates in the organization, divided by the time the organization defines as full-time for that role.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Full Time Equivalency' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001921' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'FullTimeEquivalency';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person began self-employment or employment with an organization or institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000346' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day on which a person ended self-employment or employment with an organization or institution.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000795' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000795' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarnings';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The quarterly amount paid to individuals found employed during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarnings';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Quarterly Earnings' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarnings';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarnings';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'QuarterlyEarnings';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'PersonEmployedInMultipleJobsCount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of jobs held by a person during the reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'PersonEmployedInMultipleJobsCount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Person Employed in Multiple Jobs Count' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'PersonEmployedInMultipleJobsCount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000991' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'PersonEmployedInMultipleJobsCount';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000991' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'PersonEmployedInMultipleJobsCount';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month, and day of the first day of the employment record reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Record Reference Period Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000992' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000992' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodStartDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month, and day of the last day of the employment record reference period.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employment Record Reference Period End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000993' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodEndDateId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000993' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactQuarterlyEmployments', @level2type=N'COLUMN',@level2name=N'EmploymentRecordReferencePeriodEndDateId';
GO