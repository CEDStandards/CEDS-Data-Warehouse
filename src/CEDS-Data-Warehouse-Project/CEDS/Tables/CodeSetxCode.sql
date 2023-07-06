CREATE TABLE [CEDS].[CodeSetxCode] (
    [CodeSetID] INT            NOT NULL,
    [CodeID]    INT            NOT NULL,
    [SortOrder] DECIMAL (5, 2) NULL,
    CONSTRAINT [FK_CodeSet_x_Code_Code] FOREIGN KEY ([CodeID]) REFERENCES [CEDS].[Code] ([CodeID]),
    CONSTRAINT [FK_CodeSet_x_Code_CodeSet] FOREIGN KEY ([CodeSetID]) REFERENCES [CEDS].[CodeSet] ([CodeSetID])
);


GO

