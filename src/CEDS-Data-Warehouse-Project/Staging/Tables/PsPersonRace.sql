CREATE TABLE [Staging].[PsPersonRace] (
    [Id]                          INT            IDENTITY (1, 1) NOT NULL,
    [StudentIdentifierState]      VARCHAR (100)  NULL,
    [InstitutionIpedsUnitId]      VARCHAR (100)  NULL,
    [RaceType]                    VARCHAR (100)  NULL,
    [AcademicTermDesignator]      VARCHAR (100)  NULL,
    [SchoolYear]                  SMALLINT       NULL,
    [RecordStartDateTime]         DATETIME       NULL,
    [RecordEndDateTime]           DATETIME       NULL,
    [DataCollectionName]          NVARCHAR (100) NULL,
    [PersonId]                    INT            NULL,
    [PersonDemographicRaceId]     INT            NULL,
    [OrganizationId]              INT            NULL,
    [RefRaceId]                   INT            NULL,
    [RefAcademicTermDesignatorId] INT            NULL,
    [RunDateTime]                 DATETIME       NULL,
    CONSTRAINT [PK_PsPersonRace] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE)
);


GO

CREATE NONCLUSTERED INDEX [IX_PsPersonRace_RefRaceId]
    ON [Staging].[PsPersonRace]([RefRaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_PsPersonRace_RefAcademicTermDesignatorId]
    ON [Staging].[PsPersonRace]([RefAcademicTermDesignatorId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_PsPersonRace_RecordStartDateTime]
    ON [Staging].[PsPersonRace]([RecordStartDateTime] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_PsPersonRace_PersonDemographicRaceId]
    ON [Staging].[PsPersonRace]([PersonDemographicRaceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_PsPersonRace_InstitutionIpedsUnitId]
    ON [Staging].[PsPersonRace]([InstitutionIpedsUnitId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);


GO

CREATE NONCLUSTERED INDEX [IX_PsPersonRace_DataCollectionName]
    ON [Staging].[PsPersonRace]([DataCollectionName] ASC)
    INCLUDE([AcademicTermDesignator], [InstitutionIpedsUnitId], [RaceType], [RecordEndDateTime], [RecordStartDateTime], [SchoolYear], [StudentIdentifierState]);


GO

