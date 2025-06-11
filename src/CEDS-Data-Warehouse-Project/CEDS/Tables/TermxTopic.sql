CREATE TABLE [CEDS].[TermxTopic](
	[TermID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
	[SortOrder] [decimal](4, 1) NULL,
	[Term_x_TopicID] [int] IDENTITY(1,1) NOT NULL,
	[NdsSubject] [varchar](50) NULL,
	[NdsTable] [varchar](50) NULL,
	[NdsField] [varchar](50) NULL,
	[ChangedInThisVersionInd] [bit] NULL,
	[ReviewedDate] [datetime] NULL,
	[NextVersionTermxTopicID] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [CEDS].[TermxTopic] ADD  CONSTRAINT [DF__TermxTopi__Chang__6FE99F9F]  DEFAULT ((0)) FOR [ChangedInThisVersionInd]
GO

ALTER TABLE [CEDS].[TermxTopic]  WITH CHECK ADD  CONSTRAINT [FK_Term_x_Topic_Term] FOREIGN KEY([TermID])
REFERENCES [CEDS].[Term] ([TermID])
GO

ALTER TABLE [CEDS].[TermxTopic] CHECK CONSTRAINT [FK_Term_x_Topic_Term]
GO

ALTER TABLE [CEDS].[TermxTopic]  WITH CHECK ADD  CONSTRAINT [FK_Term_x_Topic_Topic] FOREIGN KEY([TopicID])
REFERENCES [CEDS].[Topic] ([TopicID])
GO

ALTER TABLE [CEDS].[TermxTopic] CHECK CONSTRAINT [FK_Term_x_Topic_Topic]
GO


