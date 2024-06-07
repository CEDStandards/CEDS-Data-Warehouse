CREATE TABLE [RDS].[DimAeProgramTransitionIndicators] (
    [DimAeProgramTransitionIndicatorId]                                                          INT            IDENTITY (1, 1) NOT NULL,
    [AePostsecondaryTransitionActionCode]                                           NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramTransitionIndicators_AePostsecondaryTransitionActionCode] DEFAULT ('MISSING') NOT NULL,
    [AePostsecondaryTransitionActionDescription]                                    NVARCHAR (150) CONSTRAINT [DF_DimAeProgramTransitionIndicators_AePostsecondaryTransitionActionDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription] NVARCHAR (150) CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentEmployedIndicatorCode]                       NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationCredentialAttainmentEmployedIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentEmployedIndicatorDescription]                NVARCHAR (150) CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationCredentialAttainmentEmployedIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription] NVARCHAR (150) CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationProgramExitReasonCode]        NVARCHAR (50)  CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationProgramExitReasonCode] DEFAULT ('MISSING') NOT NULL,
    [AdultEducationProgramExitReasonDescription] NVARCHAR (150) CONSTRAINT [DF_DimAeProgramTransitionIndicators_AdultEducationProgramExitReasonDescription] DEFAULT ('MISSING') NOT NULL,
    CONSTRAINT [PK_DimAeProgramTransitionIndicators] PRIMARY KEY CLUSTERED ([DimAeProgramTransitionIndicatorId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAeProgramTransitionIndicators_Codes]
    ON [RDS].[DimAeProgramTransitionIndicators]([AePostsecondaryTransitionActionCode] ASC, [AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode] ASC, [AdultEducationCredentialAttainmentEmployedIndicatorCode] ASC, [AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode] ASC, [AdultEducationProgramExitReasonCode] ASC);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Employed Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and was employed within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Employed Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001955' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentEmployedIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Credential Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001956' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001956' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a postsecondary credential while enrolled in the adult education program or within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Credential Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001956' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001956' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryCredentialIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Enrollment Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001954' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001954' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the adult education participant received a secondary school diploma or its recognized equivalent while enrolled in the adult education program or within one year of exiting the adult education program and entered into postsecondary education within one year of exiting the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Credential Attainment Postsecondary Enrollment Indicator' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001954' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001954' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationCredentialAttainmentPostsecondaryEnrollmentIndicatorDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The action taken with respect to postsecondary enrollment by the learner after program exit or when co-enrolled in ABE and postsecondary with respect to enrollment in a postsecondary educational or occupational skills program building on prior services or training received.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Postsecondary Transition Action' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000784' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000784' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The action taken with respect to postsecondary enrollment by the learner after program exit or when co-enrolled in ABE and postsecondary with respect to enrollment in a postsecondary educational or occupational skills program building on prior services or training received.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Postsecondary Transition Action' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000784' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/000784' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AePostsecondaryTransitionActionDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The documented or assumed reason the person is no longer being served by the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Program Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001939' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001939' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The documented or assumed reason the person is no longer being served by the adult education program.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Adult Education Program Exit Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001939' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/element/001939' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAeProgramTransitionIndicators', @level2type=N'COLUMN',@level2name=N'AdultEducationProgramExitReasonDescription';
GO