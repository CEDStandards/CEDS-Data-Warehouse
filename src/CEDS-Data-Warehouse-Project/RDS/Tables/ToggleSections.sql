CREATE TABLE [RDS].[ToggleSections] (
    [ToggleSectionId]               INT             IDENTITY (1, 1) NOT NULL,
    [EmapsParentSurveySectionAbbrv] NVARCHAR (50)   NULL,
    [EmapsSurveySectionAbbrv]       NVARCHAR (50)   NOT NULL,
    [SectionName]                   NVARCHAR (2000) NOT NULL,
    [SectionSequence]               INT             NOT NULL,
    [SectionTitle]                  NVARCHAR (500)  NOT NULL,
    [ToggleSectionTypeId]           INT             NOT NULL,
    CONSTRAINT [PK_ToggleSections] PRIMARY KEY CLUSTERED ([ToggleSectionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ToggleSections_ToggleSectionTypes_ToggleSectionTypeId] FOREIGN KEY ([ToggleSectionTypeId]) REFERENCES [RDS].[ToggleSectionTypes] ([ToggleSectionTypeId]) ON DELETE CASCADE
);


GO

