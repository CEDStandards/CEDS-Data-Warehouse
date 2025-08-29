CREATE TABLE [RDS].[BridgeK12StudentDisciplineDisciplineReasons] (
    [BridgeK12StudentDisciplineDisciplineReasonId] INT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentDisciplineId]                  INT NULL,
    [DisciplineReasonId]                          INT NULL,
    CONSTRAINT [PK_BridgeK12StudentDisciplineDisciplineReasons] PRIMARY KEY CLUSTERED ([BridgeK12StudentDisciplineDisciplineReasonId] ASC),
    CONSTRAINT [FK_BridgeK12StudentDisciplineDisciplineReasons_DimDisciplineReasons] FOREIGN KEY ([DisciplineReasonId]) REFERENCES [RDS].[DimDisciplineReasons] ([DimDisciplineReasonId]),
    CONSTRAINT [FK_BridgeK12StudentDisciplineDisciplineReasons_FactK12StudentDisciplines] FOREIGN KEY ([FactK12StudentDisciplineId]) REFERENCES [RDS].[FactK12StudentDisciplines] ([FactK12StudentDisciplineId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineDisciplineReasons_DimDisciplineReasons]
    ON [RDS].[BridgeK12StudentDisciplineDisciplineReasons]([DisciplineReasonId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentDisciplineDisciplineReasons_FactK12StudentDisciplines]
    ON [RDS].[BridgeK12StudentDisciplineDisciplineReasons]([FactK12StudentDisciplineId] ASC);
