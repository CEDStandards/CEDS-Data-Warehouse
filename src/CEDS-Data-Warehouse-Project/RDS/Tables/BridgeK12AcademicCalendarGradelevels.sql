CREATE TABLE [RDS].[BridgeK12AcademicCalendarGradeLevels] (
    [BridgeK12AcademicCalendarGradeLevelId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12AcademicCalendarId]           INT NOT NULL,
    [GradeLevelId]                              INT NOT NULL,
    CONSTRAINT [PK_BridgeK12AcademicCalendarGradeLevels] PRIMARY KEY CLUSTERED ([BridgeK12AcademicCalendarGradeLevelId] ASC),
    CONSTRAINT [FK_BridgeK12AcademicCalendarGradeLevels_FactK12AcademicCalendarId] FOREIGN KEY ([FactK12AcademicCalendarId]) REFERENCES [RDS].[FactK12AcademicCalendars] ([FactK12AcademicCalendarId]),
    CONSTRAINT [FK_BridgeK12AcademicCalendarGradeLevels_GradeLevelId] FOREIGN KEY ([GradeLevelId]) REFERENCES [RDS].[DimGradeLevels] ([DimGradeLevelId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AcademicCalendarGradeLevels_FactK12AcademicCalendarId]
    ON [RDS].[BridgeK12AcademicCalendarGradeLevels]([FactK12AcademicCalendarId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12AcademicCalendarGradeLevels_GradeLevelId]
    ON [RDS].[BridgeK12AcademicCalendarGradeLevels]([GradeLevelId] ASC);


GO
