CREATE TABLE [RDS].[DimSubgroups] (
    [DimSubgroupId]       INT           IDENTITY (1, 1) NOT NULL,
    [SubgroupElementName] VARCHAR (50)  NULL,
    [SubgroupCode]        VARCHAR (50)  NULL,
    [SubgroupDescription] VARCHAR (200) NULL,
    [SubgroupEdFactsCode] VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimSubgroups] PRIMARY KEY CLUSTERED ([DimSubgroupId] ASC)
);


GO

