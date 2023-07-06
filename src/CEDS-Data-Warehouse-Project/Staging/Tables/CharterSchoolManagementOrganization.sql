CREATE TABLE [Staging].[CharterSchoolManagementOrganization] (
    [Id]                                                           INT            IDENTITY (1, 1) NOT NULL,
    [CharterSchoolManagementOrganizationOrganizationIdentifierEIN] NVARCHAR (50)  NULL,
    [CharterSchoolManagementOrganizationType]                      VARCHAR (100)  NULL,
    [CharterSchoolManagementOrganizationOrganizationName]          VARCHAR (100)  NULL,
    [OrganizationIdentifier]                                       NVARCHAR (50)  NULL,
    [SchoolYear]                                                   SMALLINT       NULL,
    [RecordStartDateTime]                                          DATETIME       NULL,
    [RecordEndDateTime]                                            DATETIME       NULL,
    [DataCollectionName]                                           NVARCHAR (100) NULL,
    [CharterSchoolManagementOrganizationOrganizationId]            INT            NOT NULL,
    [CharterSchoolId]                                              INT            NOT NULL,
    [RunDateTime]                                                  DATETIME       NULL,
    CONSTRAINT [PK_CharterSchoolManagementOrganization] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

