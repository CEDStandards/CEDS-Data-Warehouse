CREATE TABLE [Staging].[EarlyLearningOrganization] (
    [EarlyLearningOrganizationIdentifierSea] NVARCHAR (50)  NULL,
    [WebSiteAddress]                         NVARCHAR (300) NULL,
    [OperationalStatusEffectiveDate]         DATETIME       NULL,
    [OrganizationName]                       NVARCHAR (100) NULL,
    [OrganizationOperationalStatus]          NVARCHAR (100) NULL,
    [DataCollectionName]                     NVARCHAR (100) NULL,
    [OrganizationId]                         INT            NULL,
    [OrganizationOperationalStatusId]        INT            NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO

