CREATE TABLE [RDS].[ToggleSectionTypes] (
    [ToggleSectionTypeId]  INT            IDENTITY (1, 1) NOT NULL,
    [EmapsSurveyTypeAbbrv] NVARCHAR (50)  NOT NULL,
    [SectionTypeName]      NVARCHAR (500) NOT NULL,
    [SectionTypeSequence]  INT            NOT NULL,
    [SectionTypeShortName] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_ToggleSectionTypes] PRIMARY KEY CLUSTERED ([ToggleSectionTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

