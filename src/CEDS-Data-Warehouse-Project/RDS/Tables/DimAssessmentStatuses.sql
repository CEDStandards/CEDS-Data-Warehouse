CREATE TABLE [RDS].[DimAssessmentStatuses] (
    [DimAssessmentStatusId]        INT            IDENTITY (1, 1) NOT NULL,
    [ProgressLevelCode]            NVARCHAR (50)  NULL,
    [ProgressLevelDescription]     NVARCHAR (100) NULL,
    [ProgressLevelEdFactsCode]     NVARCHAR (50)  NULL,
    [AssessedFirstTimeCode]        NVARCHAR (50)  NULL,
    [AssessedFirstTimeDescription] NVARCHAR (100) NULL,
    [AssessedFirstTimeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimAssessmentStatuses] PRIMARY KEY CLUSTERED ([DimAssessmentStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000561', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The amount of progress shown in academic subjects.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19553', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Progress Level', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The amount of progress shown in academic subjects.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19553', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Progress Level', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000561', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Progress Level', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000561', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The amount of progress shown in academic subjects.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19553', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessmentStatuses', @level2type = N'COLUMN', @level2name = N'ProgressLevelEdFactsCode';


GO

