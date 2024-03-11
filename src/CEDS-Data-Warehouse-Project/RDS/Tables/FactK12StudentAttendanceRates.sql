CREATE TABLE [RDS].[FactK12StudentAttendanceRates] (
    [FactK12StudentAttendanceRateId]	INT             IDENTITY (1, 1) NOT NULL,
    [SchoolYearId]						INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_SchoolYearId] DEFAULT ((-1)) NOT NULL,
    [FactTypeId]						INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_FactTypeId] DEFAULT ((-1)) NOT NULL,
    [SeaId]								INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_SeaId] DEFAULT ((-1)) NOT NULL,
    [LeaId]								INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_LeaId] DEFAULT ((-1)) NOT NULL,
    [K12SchoolId]						INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_K12SchoolId] DEFAULT ((-1)) NOT NULL,
    [K12StudentId]						BIGINT          CONSTRAINT [DF_FactK12StudentAttendanceRates_K12StudentId] DEFAULT ((-1)) NOT NULL,
    [AttendanceId]						INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_AttendanceId] DEFAULT ((-1)) NOT NULL,
    [K12DemographicId]					INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_K12DemographicId] DEFAULT ((-1)) NOT NULL,
    [GradeLevelId]						INT             CONSTRAINT [DF_FactK12StudentAttendanceRates_GradeLevelId] DEFAULT ((-1)) NOT NULL,
    [StudentAttendanceRate]				DECIMAL (18, 3) NULL,
    CONSTRAINT [FK_FactK12StudentAttendanceRates_AttendanceId] FOREIGN KEY ([AttendanceId]) REFERENCES [RDS].[DimAttendances] ([DimAttendanceId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_FactTypeId] FOREIGN KEY ([FactTypeId]) REFERENCES [RDS].[DimFactTypes] ([DimFactTypeId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_K12DemographicId] FOREIGN KEY ([K12DemographicId]) REFERENCES [RDS].[DimK12Demographics] ([DimK12DemographicId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_K12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_K12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [RDS].[DimPeople] ([DimPersonId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_LeaId] FOREIGN KEY ([LeaId]) REFERENCES [RDS].[DimLeas] ([DimLeaID]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_SchoolYearId] FOREIGN KEY ([SchoolYearId]) REFERENCES [RDS].[DimSchoolYears] ([DimSchoolYearId]),
    CONSTRAINT [FK_FactK12StudentAttendanceRates_SeaId] FOREIGN KEY ([SeaId]) REFERENCES [RDS].[DimSeas] ([DimSeaId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_K12SchoolId]
    ON [RDS].[FactK12StudentAttendanceRates]([K12SchoolId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_LeaId]
    ON [RDS].[FactK12StudentAttendanceRates]([LeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_K12StudentId]
    ON [RDS].[FactK12StudentAttendanceRates]([K12StudentId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_SchoolYearId]
    ON [RDS].[FactK12StudentAttendanceRates]([SchoolYearId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_SeaId]
    ON [RDS].[FactK12StudentAttendanceRates]([SeaId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_AttendanceId]
    ON [RDS].[FactK12StudentAttendanceRates]([AttendanceId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_FactTypeId]
    ON [RDS].[FactK12StudentAttendanceRates]([FactTypeId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_K12DemographicId]
    ON [RDS].[FactK12StudentAttendanceRates]([K12DemographicId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12StudentAttendanceRates_GradeLevelId]
    ON [RDS].[FactK12StudentAttendanceRates]([GradeLevelId] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year for a reported school session.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21243' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'SchoolYearId';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of school days during the regular school year (plus summer, if applicable, if part of implementing the restart, transformation, or turnaround model) the student attended school divided by the maximum number of days the student could have attended school during the regular school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Student Attendance Rate' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000271' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21271' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12StudentAttendanceRates', @level2type=N'COLUMN',@level2name=N'StudentAttendanceRate';
GO