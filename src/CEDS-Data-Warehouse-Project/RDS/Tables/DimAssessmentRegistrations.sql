CREATE TABLE [RDS].[DimAssessmentRegistrations] (
    [DimAssessmentRegistrationId]                             INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentRegistrationParticipationIndicatorCode]        NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationParticipationIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentRegistrationParticipationIndicatorDescription] NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationParticipationIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AssessmentRegistrationCompletionStatusCode]              NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationCompletionStatusCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentRegistrationCompletionStatusDescription]       NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationCompletionStatusDescription] DEFAULT ('MISSING') NOT NULL,
    [StateFullAcademicYearCode]                               NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_StateFullAcademicYearCode] DEFAULT ('MISSING') NOT NULL,
    [StateFullAcademicYearDescription]                        NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_StateFullAcademicYearDescription] DEFAULT ('MISSING') NOT NULL,
    [StateFullAcademicYearEdFactsCode]                        NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentRegistrations_StateFullAcademicYearEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [LeaFullAcademicYearCode]                                 NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_LeaFullAcademicYearCode] DEFAULT ('MISSING') NOT NULL,
    [LeaFullAcademicYearDescription]                          NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_LeaFullAcademicYearDescription] DEFAULT ('MISSING') NOT NULL,
    [LeaFullAcademicYearEdFactsCode]                          NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentRegistrations_LeaFullAcademicYearEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [SchoolFullAcademicYearCode]                              NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_SchoolFullAcademicYearCode] DEFAULT ('MISSING') NOT NULL,
    [SchoolFullAcademicYearDescription]                       NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_SchoolFullAcademicYearDescription] DEFAULT ('MISSING') NOT NULL,
    [SchoolFullAcademicYearEdFactsCode]                       NVARCHAR (50)  CONSTRAINT [DF_DimAssessmentRegistrations_SchoolFullAcademicYearEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentRegistrationReasonNotCompletingCode]           NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationReasonNotCompletingCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentRegistrationReasonNotCompletingDescription]    NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationReasonNotCompletingDescription] DEFAULT ('MISSING') NOT NULL,
    [AssessmentRegistrationReasonNotCompletingEdFactsCode]    NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_AssessmentRegistrationReasonNotCompletingEdFactsCode] DEFAULT ('MISSING') NOT NULL,
    [ReasonNotTestedCode]                                     NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_ReasonNotTestedCode] DEFAULT ('MISSING') NOT NULL,
    [ReasonNotTestedDescription]                              NVARCHAR (300) CONSTRAINT [DF_DimAssessmentRegistrations_ReasonNotTestedDescription] DEFAULT ('MISSING') NOT NULL,
    [ReasonNotTestedEdFactsCode]                              NVARCHAR (100) CONSTRAINT [DF_DimAssessmentRegistrations_ReasonNotTestedEdFactsCode] DEFAULT ('MISSING') NOT NULL,
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
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the LEA education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'LEA Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001762' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22743' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'LeaFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the school education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'School Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22744' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'SchoolFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether a student was in membership in the state education unit for a full academic year, according to the state''s definition of Full Academic Year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'State Full Academic Year' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001761' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22742' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'StateFullAcademicYearEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a participant did not complete an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Reason Not Completing' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000540' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21531' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a participant did not complete an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Reason Not Completing' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000540' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21531' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a participant did not complete an assessment.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Registration Reason Not Completing' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000540' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21531' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'AssessmentRegistrationReasonNotCompletingEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a student is not tested.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reason Not Tested' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000228' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21228' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a student is not tested.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reason Not Tested' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000228' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21228' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The primary reason a student is not tested.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Reason Not Tested' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000228' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21228' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentRegistrations', @level2type=N'COLUMN',@level2name=N'ReasonNotTestedEdFactsCode';
GO