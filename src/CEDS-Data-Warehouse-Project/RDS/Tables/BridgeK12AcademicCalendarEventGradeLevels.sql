CREATE TABLE [RDS].[BridgeK12AcademicCalendarEventGradeLevels] (
    [BridgeK12AcademicCalendarEventGradeLevelId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12AcademicCalendarEventId]           INT NOT NULL,
    [GradeLevelId]                              INT NOT NULL,
    CONSTRAINT [PK_BridgeK12AcademicCalendarEventGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12AcademicCalendarEventGradeLevelId] ASC),
    CONSTRAINT [FK_BridgeK12AcademicCalendarEventGradeLevels_FactK12AcademicCalendarEventId] FOREIGN KEY ([FactK12AcademicCalendarEventId]) REFERENCES [RDS].[FactK12AcademicCalendarEvents] ([FactK12AcademicCalendarEventId]),
    CONSTRAINT [FK_BridgeK12AcademicCalendarEventGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AcademicCalendarEventGradeLevels_FactK12AcademicCalendarEventId]
    ON [RDS].[BridgeK12AcademicCalendarEventGradeLevels]([FactK12AcademicCalendarEventId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AcademicCalendarEventGradeLevels_GradeLevelId]
    ON [RDS].[BridgeK12AcademicCalendarEventGradeLevels]([GradeLevelId] ASC);


GO