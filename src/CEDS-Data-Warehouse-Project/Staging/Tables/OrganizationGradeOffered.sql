CREATE TABLE [Staging].[OrganizationGradeOffered] (
    [Id]                      INT            IDENTITY (1, 1) NOT NULL,
    [OrganizationIdentifier]  NVARCHAR (50)  NULL,
    [GradeOffered]            VARCHAR (100)  NULL,
    [K12SchoolGradeOfferedId] INT            NULL,
    [SchoolYear]              SMALLINT       NULL,
    [RecordStartDateTime]     DATETIME       NULL,
    [RecordEndDateTime]       DATETIME       NULL,
    [DataCollectionName]      NVARCHAR (100) NULL,
    [DataCollectionId]        INT            NULL,
    [OrganizationId]          INT            NULL,
    [RunDateTime]             DATETIME       NULL,
    CONSTRAINT [PK_OrganizationGradeOffered] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100, STATISTICS_NORECOMPUTE = ON, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_Staging_OrganizationGradesOffered_OrganizationId]
    ON [Staging].[OrganizationGradeOffered]([OrganizationId] ASC) WITH (FILLFACTOR = 100, STATISTICS_NORECOMPUTE = ON);


GO

