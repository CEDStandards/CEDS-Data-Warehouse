CREATE TABLE [RDS].[DimDisciplineStatuses] (
    [DimDisciplineStatusId]                                 INT            IDENTITY (1, 1) NOT NULL,
    [DisciplinaryActionTakenCode]                           NVARCHAR (50)  NULL,
    [DisciplinaryActionTakenDescription]                    NVARCHAR (200) NULL,
    [DisciplinaryActionTakenEdFactsCode]                    NVARCHAR (50)  NULL,
    [DisciplineMethodOfChildrenWithDisabilitiesCode]        NVARCHAR (50)  NULL,
    [DisciplineMethodOfChildrenWithDisabilitiesDescription] NVARCHAR (200) NULL,
    [DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode] NVARCHAR (50)  NULL,
    [EducationalServicesAfterRemovalCode]                   NVARCHAR (50)  NULL,
    [EducationalServicesAfterRemovalDescription]            NVARCHAR (200) NULL,
    [EducationalServicesAfterRemovalEdFactsCode]            NVARCHAR (50)  NULL,
    [IdeaInterimRemovalReasonCode]                          NVARCHAR (50)  NULL,
    [IdeaInterimRemovalReasonDescription]                   NVARCHAR (200) NULL,
    [IdeaInterimRemovalReasonEdFactsCode]                   NVARCHAR (50)  NULL,
    [IdeaInterimRemovalCode]                                NVARCHAR (50)  NULL,
    [IdeaInterimRemovalDescription]                         NVARCHAR (200) NULL,
    [IdeaInterimRemovalEdFactsCode]                         NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimDisciplineStatuses] PRIMARY KEY CLUSTERED ([DimDisciplineStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_RemovalTypeEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([IdeaInterimRemovalEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_DisciplineActionEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([DisciplinaryActionTakenEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_EducationalServicesEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([EducationalServicesAfterRemovalEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_Codes]
    ON [RDS].[DimDisciplineStatuses]([DisciplinaryActionTakenCode] ASC, [DisciplineMethodOfChildrenWithDisabilitiesCode] ASC, [EducationalServicesAfterRemovalCode] ASC, [IdeaInterimRemovalCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimDisciplineStatuses_DisciplineMethodEdFactsCode]
    ON [RDS].[DimDisciplineStatuses]([DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies the consequences of an incident for the student(s) involved in an incident as perpetrator(s).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disciplinary Action Taken' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000488' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies the consequences of an incident for the student(s) involved in an incident as perpetrator(s).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disciplinary Action Taken' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000488' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Identifies the consequences of an incident for the student(s) involved in an incident as perpetrator(s).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Disciplinary Action Taken' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000488' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21479' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplinaryActionTakenEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of suspension or expulsion used for the discipline of children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method of Children with Disabilities' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21529' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of suspension or expulsion used for the discipline of children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method of Children with Disabilities' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21529' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of suspension or expulsion used for the discipline of children with disabilities.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Discipline Method of Children with Disabilities' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000538' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21529' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'DisciplineMethodOfChildrenWithDisabilitiesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether children (students) were provided educational services when removed from the regular school program for disciplinary reasons.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Educational Services After Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21570' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether children (students) were provided educational services when removed from the regular school program for disciplinary reasons.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Educational Services After Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21570' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether children (students) were provided educational services when removed from the regular school program for disciplinary reasons.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Educational Services After Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000578' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21570' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'EducationalServicesAfterRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of interim removal from current educational setting experienced by children with disabilities (IDEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000541' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of interim removal from current educational setting experienced by children with disabilities (IDEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000541' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of interim removal from current educational setting experienced by children with disabilities (IDEA).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000541' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21532' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reasons why children with disabilities were unilaterally removed from their current educational placement to an interim alternative educational setting.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'IDEA Interim Removal Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000539' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21530' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimDisciplineStatuses', @level2type=N'COLUMN',@level2name=N'IdeaInterimRemovalReasonEdFactsCode';
GO