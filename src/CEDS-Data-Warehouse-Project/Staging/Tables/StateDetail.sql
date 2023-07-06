CREATE TABLE [Staging].[StateDetail] (
    [Id]                               INT            IDENTITY (1, 1) NOT NULL,
    [StateAbbreviationCode]            CHAR (2)       NULL,
    [SeaOrganizationName]              NVARCHAR (250) NULL,
    [SeaOrganizationShortName]         NVARCHAR (20)  NULL,
    [SeaOrganizationIdentifierSea]     NVARCHAR (7)   NULL,
    [Sea_WebSiteAddress]               NVARCHAR (300) NULL,
    [SeaContact_FirstName]             NVARCHAR (100) NULL,
    [SeaContact_LastOrSurname]         NVARCHAR (100) NULL,
    [SeaContact_PersonalTitleOrPrefix] NVARCHAR (100) NULL,
    [SeaContact_ElectronicMailAddress] NVARCHAR (127) NULL,
    [SeaContact_PhoneNumber]           NVARCHAR (100) NULL,
    [SeaContact_Identifier]            NVARCHAR (100) NULL,
    [SeaContact_PositionTitle]         NVARCHAR (100) NULL,
    [CteGraduationRateInclusion]       NVARCHAR (100) NULL,
    [SchoolYear]                       SMALLINT       NULL,
    [RecordStartDateTime]              DATETIME       NULL,
    [RecordEndDateTime]                DATETIME       NULL,
    [DataCollectionName]               NVARCHAR (100) NULL,
    [DataCollectionId]                 INT            NULL,
    [PersonId]                         INT            NULL,
    [OrganizationId]                   INT            NULL,
    [RunDateTime]                      DATETIME       NULL,
    CONSTRAINT [PK_StateDetail] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

