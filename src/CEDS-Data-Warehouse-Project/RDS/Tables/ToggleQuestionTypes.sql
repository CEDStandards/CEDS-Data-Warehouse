CREATE TABLE [RDS].[ToggleQuestionTypes] (
    [ToggleQuestionTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [IsMultiOption]          BIT            NOT NULL,
    [ToggleQuestionTypeCode] NVARCHAR (50)  NOT NULL,
    [ToggleQuestionTypeName] NVARCHAR (500) NOT NULL,
    CONSTRAINT [PK_ToggleQuestionTypes] PRIMARY KEY CLUSTERED ([ToggleQuestionTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

