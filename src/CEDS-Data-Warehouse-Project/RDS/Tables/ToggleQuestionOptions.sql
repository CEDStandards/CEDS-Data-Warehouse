CREATE TABLE [RDS].[ToggleQuestionOptions] (
    [ToggleQuestionOptionId] INT            IDENTITY (1, 1) NOT NULL,
    [OptionSequence]         INT            NOT NULL,
    [OptionText]             NVARCHAR (MAX) NOT NULL,
    [ToggleQuestionId]       INT            NOT NULL,
    CONSTRAINT [PK_ToggleQuestionOptions] PRIMARY KEY CLUSTERED ([ToggleQuestionOptionId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ToggleQuestionOptions_ToggleQuestions_ToggleQuestionId] FOREIGN KEY ([ToggleQuestionId]) REFERENCES [RDS].[ToggleQuestions] ([ToggleQuestionId]) ON DELETE CASCADE
);


GO

