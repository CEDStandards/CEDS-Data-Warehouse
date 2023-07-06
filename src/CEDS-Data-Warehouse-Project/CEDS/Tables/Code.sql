CREATE TABLE [CEDS].[Code] (
    [CodeID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Description]    VARCHAR (MAX)  NULL,
    [NCES]           VARCHAR (10)   NULL,
    [EDFacts]        VARCHAR (20)   NULL,
    [CodeDefinition] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED ([CodeID] ASC) WITH (FILLFACTOR = 90)
);


GO

