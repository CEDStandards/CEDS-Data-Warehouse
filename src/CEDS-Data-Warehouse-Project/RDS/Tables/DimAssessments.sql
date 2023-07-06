CREATE TABLE [RDS].[DimAssessments] (
    [DimAssessmentId]                                        INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentIdentifierState]                              NVARCHAR (40)  NULL,
    [AssessmentFamilyShortName]                              NVARCHAR (30)  NULL,
    [AssessmentTitle]                                        NVARCHAR (60)  NULL,
    [AssessmentShortName]                                    NVARCHAR (30)  NULL,
    [AssessmentTypeCode]                                     NVARCHAR (100) NULL,
    [AssessmentTypeDescription]                              NVARCHAR (300) NULL,
    [AssessmentTypeEdFactsCode]                              NVARCHAR (100) NULL,
    [AssessmentAcademicSubjectCode]                          NVARCHAR (100) NULL,
    [AssessmentAcademicSubjectDescription]                   NVARCHAR (300) NULL,
    [AssessmentAcademicSubjectEdFactsCode]                   NVARCHAR (50)  NULL,
    [AssessmentTypeAdministeredCode]                         NVARCHAR (100) NULL,
    [AssessmentTypeAdministeredDescription]                  NVARCHAR (300) NULL,
    [AssessmentTypeAdministeredEdFactsCode]                  NVARCHAR (100) NULL,
    [AssessmentTypeAdministeredToEnglishLearnersCode]        NVARCHAR (100) NULL,
    [AssessmentTypeAdministeredToEnglishLearnersDescription] NVARCHAR (300) NULL,
    [AssessmentTypeAdministeredToEnglishLearnersEdFactsCode] NVARCHAR (100) NULL,
    CONSTRAINT [PK_DimAssessments] PRIMARY KEY CLUSTERED ([DimAssessmentId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentShortName]
    ON [RDS].[DimAssessments]([AssessmentShortName] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentTitle]
    ON [RDS].[DimAssessments]([AssessmentTitle] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessments_Codes]
    ON [RDS].[DimAssessments]([AssessmentAcademicSubjectCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentSubjectEdFactsCode]
    ON [RDS].[DimAssessments]([AssessmentAcademicSubjectEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessments_AssessmentIdentifier]
    ON [RDS].[DimAssessments]([AssessmentIdentifierState] ASC) WITH (FILLFACTOR = 80);


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Academic Subject', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Short Name', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19934', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentFamilyShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000029', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19152', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentIdentifierState';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Title', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19021', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000029', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Family Short Name', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentFamilyShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Academic Subject', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The category of an assessment based on format and content.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Identifier', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentIdentifierState';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000021', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000931', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19029', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentFamilyShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Academic Subject', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentIdentifierState';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The category of an assessment based on format and content.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000028', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19029', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000021', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000933', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentFamilyShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'An abbreviated title for an assessment.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Type', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19021', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectEdFactsCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'001067', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentIdentifierState';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19932', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentShortName';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The title or name of the assessment.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_GlobalId', @value = N'000021', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Element', @value = N'Assessment Type', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The abbreviated title of the Assessment Family. An Assessment Family is a set of assessments with a common name, jurisdiction, or focus.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentFamilyShortName';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectDescription';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19028', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTitle';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentTypeCode';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_Def_Desc', @value = N'A unique number or alphanumeric code assigned to an assessment by a school, school system, a state, or other agency or entity.  This may be the publisher identifier.', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentIdentifierState';


GO

EXECUTE sp_addextendedproperty @name = N'CEDS_URL', @value = N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=19021', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimAssessments', @level2type = N'COLUMN', @level2name = N'AssessmentAcademicSubjectDescription';


GO

