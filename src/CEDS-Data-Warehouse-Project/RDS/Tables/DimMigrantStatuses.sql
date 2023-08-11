CREATE TABLE [RDS].[DimMigrantStatuses] (
    [DimMigrantStatusId]                               INT            IDENTITY (1, 1) NOT NULL,
    [MigrantStatusCode]                                NVARCHAR (100) NOT NULL,
    [MigrantStatusDescription]                         NVARCHAR (300) NOT NULL,
    [MigrantStatusEdFactsCode]                         NVARCHAR (50)  NOT NULL,
    [MigrantEducationProgramEnrollmentTypeCode]        NVARCHAR (100) NOT NULL,
    [MigrantEducationProgramEnrollmentTypeDescription] NVARCHAR (300) NOT NULL,
    [ContinuationOfServicesReasonCode]                 NVARCHAR (100) NOT NULL,
    [ContinuationOfServicesReasonDescription]          NVARCHAR (300) NOT NULL,
    [MEPContinuationOfServicesStatusCode]              NVARCHAR (100) NOT NULL,
    [MEPContinuationOfServicesStatusDescription]       NVARCHAR (300) NOT NULL,
    [MEPContinuationOfServicesStatusEdFactsCode]       NVARCHAR (50)  NOT NULL,
    [ConsolidatedMEPFundsStatusCode]                   NVARCHAR (100) NOT NULL,
    [ConsolidatedMEPFundsStatusDescription]            NVARCHAR (300) NOT NULL,
    [ConsolidatedMEPFundsStatusEdFactsCode]            NVARCHAR (50)  NOT NULL,
    [MigrantEducationProgramServicesTypeCode]          NVARCHAR (100) NOT NULL,
    [MigrantEducationProgramServicesTypeDescription]   NVARCHAR (300) NOT NULL,
    [MigrantEducationProgramServicesTypeEdFactsCode]   NVARCHAR (50)  NOT NULL,
    [MigrantPrioritizedForServicesCode]                NVARCHAR (100) NOT NULL,
    [MigrantPrioritizedForServicesDescription]         NVARCHAR (300) NOT NULL,
    [MigrantPrioritizedForServicesEdFactsCode]         NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_DimMigrantStatuses] PRIMARY KEY CLUSTERED ([DimMigrantStatusId] ASC) WITH (FILLFACTOR = 80)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_MEPFundsStatusEdFactsCode]
    ON [RDS].[DimMigrantStatuses]([ConsolidatedMepFundsStatusEdFactsCode] ASC) WITH (FILLFACTOR = 80);


GO

CREATE NONCLUSTERED INDEX [IX_DimMigrantStatuses_MigrantEducationProgramServicesEdFactsCode]
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school has a school-wide program, as defined by current law, in which federal Migrant Education Program (MEP) funds are consolidated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Consolidated Migrant Education Program Funds Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000542' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21533' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school has a school-wide program, as defined by current law, in which federal Migrant Education Program (MEP) funds are consolidated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Consolidated Migrant Education Program Funds Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000542' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21533' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication of whether the school has a school-wide program, as defined by current law, in which federal Migrant Education Program (MEP) funds are consolidated.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Consolidated Migrant Education Program Funds Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000542' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21533' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ConsolidatedMepFundsStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Reason why the student is being served under the continuation of services provision of the MEP.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Continuation of Services Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000429' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21419' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Reason why the student is being served under the continuation of services provision of the MEP.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Continuation of Services Reason' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000429' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21419' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'ContinuationOfServicesReasonDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of school/migrant education project in which instruction and/or support services are provided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Enrollment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21427' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of school/migrant education project in which instruction and/or support services are provided.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Enrollment Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000437' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21427' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramEnrollmentTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services received by participating migrant students in the migrant education program (MEP).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Services Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services received by participating migrant students in the migrant education program (MEP).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Services Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The type of services received by participating migrant students in the migrant education program (MEP).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Services Type' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21186' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantEducationProgramServicesTypeEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a migratory child 1) is failing to meet, or most at risk of failing to meet, the state''s challenging academic content standards and student academic achievement standards; and 2) has experienced interruptions in their education during the regular school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Prioritized for Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000562' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21554' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a migratory child 1) is failing to meet, or most at risk of failing to meet, the state''s challenging academic content standards and student academic achievement standards; and 2) has experienced interruptions in their education during the regular school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Prioritized for Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000562' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21554' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that a migratory child 1) is failing to meet, or most at risk of failing to meet, the state''s challenging academic content standards and student academic achievement standards; and 2) has experienced interruptions in their education during the regular school year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Prioritized for Services' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000562' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21554' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantPrioritizedForServicesEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'Persons who are, or whose parents or spouses are, migratory agricultural workers, including migratory dairy workers, or migratory fishers, and who, in the preceding 36 months, in order to obtain, or accompany such parents or spouses, in order to obtain, temporary or seasonal employment in agricultural or fishing work (A) have moved from one LEA to another; (B) in a state that comprises a single LEA, have moved from one administrative area to another within such LEA; or (C) reside in an LEA of more than 15,000 square miles, and migrate a distance of 20 miles or more to a temporary residence to engage in a fishing activity.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21189' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MigrantStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that migrant children are receiving instructional or support services under the continuation of services authority ESEA Title III Section 1304(e)(2)-(3).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Continuation of Services Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000563' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusCode';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that migrant children are receiving instructional or support services under the continuation of services authority ESEA Title III Section 1304(e)(2)-(3).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Continuation of Services Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000563' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusDescription';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'An indication that migrant children are receiving instructional or support services under the continuation of services authority ESEA Title III Section 1304(e)(2)-(3).' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Migrant Education Program Continuation of Services Status' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'000563' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusEdFactsCode';
GO
EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=21555' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'DimMigrantStatuses', @level2type=N'COLUMN',@level2name=N'MEPContinuationOfServicesStatusEdFactsCode';
GO