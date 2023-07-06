CREATE TABLE [RDS].[DimCredentials] (
    [DimCredentialId]                                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [CredentialDefinitionTitle]                           NVARCHAR (300) NOT NULL,
    [CredentialDefinitionDescription]                     NVARCHAR (MAX) NOT NULL,
    [CredentialDefinitionAlternateName]                   NVARCHAR (300) NULL,
    [CredentialDefinitionCategorySystem]                  NVARCHAR (30)  NULL,
    [CredentialDefinitionCategoryType]                    NVARCHAR (60)  NULL,
    [CredentialDefinitionStatusTypeCode]                  NVARCHAR (50)  NULL,
    [CredentialDefinitionStatusTypeDescription]           NVARCHAR (300) NULL,
    [CredentialDefinitionIntendedPurposeTypeCode]         NVARCHAR (50)  NULL,
    [CredentialDefinitionIntendedPurposeTypeDescription]  NVARCHAR (300) NULL,
    [CredentialDefinitionAssessmentMethodTypeCode]        NVARCHAR (50)  NULL,
    [CredentialDefinitionAssessmentMethodTypeDescription] NVARCHAR (300) NULL,
    CONSTRAINT [PK_DimCredentials] PRIMARY KEY CLUSTERED ([DimCredentialId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_DimCredentials_Codes]
    ON [RDS].[DimCredentials]([CredentialDefinitionCategorySystem] ASC, [CredentialDefinitionCategoryType] ASC, [CredentialDefinitionStatusTypeCode] ASC, [CredentialDefinitionIntendedPurposeTypeCode] ASC, [CredentialDefinitionAssessmentMethodTypeCode] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_DimCredentials_CredentialDefinitionTitle]
    ON [RDS].[DimCredentials]([CredentialDefinitionTitle] ASC);


GO

