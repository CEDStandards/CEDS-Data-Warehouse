CREATE TABLE [Staging].[K12SchoolComprehensiveSupportIdentificationType] (
    [Id]                                      INT           IDENTITY (1, 1) NOT NULL,
    [SchoolYear]                              VARCHAR (4)   NULL,
    [LEAIdentifierSea]                        VARCHAR (100) NULL,
    [SchoolIdentifierSea]                     VARCHAR (100) NULL,
    [ComprehensiveSupport]                    VARCHAR (20)  NULL,
    [ComprehensiveSupportReasonApplicability] VARCHAR (20)  NULL,
    [RecordStartDateTime]                     DATETIME      NULL,
    [RecordEndDateTime]                       DATETIME      NULL,
    [OrganizationId]                          INT           NULL,
    [K12SchoolId]                             INT           NULL,
    [RunDateTime]                             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'ComprehensiveSupportReasonApplicability';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'SchoolIdentifierSea';


GO

EXECUTE sp_addextendedproperty @name = N'TableType', @value = N'Migration', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'RecordStartDateTime';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefComprehensiveSupport', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'ComprehensiveSupport';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO

EXECUTE sp_addextendedproperty @name = N'Identifier', @value = N'IDS', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'OrganizationId';


GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefComprehensiveSupportReasonApplicability', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'ComprehensiveSupportReasonApplicability';


GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'LEAIdentifierSea';


GO

EXECUTE sp_addextendedproperty @name = N'Identifier', @value = N'IDS', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'K12SchoolComprehensiveSupportIdentificationType', @level2type = N'COLUMN', @level2name = N'K12SchoolId';


GO

