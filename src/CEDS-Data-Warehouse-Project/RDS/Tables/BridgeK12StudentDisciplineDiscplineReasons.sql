CREATE TABLE [RDS].[BridgeK12StudentDisciplineDiscplineReasons] (
    [BridgeK12StudentDisciplineDiscplineReasonId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentDisciplineId]                  INT NULL,
    [DisciplineReasonId]                          INT NULL,
    CONSTRAINT [PK_BridgeK12StudentDisciplineDiscplineReasonId] PRIMARY KEY CLUSTERED ([BridgeK12StudentDisciplineDiscplineReasonId] ASC),
    CONSTRAINT [FK_BridgeK12StudentDisciplineDiscplineReasons_DimDisciplineReasons] FOREIGN KEY ([DisciplineReasonId]) REFERENCES [RDS].[DimDisciplineReasons] ([DimDisciplineReasonId]),
    CONSTRAINT [FK_BridgeK12StudentDisciplineDiscplineReasons_FactK12StudentDisciplines] FOREIGN KEY ([FactK12StudentDisciplineId]) REFERENCES [RDS].[FactK12StudentDisciplines] ([FactK12StudentDisciplineId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineDiscplineReasons_DimDisciplineReasons]
    ON [RDS].[BridgeK12StudentDisciplineDiscplineReasons]([DisciplineReasonId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineDiscplineReasons_FactK12StudentDisciplines]
    ON [RDS].[BridgeK12StudentDisciplineDiscplineReasons]([FactK12StudentDisciplineId] ASC);


GO

