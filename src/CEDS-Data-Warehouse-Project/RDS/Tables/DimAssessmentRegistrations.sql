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

