CREATE TABLE [CEDS].[TermxCodeSet](
	[TermID] [int] NOT NULL,
	[CodeSetID] [int] NOT NULL,
	[EntityID] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [CEDS].[TermxCodeSet]  WITH CHECK ADD  CONSTRAINT [FK_Term_x_CodeSet_CodeSet] FOREIGN KEY([CodeSetID])
REFERENCES [CEDS].[CodeSet] ([CodeSetID])
GO

ALTER TABLE [CEDS].[TermxCodeSet] CHECK CONSTRAINT [FK_Term_x_CodeSet_CodeSet]
GO

ALTER TABLE [CEDS].[TermxCodeSet]  WITH CHECK ADD  CONSTRAINT [FK_Term_x_CodeSet_Term] FOREIGN KEY([TermID])
REFERENCES [CEDS].[Term] ([TermID])
GO

ALTER TABLE [CEDS].[TermxCodeSet] CHECK CONSTRAINT [FK_Term_x_CodeSet_Term]
GO


