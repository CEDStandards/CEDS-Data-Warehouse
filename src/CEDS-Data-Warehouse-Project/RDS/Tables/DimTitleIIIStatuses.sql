CREATE TABLE [RDS].[DimTitleIIIStatuses] (
    [DimTitleIIIStatusId]                               INT            IDENTITY (1, 1) NOT NULL,
    [ProgramParticipationTitleIIILiepCode]              NVARCHAR (50)  NULL,
    [ProgramParticipationTitleIIILiepDescription]       NVARCHAR (200) NULL,
    [TitleIIIImmigrantParticipationStatusCode]          NVARCHAR (50)  NULL,
    [TitleIIIImmigrantParticipationStatusDescription]   NVARCHAR (200) NULL,
    [TitleIIIImmigrantParticipationStatusEdFactsCode]   NVARCHAR (50)  NULL,
    [ProficiencyStatusCode]                             NVARCHAR (50)  NULL,
    [ProficiencyStatusDescription]                      NVARCHAR (100) NULL,
    [ProficiencyStatusEdFactsCode]                      NVARCHAR (50)  NULL,
    [TitleIIIAccountabilityProgressStatusCode]          NVARCHAR (50)  NULL,
    [TitleIIIAccountabilityProgressStatusDescription]   NVARCHAR (100) NULL,
    [TitleIIIAccountabilityProgressStatusEdFactsCode]   NVARCHAR (50)  NULL,
    [TitleIIILanguageInstructionProgramTypeCode]        NVARCHAR (50)  NULL,
    [TitleIIILanguageInstructionProgramTypeDescription] NVARCHAR (100) NULL,
    [TitleIIILanguageInstructionProgramTypeEdFactsCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimTitleIIIStatuses] PRIMARY KEY CLUSTERED ([DimTitleIIIStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

