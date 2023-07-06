CREATE TABLE [RDS].[DimAssessmentAdministrations] (
    [DimAssessmentAdministrationId]             INT            IDENTITY (1, 1) NOT NULL,
    [AssessmentIdentifier]                      NVARCHAR (40)  NULL,
    [AssessmentIdentificationSystem]            NVARCHAR (40)  NULL,
    [AssessmentAdministrationCode]              NVARCHAR (400) NULL,
    [AssessmentAdministrationName]              NVARCHAR (400) NULL,
    [AssessmentAdministrationStartDate]         DATETIME       NULL,
    [AssessmentAdministrationFinishDate]        DATETIME       NULL,
    [AssessmentAdministrationAssessmentFamily]  NVARCHAR (40)  NULL,
    [SchoolIdentifier]                          NVARCHAR (40)  NULL,
    [SchoolIdentificationSystem]                NVARCHAR (40)  NULL,
    [LocalEducationAgencyIdentifier]            NVARCHAR (40)  NULL,
    [LEAIdentificationSystem]                   NVARCHAR (40)  NULL,
    [AssessmentAdministrationOrganizationName]  NVARCHAR (40)  NULL,
    [AssessmentAdministrationPeriodDescription] NVARCHAR (40)  NULL,
    [AssessmentSecureIndicator]                 NVARCHAR (40)  NULL,
    CONSTRAINT [PK_DimAssessmentAdministrations] PRIMARY KEY CLUSTERED ([DimAssessmentAdministrationId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessmentAdministrations_AssessmentAdministrationIdentifier]
    ON [RDS].[DimAssessmentAdministrations]([AssessmentAdministrationCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimAssessmentAdministrations_AssessmentAdministrationSubjectEdFactsCode]
    ON [RDS].[DimAssessmentAdministrations]([AssessmentIdentifier] ASC);


GO

