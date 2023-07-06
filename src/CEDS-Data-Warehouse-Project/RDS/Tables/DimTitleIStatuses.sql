CREATE TABLE [RDS].[DimTitleIStatuses] (
    [DimTitleIStatusId]                      INT            IDENTITY (1, 1) NOT NULL,
    [TitleIInstructionalServicesCode]        NVARCHAR (50)  NULL,
    [TitleIInstructionalServicesDescription] NVARCHAR (100) NULL,
    [TitleIInstructionalServicesEdFactsCode] NVARCHAR (50)  NULL,
    [TitleIProgramTypeCode]                  NVARCHAR (50)  NULL,
    [TitleIProgramTypeDescription]           NVARCHAR (100) NULL,
    [TitleIProgramTypeEdFactsCode]           NVARCHAR (50)  NULL,
    [TitleISchoolStatusCode]                 NVARCHAR (50)  NULL,
    [TitleISchoolStatusDescription]          NVARCHAR (100) NULL,
    [TitleISchoolStatusEdFactsCode]          NVARCHAR (50)  NULL,
    [TitleISupportServicesCode]              NVARCHAR (50)  NULL,
    [TitleISupportServicesDescription]       NVARCHAR (100) NULL,
    [TitleISupportServicesEdFactsCode]       NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DimTitleIStatuses] PRIMARY KEY CLUSTERED ([DimTitleIStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1SchoolStatusEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleISchoolStatusEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1ProgramTypeEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIProgramTypeEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleISupportServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISupportServicesEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_Codes]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusCode] ASC, [TitleIInstructionalServicesCode] ASC, [TitleISupportServicesCode] ASC, [TitleIProgramTypeCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1InstructionalServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIInstructionalServicesEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Codes]
    ON [RDS].[DimTitleIStatuses]([TitleISchoolStatusCode] ASC, [TitleIInstructionalServicesCode] ASC, [TitleISupportServicesCode] ASC, [TitleIProgramTypeCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleIInstructionalServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIInstructionalServicesEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitle1Statuses_Title1SupportServicesEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleISupportServicesEdFactsCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimTitleIStatuses_TitleIProgramTypeEdFactsCode]
    ON [RDS].[DimTitleIStatuses]([TitleIProgramTypeEdFactsCode] ASC) WITH (DATA_COMPRESSION = PAGE);


GO

