CREATE TABLE [RDS].[ToggleResponses] (
    [ToggleResponseId]       INT            IDENTITY (1, 1) NOT NULL,
    [ResponseValue]          NVARCHAR (MAX) NOT NULL,
    [ToggleQuestionId]       INT            NOT NULL,
    [ToggleQuestionOptionId] INT            NULL,
    CONSTRAINT [PK_ToggleResponses] PRIMARY KEY CLUSTERED ([ToggleResponseId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_ToggleResponses_ToggleQuestionOptions_ToggleQuestionOptionId] FOREIGN KEY ([ToggleQuestionOptionId]) REFERENCES [RDS].[ToggleQuestionOptions] ([ToggleQuestionOptionId]),
    CONSTRAINT [FK_ToggleResponses_ToggleQuestions_ToggleQuestionId] FOREIGN KEY ([ToggleQuestionId]) REFERENCES [RDS].[ToggleQuestions] ([ToggleQuestionId]) ON DELETE CASCADE
);


GO

