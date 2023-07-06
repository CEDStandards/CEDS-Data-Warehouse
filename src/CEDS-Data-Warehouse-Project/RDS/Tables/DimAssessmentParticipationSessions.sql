CREATE TABLE [RDS].[DimAssessmentParticipationSessions] (
    [DimAssessmentParticipationSessionId]                 INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentSessionSpecialCircumstanceTypeCode]        NVARCHAR (100) NOT NULL,
    [AssessmentSessionSpecialCircumstanceTypeDescription] NVARCHAR (300) NOT NULL,
    CONSTRAINT [PK_DimAssessmentParticipationSessions] PRIMARY KEY CLUSTERED ([DimAssessmentParticipationSessionId] ASC)
);


GO

