CREATE TABLE [RDS].[DimComprehensiveAndTargetedSupports] (
    [DimComprehensiveAndTargetedSupportId]                     INT           IDENTITY (1, 1) NOT NULL,
    [ComprehensiveSupportIdentificationTypeCode]               VARCHAR (50)  NULL,
    [ComprehensiveSupportIdentificationTypeDescription]        VARCHAR (200) NULL,
    [ComprehensiveSupportIdentificationTypeEdFactsCode]        VARCHAR (50)  NULL,
    [AdditionalTargetedSupportAndImprovementStatusCode]        VARCHAR (50)  NULL,
    [AdditionalTargetedSupportAndImprovementStatusDescription] VARCHAR (200) NULL,
    [AdditionalTargetedSupportAndImprovementStatusEDFactsCode] VARCHAR (50)  NULL,
    [ComprehensiveSupportAndImprovementStatusCode]             VARCHAR (50)  NULL,
    [ComprehensiveSupportAndImprovementStatusDescription]      VARCHAR (200) NULL,
    [ComprehensiveSupportAndImprovementStatusEdFactsCode]      VARCHAR (50)  NULL,
    [TargetedSupportAndImprovementStatusCode]                  VARCHAR (50)  NULL,
    [TargetedSupportAndImprovementStatusDescription]           VARCHAR (200) NULL,
    [TargetedSupportAndImprovementStatusEdFactsCode]           VARCHAR (50)  NULL,
    CONSTRAINT [PK_DimComprehensiveAndTargetedSupport] PRIMARY KEY CLUSTERED ([DimComprehensiveAndTargetedSupportId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO

