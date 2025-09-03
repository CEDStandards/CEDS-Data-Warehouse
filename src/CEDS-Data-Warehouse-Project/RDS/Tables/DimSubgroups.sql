CREATE TABLE [RDS].[DimSubgroups] (
    [DimSubgroupId]       INT           IDENTITY (1, 1) NOT NULL,
    [SubgroupElementName] VARCHAR (50)  NULL,
    [SubgroupCode]        VARCHAR (50)  CONSTRAINT [DF_DimSubgroups_SubgroupCode] DEFAULT ('MISSING') NOT NULL,
    [SubgroupDescription] VARCHAR (200) CONSTRAINT [DF_DimSubgroups_SubgroupDescription] DEFAULT ('MISSING') NOT NULL,
    [SubgroupEdFactsCode] VARCHAR (50)  CONSTRAINT [DF_DimSubgroups_SubgroupEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimSubgroups] PRIMARY KEY CLUSTERED ([DimSubgroupId] ASC)
);


GO

