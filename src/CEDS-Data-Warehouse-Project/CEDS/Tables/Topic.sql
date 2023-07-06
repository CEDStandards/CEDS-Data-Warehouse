CREATE TABLE [CEDS].[Topic] (
    [TopicID]            INT          IDENTITY (1, 1) NOT NULL,
    [Topic]              VARCHAR (50) NOT NULL,
    [ParentTopicID]      INT          NULL,
    [SortOrder]          INT          NULL,
    [Level]              INT          NULL,
    [Category]           VARCHAR (50) NULL,
    [Version]            VARCHAR (20) NULL,
    [CrossDomainTopicID] INT          NULL,
    [ExtendInd]          BIT          CONSTRAINT [DF_Topic_ExtendInd] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED ([TopicID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Topic_Topic] FOREIGN KEY ([TopicID]) REFERENCES [CEDS].[Topic] ([TopicID])
);


GO

