CREATE TABLE [RDS].[DimMigrantStatuses] (
    [DimMigrantStatusId]                               INT            IDENTITY (1, 1) NOT NULL,
    [MigrantStatusCode]                                NVARCHAR (100) NOT NULL,
    [MigrantStatusDescription]                         NVARCHAR (300) NOT NULL,
    [MigrantStatusEdFactsCode]                         NVARCHAR (50)  NOT NULL,
    [MigrantEducationProgramEnrollmentTypeCode]        NVARCHAR (100) NOT NULL,
    [MigrantEducationProgramEnrollmentTypeDescription] NVARCHAR (300) NOT NULL,
    [ContinuationOfServicesReasonCode]                 NVARCHAR (100) NOT NULL,
    [ContinuationOfServicesReasonDescription]          NVARCHAR (300) NOT NULL,
    [ConsolidatedMepFundsStatusCode]                   NVARCHAR (100) NOT NULL,
    [MEPContinuationOfServicesStatusCode]              NVARCHAR (100) NOT NULL,
    [MEPContinuationOfServicesStatusDescription]       NVARCHAR (300) NOT NULL,
    [MEPContinuationOfServicesStatusEdFactsCode]       NVARCHAR (50)  NOT NULL,
    [ConsolidatedMepFundsStatusDescription]            NVARCHAR (300) NOT NULL,
    [ConsolidatedMepFundsStatusEdFactsCode]            NVARCHAR (50)  NOT NULL,
    [MigrantEducationProgramServicesTypeCode]          NVARCHAR (100) NOT NULL,
    [MigrantEducationProgramServicesTypeDescription]   NVARCHAR (300) NOT NULL,
    [MigrantEducationProgramServicesTypeEdFactsCode]   NVARCHAR (50)  NOT NULL,
    [MigrantPrioritizedForServicesCode]                NVARCHAR (100) NOT NULL,
    [MigrantPrioritizedForServicesDescription]         NVARCHAR (300) NOT NULL,
    [MigrantPrioritizedForServicesEdFactsCode]         NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimMigrantStatuses] PRIMARY KEY CLUSTERED ([DimMigrantStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_MepFundsStatusEdFactsCode]
    ON [RDS].[DimMigrantStatuses]([ConsolidatedMepFundsStatusEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_MepServicesEdFactsCode]
    ON [RDS].[DimMigrantStatuses]([MigrantEducationProgramServicesTypeEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_Codes]
    ON [RDS].[DimMigrantStatuses]([MEPContinuationOfServicesStatusCode] ASC, [ContinuationOfServicesReasonCode] ASC, [ConsolidatedMepFundsStatusCode] ASC, [MigrantEducationProgramServicesTypeCode] ASC, [MigrantPrioritizedForServicesCode] ASC, [MigrantEducationProgramEnrollmentTypeCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_MigrantPriorityForServicesEdFactsCode]
    ON [RDS].[DimMigrantStatuses]([MigrantPrioritizedForServicesEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_MEPContinuationOfServicesStatusEdFactsCode]
    ON [RDS].[DimMigrantStatuses]([MEPContinuationOfServicesStatusEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

