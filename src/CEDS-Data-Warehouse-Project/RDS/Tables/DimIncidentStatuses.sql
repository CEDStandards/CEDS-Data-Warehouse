CREATE TABLE [RDS].[DimIncidentStatuses] (
    [DimIncidentStatusId]                 INT            IDENTITY (1, 1) NOT NULL,
    [IncidentBehaviorCode]                NVARCHAR (100) NOT NULL,
    [IncidentBehaviorDescription]         NVARCHAR (300) NOT NULL,
    [IdeaInterimRemovalReasonCode]        NVARCHAR (100) NOT NULL,
    [IdeaInterimRemovalReasonDescription] NVARCHAR (300) NOT NULL,
    [IdeaInterimRemovalReasonEdFactsCode] NVARCHAR (50)  NOT NULL,
    [DisciplineReasonCode]                NVARCHAR (100) NOT NULL,
    [DisciplineReasonDescription]         NVARCHAR (300) NOT NULL,
    [IncidentInjuryTypeCode]              NVARCHAR (100) NOT NULL,
    [IncidentInjuryTypeDescription]       NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimIncidentStatuses] PRIMARY KEY CLUSTERED ([DimIncidentStatusId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason why the student was disciplined.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000545' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason why the student was disciplined.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000545' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21536' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Categories of behavior coded for use in describing an incident.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Behavior' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21500' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Categories of behavior coded for use in describing an incident.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Behavior' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000509' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21500' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentBehaviorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21501' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of the occurrence of physical injury to participants involved in the incident and, if so, the level of injury sustained.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Incident Injury Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000510' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21501' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimIncidentStatuses', @level2type=N'COLUMN',@level2name=N'IncidentInjuryTypeDescription';
GO