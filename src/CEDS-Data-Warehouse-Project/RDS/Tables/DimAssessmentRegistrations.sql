CREATE TABLE [RDS].[DimAssessmentRegistrations] (
    [DimAssessmentRegistrationId]                             INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentRegistrationParticipationIndicatorCode]        NVARCHAR (100) NULL,
    [AssessmentRegistrationParticipationIndicatorDescription] NVARCHAR (300) NULL,
    [AssessmentRegistrationCompletionStatusCode]              NVARCHAR (100) NULL,
    [AssessmentRegistrationCompletionStatusDescription]       NVARCHAR (300) NULL,
    [StateFullAcademicYearCode]                               NVARCHAR (100) NULL,
    [StateFullAcademicYearDescription]                        NVARCHAR (300) NULL,
    [StateFullAcademicYearEdFactsCode]                        NVARCHAR (50)  NULL,
    [LeaFullAcademicYearCode]                                 NVARCHAR (100) NULL,
    [LeaFullAcademicYearDescription]                          NVARCHAR (300) NULL,
    [LeaFullAcademicYearEdFactsCode]                          NVARCHAR (50)  NULL,
    [SchoolFullAcademicYearCode]                              NVARCHAR (100) NULL,
    [SchoolFullAcademicYearDescription]                       NVARCHAR (300) NULL,
    [SchoolFullAcademicYearEdFactsCode]                       NVARCHAR (50)  NULL,
    [AssessmentRegistrationReasonNotCompletingCode]           NVARCHAR (100) NULL,
    [AssessmentRegistrationReasonNotCompletingDescription]    NVARCHAR (300) NULL,
    [AssessmentRegistrationReasonNotCompletingEdFactsCode]    NVARCHAR (100) NULL,
    [ReasonNotTestedCode]                                     NVARCHAR (100) NULL,
    [ReasonNotTestedDescription]                              NVARCHAR (300) NULL,
    [ReasonNotTestedEdFactsCode]                              NVARCHAR (100) NULL,
    CONSTRAINT [PK_DimAssessmentRegistrations] PRIMARY KEY CLUSTERED ([DimAssessmentRegistrationId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The completion and scoring status for an instance of a person taking an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Completion Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001541' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22516' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The completion and scoring status for an instance of a person taking an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Completion Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001541' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22516' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationCompletionStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student participated in an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Participation Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000025' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21025' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student participated in an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Participation Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000025' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21025' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationParticipationIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state’s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO