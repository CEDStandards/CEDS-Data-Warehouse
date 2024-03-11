CREATE TABLE [RDS].[DimAeStudentStatuses] (
    [DimAeStudentStatusId]                                                          INT            IDENTITY (1, 1) NOT NULL,
    [AeFunctioningLevelAtIntakeCode]                                                NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_AeFunctioningLevelAtIntakeCode] DEFAULT ('MISSING') NOT NULL,
    [AeFunctioningLevelAtIntakeDescription]                                         NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_AeFunctioningLevelAtIntakeDescription] DEFAULT ('MISSING') NOT NULL,
    [AeFunctioningLevelAtPosttestCode]                                              NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_AeFunctioningLevelAtPosttestCode] DEFAULT ('MISSING') NOT NULL,
    [AeFunctioningLevelAtPosttestDescription]                                       NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_AeFunctioningLevelAtPosttestDescription] DEFAULT ('MISSING') NOT NULL,
    [AePostsecondaryTransitionActionCode]                                           NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_AePostsecondaryTransitionActionCode] DEFAULT ('MISSING') NOT NULL,
    [AePostsecondaryTransitionActionDescription]                                    NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_AePostsecondaryTransitionActionDescription] DEFAULT ('MISSING') NOT NULL,
    [EmployedWhileEnrolledCode]                                                     NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_EmployedWhileEnrolledCode] DEFAULT ('MISSING') NOT NULL,
    [EmployedWhileEnrolledDescription]                                              NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_EmployedWhileEnrolledDescription] DEFAULT ('MISSING') NOT NULL,
    [EmployedAfterExitCode]                                                         NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_EmployedAfterExitCode] DEFAULT ('MISSING') NOT NULL,
    [EmployedAfterExitDescription]                                                  NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_EmployedAfterExitDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription] NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentEmployedIndicatorCode]                       NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_AdultEducationCredentialAttainmentEmployedIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentEmployedIndicatorDescription]                NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_AdultEducationCredentialAttainmentEmployedIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeStudentStatuses_AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription] NVARCHAR (150) CONSTRAINT [DF_DimAeStudentStatuses_AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeStudentStatuses] PRIMARY KEY CLUSTERED ([DimAeStudentStatusId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeStudentStatuses_Codes]
    ON [RDS].[DimAeStudentStatuses]([AeFunctioningLevelAtIntakeCode] ASC, [AeFunctioningLevelAtPosttestCode] ASC, [AePostsecondaryTransitionActionCode] ASC, [EmployedWhileEnrolledCode] ASC, [EmployedAfterExitCode] ASC, [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode] ASC, [AdultEducationCredentialAttainmentEmployedIndicatorCode] ASC, [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Employed Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22912' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Employed Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22912' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Credential Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001956' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22913' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Credential Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001956' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22913' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Enrollment Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001954' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22914' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Enrollment Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001954' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22914' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s entering skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment at program intake.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Intake' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s entering skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment at program intake.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Intake' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000779' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21763' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtIntakeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment after a set time period or number of instructional hours.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Posttest' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21764' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual''s skill level, as defined by the National Reporting System for Adult Education and determined by an approved standardized assessment after a set time period or number of instructional hours.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Educational Functioning Level at Posttest' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000780' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21764' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AeFunctioningLevelAtPosttestDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The action taken with respect to postsecondary enrollment by the learner after program exit or when co-enrolled in ABE and postsecondary with respect to enrollment in a postsecondary educational or occupational skills program building on prior services or training received.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Postsecondary Transition Action' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000784' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21768' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The action taken with respect to postsecondary enrollment by the learner after program exit or when co-enrolled in ABE and postsecondary with respect to enrollment in a postsecondary educational or occupational skills program building on prior services or training received.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Postsecondary Transition Action' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000784' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21768' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, after exiting secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed After Exit' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21990' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, after exiting secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed After Exit' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000988' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21990' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedAfterExitDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, and at the same time is enrolled in secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed While Enrolled' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An individual who is a paid employee or works in his or her own business, profession, or farm, as reported through the State Unemployment Insurance Wage Report, FEDES, or WRIS, and at the same time is enrolled in secondary, postsecondary, or adult education or workforce programs.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Employed While Enrolled' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000987' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21989' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeStudentStatuses', @level2type=N'COLUMN',@level2name=N'EmployedWhileEnrolledDescription';
GO