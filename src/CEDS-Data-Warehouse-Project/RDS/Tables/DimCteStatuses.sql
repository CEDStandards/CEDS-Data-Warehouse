CREATE TABLE [RDS].[DimCteStatuses] (
    [DimCteStatusId]                                     INT            IDENTITY (1, 1) NOT NULL,
    [CteAeDisplacedHomemakerIndicatorCode]               NVARCHAR (50)  NULL,
    [CteAeDisplacedHomemakerIndicatorDescription]        NVARCHAR (200) NULL,
    [CteAeDisplacedHomemakerIndicatorEdFactsCode]        NVARCHAR (50)  NULL,
    [CteNontraditionalGenderStatusCode]                  NVARCHAR (50)  NULL,
    [CteNontraditionalGenderStatusDescription]           NVARCHAR (200) NULL,
    [CteNontraditionalGenderStatusEdFactsCode]           NVARCHAR (50)  NULL,
    [CteNontraditionalCompletionCode]                    NVARCHAR (50)  NULL,
    [CteNontraditionalCompletionDescription]             NVARCHAR (200) NULL,
    [CteNontraditionalCompletionEdFactsCode]             NVARCHAR (50)  NULL,
    [SingleParentOrSinglePregnantWomanStatusCode]        NVARCHAR (50)  NULL,
    [SingleParentOrSinglePregnantWomanStatusDescription] NVARCHAR (200) NULL,
    [SingleParentOrSinglePregnantWomanStatusEdFactsCode] NVARCHAR (50)  NULL,
    [CteGraduationRateInclusionCode]                     NVARCHAR (450) NULL,
    [CteGraduationRateInclusionDescription]              NVARCHAR (200) NULL,
    [CteGraduationRateInclusionEdFactsCode]              NVARCHAR (50)  NULL,
    [CteParticipantCode]                                 NVARCHAR (50)  NULL,
    [CteParticipantDescription]                          NVARCHAR (200) NULL,
    [CteParticipantEdFactsCode]                          NVARCHAR (50)  NULL,
    [CteConcentratorCode]                                NVARCHAR (50)  NULL,
    [CteConcentratorDescription]                         NVARCHAR (200) NULL,
    [CteConcentratorEdFactsCode]                         NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimCteStatuses] PRIMARY KEY CLUSTERED ([DimCteStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

