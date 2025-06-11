CREATE TABLE [CEDS].[Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [varchar](50) NOT NULL,
	[ParentTopicID] [int] NULL,
	[SortOrder] [int] NULL,
	[Level] [int] NULL,
	[Category] [varchar](50) NULL,
	[Version] [varchar](20) NULL,
	[CrossDomainTopicID] [int] NULL,
	[ExtendInd] [bit] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [CEDS].[Topic] ADD  CONSTRAINT [DF_Topic_ExtendInd]  DEFAULT ((0)) FOR [ExtendInd]
GO

ALTER TABLE [CEDS].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Topic] FOREIGN KEY([TopicID])
REFERENCES [CEDS].[Topic] ([TopicID])
GO

ALTER TABLE [CEDS].[Topic] CHECK CONSTRAINT [FK_Topic_Topic]
GO


