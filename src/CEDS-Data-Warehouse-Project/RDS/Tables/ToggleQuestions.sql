CREATE TABLE [RDS].[ToggleQuestions] (
    [ToggleQuestionId]       INT            IDENTITY (1, 1) NOT NULL,
    [EmapsQuestionAbbrv]     NVARCHAR (50)  NOT NULL,
    [ParentToggleQuestionId] INT            NULL,
    [QuestionSequence]       INT            NOT NULL,
    [QuestionText]           NVARCHAR (MAX) NOT NULL,
    [ToggleQuestionTypeId]   INT            NOT NULL,
    [ToggleSectionId]        INT            NOT NULL,
    CONSTRAINT [PK_ToggleQuestions] PRIMARY KEY CLUSTERED ([ToggleQuestionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ToggleQuestions_ToggleQuestions_ParentToggleQuestionId] FOREIGN KEY ([ParentToggleQuestionId]) REFERENCES [RDS].[ToggleQuestions] ([ToggleQuestionId]),
    CONSTRAINT [FK_ToggleQuestions_ToggleQuestionTypes_ToggleQuestionTypeId] FOREIGN KEY ([ToggleQuestionTypeId]) REFERENCES [RDS].[ToggleQuestionTypes] ([ToggleQuestionTypeId]) ON DELETE CASCADE,
    CONSTRAINT [FK_ToggleQuestions_ToggleSections_ToggleSectionId] FOREIGN KEY ([ToggleSectionId]) REFERENCES [RDS].[ToggleSections] ([ToggleSectionId]) ON DELETE CASCADE
);


GO

