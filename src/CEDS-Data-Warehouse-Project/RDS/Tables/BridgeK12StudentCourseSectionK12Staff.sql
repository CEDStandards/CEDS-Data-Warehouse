CREATE TABLE [RDS].[BridgeK12StudentCourseSectionK12Staff] (
    [BridgeK12StudentCourseSectionK12StaffId] INT    IDENTITY (1, 1) NOT NULL,
    [K12StaffId]                              BIGINT CONSTRAINT [DF_CONSTRAINT [DF_BridgeK12StudentCourseSectionK12Staff_K12StaffId] DEFAULT ((-1)) NOT NULL,
    [FactK12StudentCourseSectionId]           BIGINT CONSTRAINT [DF_CONSTRAINT [DF_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSectionId] DEFAULT ((-1)) NOT NULL,
    [TeacherOfRecord]                         BIT    NULL,
    CONSTRAINT [PK_BridgeK12StudentCourseSectionK12Staff] PRIMARY KEY CLUSTERED ([BridgeK12StudentCourseSectionK12StaffId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSections] FOREIGN KEY ([FactK12StudentCourseSectionId]) REFERENCES [RDS].[FactK12StudentCourseSections] ([FactK12StudentCourseSectionId]),
    CONSTRAINT [FK_BridgeK12StudentCourseSectionK12Staff_K12Staff] FOREIGN KEY ([K12StaffId]) REFERENCES [RDS].[DimPeople] ([DimPersonId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionK12Staff_K12StaffId]
    ON [RDS].[BridgeK12StudentCourseSectionK12Staff]([K12StaffId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionK12Staff_FactK12StudentCourseSections]
    ON [RDS].[BridgeK12StudentCourseSectionK12Staff]([FactK12StudentCourseSectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

