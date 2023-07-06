CREATE TABLE [CEDS].[CodeSet] (
    [CodeSetID]      INT           IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (50)  NOT NULL,
    [HtmlColumns]    INT           CONSTRAINT [DF_CodeSet_HtmlColumns] DEFAULT ((1)) NOT NULL,
    [GeneratedHtml]  VARCHAR (MAX) NULL,
    [GeneratedExcel] VARCHAR (MAX) NULL,
    CONSTRAINT [PK_CodeSet] PRIMARY KEY CLUSTERED ([CodeSetID] ASC) WITH (FILLFACTOR = 90)
);


GO

