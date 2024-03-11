CREATE TABLE [RDS].[DimAssessmentSubtests] (
    [DimAssessmentSubtestId]                     INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentFormNumber]                       NVARCHAR (30)  NULL,
    [AssessmentAcademicSubjectCode]              NVARCHAR (100) CONSTRAINT [DF_DimAssessmentSubtests_AssessmentAcademicSubjectCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentAcademicSubjectDescription]       NVARCHAR (400) CONSTRAINT [DF_DimAssessmentSubtests_AssessmentAcademicSubjectDescription] DEFAULT ('MISSING') NOT NULL,
    [AssessmentSubtestIdentifierInternal]        NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestTitle]                     NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestAbbreviation]              NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestDescription]               NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestVersion]                   NVARCHAR (40)  NOT NULL,
    [AssessmentLevelForWhichDesigned]            NVARCHAR (40)  NOT NULL,
    [AssessmentEarlyLearningDevelopmentalDomain] NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestPublishedDate]             DATETIME       NULL,
    [AssessmentSubtestMinimumValue]              NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestMaximumValue]              NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestScaleOptimalValue]         NVARCHAR (40)  NOT NULL,
    [AssessmentContentStandardType]              NVARCHAR (40)  NOT NULL,
    [AssessmentPurpose]                          NVARCHAR (40)  NOT NULL,
    [AssessmentSubtestRules]                     NVARCHAR (40)  NOT NULL,
    [AssessmentFormSubtestTier]                  NVARCHAR (40)  NOT NULL,
    [AssessmentFormSubtestContainerOnly]         NVARCHAR (40)  NOT NULL,
    CONSTRAINT [PK_DimAssessmentSubtests] PRIMARY KEY CLUSTERED ([DimAssessmentSubtestId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Academic Subject' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000021' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21021' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Academic Subject' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000021' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21021' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubjectDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentContentStandardType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication as to whether an assessment conforms to a standard.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentContentStandardType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Content Standard Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentContentStandardType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000605' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentContentStandardType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21598' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentContentStandardType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentEarlyLearningDevelopmentalDomain';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Developmental domains related to early learning and used for assessing a child''s kindergarten readiness.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentEarlyLearningDevelopmentalDomain';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Early Learning Developmental Domain' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentEarlyLearningDevelopmentalDomain';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001000' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentEarlyLearningDevelopmentalDomain';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22003' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentEarlyLearningDevelopmentalDomain';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The number of a given assessment form.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Form Number' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000366' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21365' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormNumber';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestContainerOnly';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In a hierarchy of subtests, this indicates that this tier is only used as a level in the hierarchy and does not represent a scoring model.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestContainerOnly';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Form Subtest Container Only' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestContainerOnly';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001215' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestContainerOnly';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22181' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestContainerOnly';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestTier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'In a hierarchy of subtests, this element represents the level of the sub test in the hierarchy.  The top tier and default is zero.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestTier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Form Subtest Tier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestTier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001214' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestTier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22180' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentFormSubtestTier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentLevelForWhichDesigned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The typical grade or combination of grade-levels, developmental levels, or age-levels for which an assessment is designed.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentLevelForWhichDesigned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Level for Which Designed' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentLevelForWhichDesigned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000177' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentLevelForWhichDesigned';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21177' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentLevelForWhichDesigned';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason for which an assessment is designed or delivered.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Purpose' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000026' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21026' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The shortened name identifying the assessment for use in reference and/or reports.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Abbreviation' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000368' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21367' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestAbbreviation';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of the subtest (e.g., vocabulary, measurement, or geometry).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Description' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000274' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21274' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestIdentifierInternal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an assessment subtest.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestIdentifierInternal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Identifier' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestIdentifierInternal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000367' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestIdentifierInternal';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21366' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestIdentifierInternal';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The maximum value for the measurement.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Maximum Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000396' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMaximumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The minimum value possible for the measurement.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Minimum Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000395' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21387' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestMinimumValue';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestPublishedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The date on which the Subtest was published.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestPublishedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Published Date' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestPublishedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001091' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestPublishedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22075' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestPublishedDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestRules';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A description of the rules to produce a student test/subtest score from for a grouping of student item scores.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestRules';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Rules' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestRules';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000719' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestRules';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21695' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestRules';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestScaleOptimalValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The optimal value for this measurement.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestScaleOptimalValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Optimal Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestScaleOptimalValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000397' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestScaleOptimalValue';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21389' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestScaleOptimalValue';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The name or title of the subtest.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Title' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000275' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21275' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The version of the subtest that is included for the assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Subtest Version' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000388' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestVersion';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21379' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentSubtests', @level2type=N'COLUMN',@level2name=N'AssessmentSubtestVersion';
GO