CREATE TABLE [RDS].[DimAssessmentParticipationSessions] (
    [DimAssessmentParticipationSessionId]                 INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentSessionSpecialCircumstanceTypeCode]        NVARCHAR (100) CONSTRAINT [DF_DimAssessmentParticipationSessions_AssessmentSessionSpecialCircumstanceTypeCode] DEFAULT ('MISSING') NOT NULL,
    [AssessmentSessionSpecialCircumstanceTypeDescription] NVARCHAR (300) CONSTRAINT [DF_DimAssessmentParticipationSessions_AssessmentSessionSpecialCircumstanceTypeDescription] DEFAULT ('MISSING') NOT NULL,
    [ActualStartDateTime]                                 DATETIME       NULL,
    [ActualEndDateTime]                                   DATETIME       NULL,
    CONSTRAINT [PK_DimAssessmentParticipationSessions] PRIMARY KEY CLUSTERED ([DimAssessmentParticipationSessionId] ASC)
);


GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An unusual event occurred during the administration of the assessment. This could include fire alarm, student became ill, etc.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Session Special Circumstance Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000389' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21380' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An unusual event occurred during the administration of the assessment. This could include fire alarm, student became ill, etc.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Assessment Session Special Circumstance Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000389' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21380' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimAssessmentParticipationSessions', @level2type=N'COLUMN',@level2name=N'AssessmentSessionSpecialCircumstanceTypeDescription';
GO