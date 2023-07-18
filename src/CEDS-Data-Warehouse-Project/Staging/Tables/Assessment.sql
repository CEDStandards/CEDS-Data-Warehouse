CREATE TABLE [Staging].[Assessment] (
    [Id]                                                   INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentIdentifier]                                 VARCHAR (50)   NULL,
    [AssessmentTitle]                                      VARCHAR (100)  NULL,
    [AssessmentShortName]                                  VARCHAR (100)  NULL,
    [AssessmentAcademicSubject]                            VARCHAR (100)  NULL,
    [AssessmentPurpose]                                    VARCHAR (100)  NULL,
    [AssessmentType]                                       VARCHAR (100)  NULL,
    [AssessmentTypeAdministered] VARCHAR (100)  NULL,
    [AssessmentFamilyTitle]                                VARCHAR (100)  NULL,
    [AssessmentFamilyShortName]                            VARCHAR (100)  NULL,
    [AssessmentAdministrationStartDate]                    DATE           NULL,
    [AssessmentAdministrationFinishDate]                   DATE           NULL,
    [AssessmentPerformanceLevelIdentifier]                 VARCHAR (100)  NULL,
    [AssessmentPerformanceLevelLabel]                      VARCHAR (100)  NULL,
    [AssessmentTypeAdministeredToEnglishLearners]          VARCHAR (100)  NULL,
    [DataCollectionName]                                   NVARCHAR (100) NULL,
    [DataCollectionId]                                     INT            NULL,
    [AssessmentId]                                         INT            NULL,
    [AssessmentAdministrationId]                           INT            NULL,
    [AssessmentSubtestId]                                  INT            NULL,
    [AssessmentFormId]                                     INT            NULL,
    [AssessmentPerformanceLevelId]                         INT            NULL,
    [RunDateTime]                                          DATETIME       NULL,
    CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The description of the academic content or subject area (e.g., arts, mathematics, reading, or a foreign language) being evaluated.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Academic Subject' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000021' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21021' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAcademicSubject';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The finish date of the time period designated for the assessment administration.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Finish Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000964' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21965' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationFinishDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The start date of the time period designated for the assessment administration.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Administration Start Date' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000962' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21963' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentAdministrationStartDate';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The abbreviated title of the Assessment Family. An Assessment Family is a set of assessments with a common name, jurisdiction, or focus.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Family Short Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000933' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21934' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The full title of the Assessment Family. An Assessment Family is a set of assessments with a common name, jurisdiction, or focus, such as Graduate Record Exam or National Assessment of Educational Progress.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Family Title' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000932' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21933' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentFamilyTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an assessment by a school, school system, a state, or other agency or entity.  This may be the publisher identifier.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001067' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21152' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A unique number or alphanumeric code assigned to an assessment performance level.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Identifier' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000717' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21693' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelIdentifier';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A label representing the performance level appropriate for use on a report.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Performance Level Label' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000718' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21694' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPerformanceLevelLabel';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The reason for which an assessment is designed or delivered.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Purpose' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000026' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21026' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentPurpose';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An abbreviated title for an assessment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Short Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000931' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21932' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentShortName';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The title or name of the assessment.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Title' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000028' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21028' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTitle';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The category of an assessment based on format and content.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000029' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21029' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentType';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of assessment administered.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type Administered' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000415' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21405' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministered';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The types of assessments administered to English Learners.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Type Administered to English Learners' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001995' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22974' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'AssessmentTypeAdministeredToEnglishLearners';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'A human readable name used to identify the data within the collection.' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Data Collection Name' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001966' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22923' , @level0type=N'SCHEMA',@level0name=N'Staging', @level1type=N'TABLE',@level1name=N'Assessment', @level2type=N'COLUMN',@level2name=N'DataCollectionName';
GO