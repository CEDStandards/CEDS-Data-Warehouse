CREATE TABLE [RDS].[DimK12EnrollmentStatuses] (
    [DimK12EnrollmentStatusId]                                      INT            IDENTITY (1, 1) NOT NULL,
    [EnrollmentStatusCode]                                          NVARCHAR (50)  NULL,
    [EnrollmentStatusDescription]                                   NVARCHAR (50)  NULL,
    [EntryTypeCode]                                                 NVARCHAR (50)  NULL,
    [EntryTypeDescription]                                          NVARCHAR (200) NULL,
    [ExitOrWithdrawalTypeCode]                                      NVARCHAR (50)  NULL,
    [ExitOrWithdrawalTypeDescription]                               NVARCHAR (300) NULL,
    [PostSecondaryEnrollmentStatusCode]                             VARCHAR (50)   NULL,
    [PostSecondaryEnrollmentStatusDescription]                      VARCHAR (200)  NULL,
    [PostSecondaryEnrollmentStatusEdFactsCode]                      VARCHAR (50)   NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeCode]            VARCHAR (50)   NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeDescription]     VARCHAR (100)  NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeTypeEdFactsCode]     VARCHAR (50)   NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeCode]        VARCHAR (50)   NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeDescription] VARCHAR (100)  NULL,
    [EdFactsAcademicOrCareerAndTechnicalOutcomeExitTypeEdFactsCode] VARCHAR (50)   NULL,
    CONSTRAINT [PK_DimK12EnrollmentStatuses] PRIMARY KEY CLUSTERED ([DimK12EnrollmentStatusId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_Codes]
    ON [RDS].[DimK12EnrollmentStatuses]([EnrollmentStatusCode] ASC, [EntryTypeCode] ASC, [ExitOrWithdrawalTypeCode] ASC, [PostSecondaryEnrollmentStatusCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_DimK12EnrollmentStatuses_PostSecondaryEnrollmentStatusEdFactsCode]
    ON [RDS].[DimK12EnrollmentStatuses]([PostSecondaryEnrollmentStatusEdFactsCode] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38748 ', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12EnrollmentStatuses', @level2type = N'COLUMN', @level2name = N'EntryTypeCode';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38748', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12EnrollmentStatuses', @level2type = N'COLUMN', @level2name = N'EntryTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38752', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12EnrollmentStatuses', @level2type = N'COLUMN', @level2name = N'ExitOrWithdrawalTypeDescription';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'https://ceds.ed.gov/CEDSElementDetails.aspx?TermxTopicId=38746', @level0type = N'SCHEMA', @level0name = N'RDS', @level1type = N'TABLE', @level1name = N'DimK12EnrollmentStatuses', @level2type = N'COLUMN', @level2name = N'EnrollmentStatusCode';


GO

