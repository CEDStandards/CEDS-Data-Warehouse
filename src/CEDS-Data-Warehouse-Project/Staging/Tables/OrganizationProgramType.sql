CREATE TABLE [Staging].[OrganizationProgramType] (
    [Id]                        INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifier]    NVARCHAR (50)  NULL,
    [OrganizationType]          NVARCHAR (100) NULL,
    [ProgramType]               NVARCHAR (50)  NULL,
    [RecordStartDateTime]       DATETIME       NULL,
    [RecordEndDateTime]         DATETIME       NULL,
    [SchoolYear]                SMALLINT       NULL,
    [DataCollectionName]        VARCHAR (50)   NULL,
    [DataCollectionId]          INT            NULL,
    [OrganizationId]            INT            NULL,
    [ProgramOrganizationId]     INT            NULL,
    [ProgramTypeId]             INT            NULL,
    [OrganizationProgramTypeId] INT            NULL,
    CONSTRAINT [PK_OrganizationProgramType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_OrganizationProgramType_ProgramType]
    ON [Staging].[OrganizationProgramType]([ProgramType] ASC)
    INCLUDE([SchoolYear], [ProgramTypeId]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_OrganizationProgramType_OrganizationType]
    ON [Staging].[OrganizationProgramType]([OrganizationType] ASC)
    INCLUDE([OrganizationIdentifier], [OrganizationId]) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_OrganizationProgramType_OrganizationId_ProgramTypeId]
    ON [Staging].[OrganizationProgramType]([OrganizationId] ASC, [ProgramTypeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_OrganizationProgramType_OrganizationId_ProgramOrganizationId]
    ON [Staging].[OrganizationProgramType]([OrganizationId] ASC, [ProgramOrganizationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

