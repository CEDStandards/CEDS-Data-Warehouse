CREATE TABLE [RDS].[DimIdeaStatuses] (
    [DimIdeaStatusId]                                        INT            IDENTITY (1, 1) NOT NULL,
    [SpecialEducationExitReasonCode]                         NVARCHAR (50)  NULL,
    [SpecialEducationExitReasonDescription]                  NVARCHAR (200) NULL,
    [SpecialEducationExitReasonEdFactsCode]                  NVARCHAR (50)  NULL,
    [IdeaEducationalEnvironmentForSchoolAgeDescription]      NVARCHAR (200) NULL,
    [IdeaEducationalEnvironmentForSchoolAgeCode]             NVARCHAR (50)  NULL,
    [IdeaEducationalEnvironmentForSchoolAgeEdFactsCode]      NVARCHAR (50)  NULL,
    [IdeaIndicatorCode]                                      NVARCHAR (50)  NULL,
    [IdeaIndicatorDescription]                               NVARCHAR (200) NULL,
    [IdeaIndicatorEdFactsCode]                               NVARCHAR (50)  NULL,
    [IdeaEducationalEnvironmentForEarlyChildhoodCode]        NVARCHAR (50)  NULL,
    [IdeaEducationalEnvironmentForEarlyChildhoodDescription] NVARCHAR (200) NULL,
    [IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimIdeaStatuses] PRIMARY KEY CLUSTERED ([DimIdeaStatusId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_BasisOfExitEdFactsCode]
    ON [RDS].[DimIdeaStatuses]([SpecialEducationExitReasonEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_EducEnvSchoolAgeEdFactsCode]
    ON [RDS].[DimIdeaStatuses]([IdeaEducationalEnvironmentForSchoolAgeEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_Codes]
    ON [RDS].[DimIdeaStatuses]([SpecialEducationExitReasonCode] ASC, [IdeaEducationalEnvironmentForSchoolAgeCode] ASC, [IdeaEducationalEnvironmentForEarlyChildhoodCode] ASC, [IdeaIndicatorCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimIdeaStatuses_EducEnvEarlyChildhoodEdFactsCode]
    ON [RDS].[DimIdeaStatuses]([IdeaEducationalEnvironmentForEarlyChildhoodEdFactsCode] ASC);


GO

