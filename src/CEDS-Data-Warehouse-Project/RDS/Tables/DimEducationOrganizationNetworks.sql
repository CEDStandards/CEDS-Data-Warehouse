CREATE TABLE [RDS].[DimEducationOrganizationNetworks] (
    [DimEducationOrganizationNetworkId] INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifierSea]         NVARCHAR (50)  NOT NULL,
    [OrganizationTypeCode]              NVARCHAR (100) NOT NULL,
    [OrganizationTypeDescription]       NVARCHAR (300) NOT NULL,
    [OrganizationName]                  NVARCHAR (60)  NOT NULL,
    [RecordStartDateTime]               DATETIME       NOT NULL,
    [RecordEndDateTime]                 DATETIME       NULL,
    CONSTRAINT [PK_DimEducationOrganizationNetworkId] PRIMARY KEY CLUSTERED ([DimEducationOrganizationNetworkId] ASC)
);


GO

