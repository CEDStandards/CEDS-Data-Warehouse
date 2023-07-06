CREATE TABLE [CEDS].[TermxTopic] (
    [TermID]                  INT            NOT NULL,
    [TopicID]                 INT            NOT NULL,
    [SortOrder]               DECIMAL (4, 1) NULL,
    [Term_x_TopicID]          INT            IDENTITY (1, 1) NOT NULL,
    [NdsSubject]              VARCHAR (50)   NULL,
    [NdsTable]                VARCHAR (50)   NULL,
    [NdsField]                VARCHAR (50)   NULL,
    [ChangedInThisVersionInd] BIT            CONSTRAINT [DF__TermxTopi__Chang__6FE99F9F] DEFAULT ((0)) NULL,
    [ReviewedDate]            DATETIME       NULL,
    [NextVersionTermxTopicID] INT            NULL,
    CONSTRAINT [FK_Term_x_Topic_Term] FOREIGN KEY ([TermID]) REFERENCES [CEDS].[Term] ([TermID]),
    CONSTRAINT [FK_Term_x_Topic_Topic] FOREIGN KEY ([TopicID]) REFERENCES [CEDS].[Topic] ([TopicID])
);


GO

