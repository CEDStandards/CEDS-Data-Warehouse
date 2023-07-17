CREATE TABLE [Staging].[CharterSchoolAuthorizer] (
    [Id]                                                            INT            IDENTITY (1, 1) NOT NULL,
    [CharterSchoolAuthorizingOrganizationOrganizationIdentifierSea] NVARCHAR (50)  NULL,
    [CharterSchoolAuthorizerType]                                   VARCHAR (100)  NULL,
    [CharterSchoolAuthorizingOrganizationOrganizationName]          VARCHAR (100)  NULL,
    [SchoolYear]                                                    SMALLINT       NULL,
    [RecordStartDateTime]                                           DATETIME       NULL,
    [RecordEndDateTime]                                             DATETIME       NULL,
    [DataCollectionName]                                            NVARCHAR (100) NULL,
    [CharterSchoolId]                                               INT            NULL,
    [CharterSchoolAuthorizingOrganizationOrganizationId]            INT            NULL,
    [RunDateTime]                                                   DATETIME       NULL,
    CONSTRAINT [PK_CharterSchoolAuthorizer] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

