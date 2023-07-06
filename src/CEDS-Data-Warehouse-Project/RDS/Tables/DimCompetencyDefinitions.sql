CREATE TABLE [RDS].[DimCompetencyDefinitions] (
    [DimCompetencyDefinitionId]          INT            IDENTITY (1, 1) NOT NULL,
    [CompetencyDefinitionIdentifier]     NVARCHAR (40)  NULL,
    [CompetencyDefinitionCode]           NVARCHAR (30)  NULL,
    [CompetencyDefinitionShortName]      NVARCHAR (60)  NULL,
    [CompetencyDefinitionStatement]      NVARCHAR (MAX) NULL,
    [CompetencyDefinitionType]           NVARCHAR (60)  NULL,
    [CompetencyDefinitionValidStartDate] DATETIME       CONSTRAINT [DF_DimCompetencyDefinitionsCompetencyDefinitionValudStartDate] DEFAULT (getdate()) NOT NULL,
    [CompetencyDefinitionValidEndDate]   DATETIME       NULL,
    CONSTRAINT [PK_DimCompetencyDefinitionId] PRIMARY KEY CLUSTERED ([DimCompetencyDefinitionId] ASC)
);


GO

