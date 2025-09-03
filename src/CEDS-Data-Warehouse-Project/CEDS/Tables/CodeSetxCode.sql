CREATE TABLE [CEDS].[CodeSetxCode](
	[CodeSetID] [int] NOT NULL,
	[CodeID] [int] NOT NULL,
	[SortOrder] [decimal](7, 2) NULL
) ON [PRIMARY]
GO

ALTER TABLE [CEDS].[CodeSetxCode]  WITH CHECK ADD  CONSTRAINT [FK_CodeSet_x_Code_Code] FOREIGN KEY([CodeID])
REFERENCES [CEDS].[Code] ([CodeID])
GO

ALTER TABLE [CEDS].[CodeSetxCode] CHECK CONSTRAINT [FK_CodeSet_x_Code_Code]
GO

ALTER TABLE [CEDS].[CodeSetxCode]  WITH CHECK ADD  CONSTRAINT [FK_CodeSet_x_Code_CodeSet] FOREIGN KEY([CodeSetID])
REFERENCES [CEDS].[CodeSet] ([CodeSetID])
GO

ALTER TABLE [CEDS].[CodeSetxCode] CHECK CONSTRAINT [FK_CodeSet_x_Code_CodeSet]
GO


