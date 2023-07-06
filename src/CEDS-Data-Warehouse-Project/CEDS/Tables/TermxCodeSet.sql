CREATE TABLE [CEDS].[TermxCodeSet] (
    [TermID]    INT NOT NULL,
    [CodeSetID] INT NOT NULL,
    [EntityID]  INT NULL,
    CONSTRAINT [FK_Term_x_CodeSet_CodeSet] FOREIGN KEY ([CodeSetID]) REFERENCES [CEDS].[CodeSet] ([CodeSetID]),
    CONSTRAINT [FK_Term_x_CodeSet_Term] FOREIGN KEY ([TermID]) REFERENCES [CEDS].[Term] ([TermID])
);


GO

