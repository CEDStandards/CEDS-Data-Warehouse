CREATE TABLE [Staging].[EducationOrganizationNetwork] (
    [Id]                                           INT            IDENTITY (1, 1) NOT NULL,
    [EducationOrganizationNetworkOrganizationName] NVARCHAR (100) NULL,
    [EducationOrganizationNetworkTypeCode]         NVARCHAR (100) NULL,
    [EducationOrganizationNetworkTypeDescription]  NVARCHAR (300) NULL,
    [EducationOrganizationNetworkIdentifierSea]    NVARCHAR (50)  NULL,
    [DataCollectionName]                           NVARCHAR (100) NULL,
    [RecordStartDateTime]                          DATETIME       NOT NULL,
    [RecordEndDateTime]                            DATETIME       NULL,
    [SchoolYear]                                   SMALLINT       NOT NULL,
    [RunDateTime]                                  DATETIME       NULL,
    CONSTRAINT [PK_EducationOrganizationNetworkOrganization] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

