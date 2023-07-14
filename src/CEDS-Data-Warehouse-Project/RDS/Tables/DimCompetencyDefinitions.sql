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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human-referenceable code designated by the publisher to identify the item in the hierarchy of competency definitions.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Code' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000692' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21669' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The globally unique identifier (GUID) issued by the publisher of the competency framework that uniquely identifies the definition in the hierarchy of competency definitions using a RFC 4122 compliant 32-character hexadecimal string, such as 21EC2020-3AEA-1069-A2DD-08002B30309D.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000689' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21666' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The short name or label for the competency definition or its node in a competency framework.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Short Name' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001409' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22378' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The text of the statement. The textual content that either describes a specific competency or describes a less granular group of competencies within the taxonomy of the competency framework.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Statement' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000690' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21667' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionStatement';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The class of statement in the structure of statements in the Competency Framework according to a controlled vocabulary, specified as a textual label.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000691' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21668' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day the competency definition was deprecated/replaced by the jurisdiction in which it was intended to apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Valid End Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001511' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22483' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidEndDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The year, month and day the competency definition was adopted by the jurisdiction in which it was intended to apply.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Competency Definition Valid Start Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001512' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22484' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimCompetencyDefinitions', @level2type=N'COLUMN',@level2name=N'CompetencyDefinitionValidStartDate';
GO