CREATE TABLE [Staging].[OrganizationSchoolComprehensiveAndTargetedSupport] (
    [Id]                                     INT            IDENTITY (1, 1) NOT NULL,
    [SchoolIdentifierSea]                    NVARCHAR (50)  NOT NULL,
    [SchoolYear]                             SMALLINT       NULL,
    [School_ComprehensiveAndTargetedSupport] VARCHAR (100)  NULL,
    [School_ComprehensiveSupport]            VARCHAR (100)  NULL,
    [School_TargetedSupport]                 VARCHAR (100)  NULL,
    [DataCollectionName]                     NVARCHAR (100) NULL,
    CONSTRAINT [PK_OrganizationSchoolComprehensiveAndTargetedSupport] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

