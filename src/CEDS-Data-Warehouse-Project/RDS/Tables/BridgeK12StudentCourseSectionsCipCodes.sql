CREATE TABLE [RDS].[BridgeK12StudentCourseSectionsCipCodes] (
    [BridgeK12StudentCourseSectionsCipCodeId] BIGINT IDENTITY (1, 1) NOT NULL,
    [FactK12StudentCourseSectionId]           BIGINT CONSTRAINT [DF_BridgeK12StudentCourseSectionsCipCodes_FactK12StudentCourseSectionId] DEFAULT ((-1)) NOT NULL,
    [CipCodeId]                               INT    CONSTRAINT [DF_BridgeK12StudentCourseSectionsCipCodes_CipCodeId] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_BridgeK12StudentCourseSectionsCipCodes] PRIMARY KEY CLUSTERED ([BridgeK12StudentCourseSectionsCipCodeId] ASC),
    CONSTRAINT [FK_BridgeK12StudentCourseSectionsCipCodes_CipCodeId] FOREIGN KEY ([CipCodeId]) REFERENCES [RDS].[DimCipCodes] ([DimCipCodeId]),
    CONSTRAINT [FK_BridgeK12StudentCourseSectionsCipCodes_FactK12StudentCourseSections] FOREIGN KEY ([FactK12StudentCourseSectionId]) REFERENCES [RDS].[FactK12StudentCourseSections] ([FactK12StudentCourseSectionId])
);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionsCipCodes_FactK12CourseSection]
    ON [RDS].[BridgeK12StudentCourseSectionsCipCodes]([FactK12StudentCourseSectionId] ASC);


GO

CREATE NONCLUSTERED INDEX [IXFK_BridgeK12StudentCourseSectionsCipCodes_CipCodeId]
    ON [RDS].[BridgeK12StudentCourseSectionsCipCodes]([CipCodeId] ASC);


GO

